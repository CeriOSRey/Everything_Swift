//
//  UnitTests.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-07.
//

import Foundation
//import XCTest

//@testable import MathStuff

//class autClassTest: XCTestCase {
//    
//    func testAddStuff() {
//        let aut = MathStuff()
//        let result = aut.addStuff(x: 1, y: 2)
//        XCTAssertEqual(result, 3)
//        XCTAssertTrue(result == 3)
//        XCTAssertFalse(resut == 3)
//        XCTAssertNil(result)
//        XCTAssertNotNil(result)
//    }
//    
//    func testSubractStuff() {
//        let aut = MathStuff()
//        let result = aut.subtractStuff(x: 1, y: 2)
//        XCTAssertEqual(result, 3)
//    }
//    
//    func testMultiplyStuff() {
//        let aut = MathStuff()
//        let result = aut.multiplyStuff(x: 1, y: 2)
//        XCTAssertEqual(result, 3)
//    }
//    
//    func testDivideStuff() {
//        let aut = MathStuff()
//        let result = aut.divideStuff(x: 1, y: 2)
//        XCTAssertEqual(result, 3)
//    }
//    
//}

public class MathStuff {
    func addStuff(x: Int, y: Int) -> Int {
        return x + y
    }
    
    func subtractStuff(x: Int, y: Int) -> Int {
        return x - y
    }
    
    func multiplyStuff(x: Int, y: Int) -> Int {
        return x * y
    }
    
    func divideStuff(x: Int, y: Int) -> Int {
        return x / y
    }
}
