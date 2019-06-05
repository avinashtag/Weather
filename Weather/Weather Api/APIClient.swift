//
//  APIClient.swift
//  Weather
//
//  Created by Avinash  Tag on 05/06/2019.
//  Copyright © 2019 Avinash  Tag. All rights reserved.
//

import Foundation
import DataCache


enum APIResult<T, U> where U: Error  {
    case success(T)
    case failure(U)
}


enum APIError: Error {
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful(String)
    case noNetwork
    case jsonParsingFailure
    case notFound(String) // just to handle user deactivated
    
    struct ErrorResponse: Codable
    {
        var message:String?
    }
    
    var localizedDescription: String {
        switch self {
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case let .responseUnsuccessful ( error): return error
        case .jsonParsingFailure: return Localisable.somethingWrong
        case .jsonConversionFailure: return Localisable.somethingWrong
        case .noNetwork: return "The Internet connection appears to be offline"
        case let .notFound (error) : return  error
        }
    }
}

enum GenericResponse {
    struct Result: Codable {
        var message : String?
    }
}

protocol APIClient {
    
    var session: URLSession { get }
    func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (APIResult<T?, APIError>) -> Void)
}

extension APIClient {
    
    func onConsole(url: String? , response: String? ) {
        #if DEBUG
        guard url == nil else{
            print("**********************************************\nURL: <\(url ?? "")>")
            return
        }
        guard response == nil else{
            print("RESPONSE: <\(response ?? "NIL")>\n**********************************************")
            return
        }
        #endif
        
    }
    
    
    typealias JSONTaskCompletionHandler = (Decodable?, APIError?) -> Void
    
    func decodingTask<T: Decodable>(with request: URLRequest, decodingType: T.Type, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        let task = session.dataTask(with: request) { data, response, error in
            
            
            self.onConsole(url: request.url?.absoluteString, response: nil)
            
            guard error == nil else{
                self.onConsole(url: nil, response: error!.localizedDescription)
                
                guard (error as NSError?)?.code != -1009 || request.httpMethod == AZConstants.GET else{
                    completion(nil, .noNetwork)
                    return
                }
                guard let cachedData = DataCache.instance.readData(forKey: request.url?.absoluteString ?? "key") else{
                    completion(nil, .responseUnsuccessful(error!.localizedDescription))
                    return
                }
                do{
                    //MARK: Cache Success Case APIError is nil
                    let genericModel = try JSONDecoder().decode(decodingType, from: cachedData)
                    completion(genericModel, nil)
                }catch{
                    completion(nil, .jsonConversionFailure)
                }
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                self.onConsole(url: nil, response: APIError.requestFailed.localizedDescription)
                completion(nil, .requestFailed)
                return
            }
            guard let data = data else{
                completion(nil, .invalidData)
                return
            }
            self.onConsole(url: nil, response: String(data: data, encoding: String.Encoding.utf8))
            guard httpResponse.statusCode != 401 else{
                
                //                let genericModel = try? JSONDecoder().decode(APIError.ErrorResponse.self, from: data)
                let errormessage = Localisable.unauthorizedAccess
                Activity.flash(.labeledError(title: Localisable.unauthorizedAccessTitle, subtitle: errormessage), delay: 3.0)
                DispatchQueue.main.async {
                    let _ = AppUtility.sharedInstance.deleteAuthTokenAZ()
                    (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController?.dismiss(animated: true, completion: nil)
                }
                return
            }
            guard httpResponse.statusCode != 404 else{
                do{
                    let genericModel = try JSONDecoder().decode(APIError.ErrorResponse.self, from: data)
                    completion(nil, .notFound(genericModel.message ?? Localisable.somethingWrong))
                }catch{
                    completion(nil, .notFound(Localisable.somethingWrong))
                }
                return
            }
            guard httpResponse.statusCode == 200 || httpResponse.statusCode == 201 else{
                do{
                    let genericModel = try JSONDecoder().decode(APIError.ErrorResponse.self, from: data)
                    completion(nil, .responseUnsuccessful(genericModel.message ?? Localisable.somethingWrong))
                    
                }catch{
                    completion(nil, .jsonConversionFailure)
                }
                return
            }
            do{
                //MARK: Success Case APIError is nil
                let genericModel = try JSONDecoder().decode(decodingType, from: data)
                if request.httpMethod == AZConstants.GET{
                    DataCache.instance.write(data: data, forKey: request.url?.absoluteString ?? "key")
                }
                completion(genericModel, nil)
            }catch{
                completion(nil, .jsonConversionFailure)
            }
        }
        return task
    }
    
    func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (APIResult<T?, APIError>) -> Void) {
        let task = decodingTask(with: request, decodingType: T.self) { (json , error) in
            
            
            guard error == nil else{
                switch error! {
                case .notFound:
                    completion(.failure(.notFound(error?.localizedDescription ?? Localisable.somethingWrong)))
                    break
                case .noNetwork:
                    completion(.failure(.noNetwork))
                    break
                default:
                    completion(.failure(.responseUnsuccessful(error?.localizedDescription ?? Localisable.somethingWrong)))
                    break
                }
                return
            }
            guard json != nil  else{
                completion(.failure(.jsonParsingFailure))
                return
            }
            guard let value = decode(json!) else{
                completion(.failure(.jsonParsingFailure))
                return
            }
            completion(.success(value))
        }
        task.resume()
    }
}

extension Localisable{
    
    static let unauthorizedAccess = "unauthorizedAccess".localized()
    static let unauthorizedAccessTitle = "unauthorizedAccessTitle".localized()
    
}
