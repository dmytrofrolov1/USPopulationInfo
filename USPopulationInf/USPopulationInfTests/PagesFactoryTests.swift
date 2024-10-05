//
//  PagesFactoryTests.swift
//  USPopulationInfTests
//
//  Created by Dmytro on 05.10.2024.
//

import XCTest

final class PagesFactoryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testFactoryReturnNationVC() {
        let factory = InfoPageFactory()
        let vc = factory.getPage(type: .nations)
        let isNationsType = vc is NationInfoViewController
        XCTAssertTrue(isNationsType)
    }
    
    func testFactoryReturnStateVC() {
        let factory = InfoPageFactory()
        let vc = factory.getPage(type: .states)
        let isStateType = vc is StateInfoViewController
        XCTAssertTrue(isStateType)
    }

}
