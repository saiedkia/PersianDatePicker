//
//  PersianDatePickerUnitTests.swift
//  PersianDatePickerUnitTests
//
//  Created by salar on 8/27/19.
//  Copyright © 2019 Farhad. All rights reserved.
//

import XCTest
@testable import PersianDatePicker
class PersianDatePickerUnitTests: XCTestCase {

    private let unixTime = 1566888214
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_localTime() {
        let expected = "1398/06/05 11:13:34 AM"
        
        let persianCalendar = PersianCalendar(unixTime: unixTime)
        
        XCTAssertEqual(expected, persianCalendar?.string())
    }
    
    
    func test_gmtTime() {
        let expected = "2019/08/27 06:43:34 AM"
        
        let gmtDateTime = PersianCalendar(unixTime: unixTime)?.toTimeZone(timeZone: TimeZone(identifier: "GMT")!)
        
        XCTAssertEqual(expected, gmtDateTime?.string())
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
