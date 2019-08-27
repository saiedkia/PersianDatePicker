//
//  PersianCalendar.swift
//  PersianDatePicker
//
//  Created by salar on 8/27/19.
//  Copyright © 2019 Farhad. All rights reserved.
//

import Foundation

public class PersianCalendar {
    let date:Date
    let timeZone:TimeZone
    let formater:DateFormatter
    
    public convenience init?(unixTime:CLong) {
        if unixTime < 0 { return nil }
        
        self.init(date: Date(timeIntervalSince1970: TimeInterval(unixTime)))
    }
    
    public convenience init() {
        self.init(date: Date())
    }
    
    public init(date:Date) {
        let formatter = DateFormatter()
        timeZone = TimeZone(identifier: "Asia/Tehran")!
        self.date = date
        formatter.timeZone = timeZone
        formatter.defaultDate = self.date
        formatter.calendar = Calendar(identifier: .persian)
        self.formater = formatter
    }
    
    public convenience init?(string:String, dateFormat:String) {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        let date = formatter.date(from: string)
        
        if date == nil { return nil}
        
        self.init(date: date!)
    }
    
    public func string(_ dateFormat:String? = "yyyy/MM/dd HH:mm:ss a") -> String {
        if dateFormat != nil {
            formater.dateFormat = dateFormat
        }
        
        return formater.string(from: date)
    }
    
    public func toTimeZone(timeZone:TimeZone) -> Date {
        let formatter = DateFormatter()
        
        formatter.timeZone = timeZone
        formatter.defaultDate = date
        
        let delta = TimeInterval(timeZone.secondsFromGMT() - self.timeZone.secondsFromGMT())
        return date.addingTimeInterval(delta)
    }
    
}
