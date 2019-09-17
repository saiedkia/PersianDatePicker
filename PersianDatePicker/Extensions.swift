//
//  Extensions.swift
//  PersianDatePicker
//
//  Created by salar on 8/26/19.
//  Copyright © 2019 Farhad. All rights reserved.
//

import Foundation

extension Date {
    public func toUnixTime() -> Double {
        return self.timeIntervalSince1970
    }
    
    public func string(dateFormat:String = "yyyy/MM/dd HH:mm:ss a") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        
        return formatter.string(from: self)
    }
}
