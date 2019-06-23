//
//  String+Extension.swift
//  Weather
//
//  Created by Avinash  Tag on 05/06/2019.
//  Copyright © 2019 Avinash  Tag. All rights reserved.
//

import Foundation
import UIKit

extension String{
    
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }

}

extension NSObject{
    
    var theme: Setting.Theme{
        if let theme = UserDefaults.standard.retrieveTheme(Setting.Theme.self) as? Setting.Theme{
            return theme
        }
        else{
            let createTheme = Setting.Theme()
            UserDefaults.standard.saveTheme(createTheme )
            return createTheme
        }
    }
}

extension UserDefaults {
    open func saveTheme<T: Codable>(_ value: T?){
        let data = try? JSONEncoder().encode(value)
        set(data, forKey: "weatherTheme")
    }
    
    open func retrieveTheme<T>(_ type: T.Type) -> T? where T : Decodable {
        guard let encodedData = data(forKey: "weatherTheme") else {
            return nil
        }
        return try! JSONDecoder().decode(type, from: encodedData)
    }
}

extension Double{
    
    func clean() -> String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(format: "%.2f", self)
    }
    
    func celcius() -> String {
        return (self - 273.15).rounded().clean()
    }
    
    func fahrenheit() -> String {
        return ((self - 273.15) * 9/5 + 32).rounded().clean()
    }
    
    func kmPerHr() -> String {
        return (self * 3.6).rounded().clean()
    }
    
    func milesPerHr() -> String {
        return (self * 2.237).rounded().clean()
    }
}

extension UIImageView{
    
    func image( url: URL, completion:@escaping (Data?) -> Void )  {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data{
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                    completion(data)
                }
            }
        }.resume()
    }
}
