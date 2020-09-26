//
//  COVID19_TracerTests.swift
//  COVID19-TracerTests
//
//  Created by Udara Ranatunga on 9/15/20.
//  Copyright © 2020 Udara Ranatunga. All rights reserved.
//

import XCTest
@testable import COVID19_Tracer

class COVID19_TracerTests: XCTestCase {
    var sut: ProfileViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = ProfileViewController()
        sut.viewDidLoad()    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }
    func testFirebaseUser(){
        let guess = sut.uid;
        sut.viewDidLoad()
        XCTAssertNil(sut.viewDidLoad(), "User not retrieved from database")
        
    }

    
}
