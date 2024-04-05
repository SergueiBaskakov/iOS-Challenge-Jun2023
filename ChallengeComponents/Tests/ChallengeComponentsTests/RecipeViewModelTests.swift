//
//  RecipeViewModelTests.swift
//
//
//  Created by Serguei Diaz on 26.06.2023.
//

import XCTest
import Recipes
import Domain
import Combine
import Resolver

final class RecipeViewModelFailTests: XCTestCase {
    
    override func setUp() {
        Resolver.registerFailMockers()
    }
    
    override func tearDown() {
        Resolver.root = Resolver.main
    }
    
    func testShowAlert() throws {
        let exp = expectation(description: "Test afert 1.0 seconds")
        let waiter = XCTWaiter.wait(for: [exp], timeout: 1.0)
        
        let viewModel = RecipesListViewModel()
        
        viewModel.getRecipes()
        
        if waiter == XCTWaiter.Result.timedOut {
            XCTAssert(viewModel.showAlert)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
}

final class RecipeViewModelTests: XCTestCase {
    
    private var subscriptions = Set<AnyCancellable>()
    
    override func setUp() {
        Resolver.registerSuccessMockers()
    }
    
    override func tearDown() {
        Resolver.root = Resolver.main
        self.subscriptions.forEach { cancellable in
            cancellable.cancel()
        }
    }
    
    func testGetRecipesResult() throws {
        let exp = expectation(description: "Test afert 1.0 seconds")
        let waiter = XCTWaiter.wait(for: [exp], timeout: 1.0)
        
        let viewModel = RecipesListViewModel()
        
        var obtainedRecipes: [RecipeModel] = []
        
        viewModel.$recipes
            .sink { _ in
                
            } receiveValue: { recipes in
                obtainedRecipes = recipes
            }
            .store(in: &subscriptions)
        
        viewModel.getRecipes()
        
        if waiter == XCTWaiter.Result.timedOut {
            XCTAssert(!obtainedRecipes.isEmpty)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testShowAlert() throws {
        let exp = expectation(description: "Test afert 1.0 seconds")
        let waiter = XCTWaiter.wait(for: [exp], timeout: 1.0)
        
        let viewModel = RecipesListViewModel()
        
        viewModel.getRecipes()
        
        if waiter == XCTWaiter.Result.timedOut {
            XCTAssert(!viewModel.showAlert)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testFilterByName() throws {
        let exp = expectation(description: "Test afert 1.0 seconds")
        let waiter = XCTWaiter.wait(for: [exp], timeout: 1.0)
        
        let viewModel = RecipesListViewModel()
        
        viewModel.getRecipes()
        
        if waiter == XCTWaiter.Result.timedOut {
            
            let recipeName: String = viewModel.recipes.last?.name ?? ""

            XCTAssert(viewModel.recipes.contains(where: { recipe in
                recipe.name != recipeName
            }))
                        
            viewModel.filter = recipeName
            
            XCTAssert(!viewModel.recipes.contains(where: { recipe in
                recipe.name != recipeName
            }))
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testFilterByIngredient() throws {
        let exp = expectation(description: "Test afert 1.0 seconds")
        let waiter = XCTWaiter.wait(for: [exp], timeout: 1.0)
        
        let viewModel = RecipesListViewModel()
        
        viewModel.getRecipes()
        
        if waiter == XCTWaiter.Result.timedOut {
            
            let recipeIngredient: String = viewModel.recipes.last?.ingredients.first ?? ""

            XCTAssert(viewModel.recipes.contains(where: { recipe in
                !recipe.ingredients.contains { ingredient in
                    ingredient == recipeIngredient
                }
            }))
                        
            viewModel.filter = recipeIngredient
            
            XCTAssert(viewModel.recipes.contains(where: { recipe in
                recipe.ingredients.contains { ingredient in
                    ingredient == recipeIngredient
                }
            }))
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
}
