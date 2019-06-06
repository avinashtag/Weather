//
//  String+Extension.swift
//  Weather
//
//  Created by Avinash  Tag on 05/06/2019.
//  Copyright © 2019 Avinash  Tag. All rights reserved.
//

import Foundation

extension String{
    
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }

}
