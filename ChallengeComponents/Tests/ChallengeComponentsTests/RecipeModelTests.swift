//
//  RecipeModelTests.swift
//  
//
//  Created by Serguei Diaz on 26.06.2023.
//

import XCTest
import Domain
import Combine
import Resolver

final class RecipeModelTests: XCTestCase {
    
    let recipe: RecipeModel = Mockers.recipeMock1()
        
    func testRecipeModel() throws {
        
        XCTAssertNotNil(recipe.name)
        XCTAssertNotNil(recipe.description)
        XCTAssertNotNil(recipe.imageUrl)
        XCTAssertNotNil(recipe.ingredients)
        XCTAssertNotNil(recipe.latitude)
        XCTAssertNotNil(recipe.longitude)

    }
}

