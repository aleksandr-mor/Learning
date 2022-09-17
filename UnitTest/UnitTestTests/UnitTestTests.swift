//
//  UnitTestTests.swift
//  UnitTestTests
//
//  Created by Aleksandr Morozov on 17.09.2022.
//

import XCTest
@testable import UnitTest

final class UnitTestTests: XCTestCase {
    
    func testMathStuff() {
        
        let math = MathStuff()
        let result = math.addNumbers(x: 2, y: 1)
        
        XCTAssertEqual(result, 3)
    }
    
    func testMultiplyStuff() {
        
        let math = MathStuff()
        let result = math.multipleNumbers(x: 2, y: 1)
        
        XCTAssertEqual(result, 2)
    }
    
    func testDivideStuff() {
        
        let math = MathStuff()
        let result = math.divideNumbers(x: 10, y: 2)
        
        XCTAssertEqual(result, 5)
    }
}
