//
//  UIViewController+Extension.swift
//  Weather
//
//  Created by Avinash  Tag on 06/06/2019.
//  Copyright © 2019 Avinash  Tag. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    // Presesent error alert with message 
    func present(error: Constant.Error, completion: ( ()-> Void)? ) {
        DispatchQueue.main.async {
            UINotificationFeedbackGenerator().notificationOccurred(.error)
            
            let alertController = UIAlertController(title: Localisable.error, message: error.info, preferredStyle: .alert)
            alertController.addAction(UIAlertAction.init(title: "Okay".localized(), style: .default, handler: { (action) in
                completion?()
            }))
            self.present(alertController, animated: true, completion: nil)

        }
    }
}

extension Localisable{
    static let error = "error".localized()
}
