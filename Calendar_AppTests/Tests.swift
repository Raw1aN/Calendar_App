//
//  Tests.swift
//  Calendar_AppTests
//
//  Created by Алексей Щукин on 10.07.2023.
//

import XCTest
@testable import Calendar_App

final class Tests: XCTestCase {

// MARK: - Succes Json Service Testing
    func testSuccesJsonWorkGet() {
        let jsonService = JsonService()
        jsonService.getWorks { result in
            XCTAssertEqual(result[0].name, "Wash the dishes")
        }
    }
    
// MARK: - Wrong Json Service Testing
    func testWrongJsonWorkGet() {
        let jsonService = JsonService()
        jsonService.getWorks { result in
            XCTAssertNotEqual(result[0].name, "Hello")
        }
    }

}
