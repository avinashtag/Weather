//
//  Date+Extension.swift
//  Weather
//
//  Created by Avinash  Tag on 06/06/2019.
//  Copyright © 2019 Avinash  Tag. All rights reserved.
//

import Foundation

extension Date{
    
    func string( format:String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: self)
    }
    
    func weatherDate() -> String {
        
        guard Calendar.current.isDateInToday(self) else{
            return string(format: "dd MMM, yyyy hh:mm a")
        }
        return string(format: "EEEE hh:mm a")
    }

}
