//
//  EKBuilderTests.swift
//  EKBuilderTests
//
//  Created by Erik Kamalov on 4/11/19.
//  Copyright © 2019 Neuron. All rights reserved.
//

import XCTest
@testable import EKBuilder

class EKBuilderTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    /// Class for testing
    class ClassBuilder: EKBuilder {
        var value:Bool!
        var count:Int!
        required init() {}
    }
    /// Structure for testing
    struct StructureBuilder:EKBuilder {
        var value:Bool?
    }
    
    func testClassBuilder(){
        let testOneFalse:ClassBuilder = ClassBuilder()
        testOneFalse.value = false
        
        let testOneTrue:ClassBuilder = ClassBuilder()
        testOneTrue.value = true
        
        let testBuilderByFullClosure:ClassBuilder = .build { (test) in // full clusore test
            test.value = true
        }
        
        XCTAssertEqual(testBuilderByFullClosure.value, testOneTrue.value)
        
        let testBuilderByShortClusure:ClassBuilder = .build { // short closure test
            $0.value = false
            $0.count = 0
        }
        
        XCTAssertEqual(testBuilderByShortClusure.value, testOneFalse.value)
        
        let testByBuilder = ClassBuilder.build {
            $0.value = false
        }
        XCTAssertEqual(testByBuilder.value, testOneFalse.value)
        
    }
    func testStructureBuilder(){
        let testOneFalse:StructureBuilder = StructureBuilder(value: false)
        let testOneTrue:StructureBuilder = StructureBuilder(value: true)
        
        let testBuilderByFullClosure:ClassBuilder = .build { (test) in // full clusore test
            test.value = true
        }
        
        XCTAssertEqual(testBuilderByFullClosure.value, testOneTrue.value)
        
        let testBuilderByShortClusure:ClassBuilder = .build { // short closure test
            $0.value = false
        }
        
        XCTAssertEqual(testBuilderByShortClusure.value, testOneFalse.value)
        
        
        let testByBuilder = ClassBuilder.build {
            $0.value = false
        }
        XCTAssertEqual(testByBuilder.value, testOneFalse.value)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
