//
//  ShoptivitiesTest.swift
//  MADridLifeTests
//
//  Created by Rodrigo Limpias Cossio on 22/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import XCTest
@testable import MADridLife


class ShoptivitiesTest: XCTestCase {
    
    func testShoptivityCreation(){
        let shoptivity = Shoptivity(name: "Shoptivity")
        XCTAssertNotNil(shoptivity)
    }
    
    func testShoptivitiesList(){
        let sut = Shoptivities()
        sut.add(shoptivity: Shoptivity(name: "Shoptivity"))
        XCTAssertEqual(1, sut.count()) 
    }
}
