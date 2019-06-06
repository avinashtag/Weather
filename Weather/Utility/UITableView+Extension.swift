//
//  UITableView+Extension.swift
//  Weather
//
//  Created by Avinash  Tag on 06/06/2019.
//  Copyright © 2019 Avinash  Tag. All rights reserved.
//

import Foundation
import UIKit

extension UITableView{
   

    struct Extension {
        typealias RefreshControlTarget = (()->Void)?
        static var refreshControlTarget : RefreshControlTarget = RefreshControlTarget(nilLiteral: ())
        static var refreshcontrol: UIRefreshControl = UIRefreshControl()
    }
   
    
    private var refreshControlTarget: Extension.RefreshControlTarget {
        get {
            return Extension.refreshControlTarget
        }
        set(newValue) {
            Extension.refreshControlTarget = newValue
        }
    }
    func addRefreshControl(title: String, _ completion: Extension.RefreshControlTarget)  {
        
        self.refreshControlTarget  = completion
        self.refreshControl = Extension.refreshcontrol
        self.refreshControl?.tintColor = .black
        self.refreshControl?.attributedTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.black])
        self.refreshControl?.addTarget(self, action: #selector(refreshTarget(sender:)), for: .valueChanged)
    }
    
    @objc func refreshTarget(sender:Any)  {
        self.refreshControlTarget?()
    }
    
}
