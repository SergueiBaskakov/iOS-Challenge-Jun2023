//
//  RecipesRepositoryTests.swift
//  
//
//  Created by Serguei Diaz on 26.06.2023.
//

import XCTest
import Domain
import Combine
import Resolver

final class RecipesRepositorySuccessTests: XCTestCase {
    
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
    
    func testGetRecipes() throws {
        let exp = expectation(description: "Test afert 1.0 seconds")
        let waiter = XCTWaiter.wait(for: [exp], timeout: 1.0)
        
        let repository: RecipesRepository = Resolver.resolve()
        
        var obtainedRecipes: [RecipeModel] = []
        
        repository.getRecipes()
            .sink { _ in
                
            } receiveValue: { response in
                obtainedRecipes = response
            }
            .store(in: &subscriptions)
        
        if waiter == XCTWaiter.Result.timedOut {
            XCTAssert(!obtainedRecipes.isEmpty)
        } else {
            XCTFail("Delay interrupted")
        }
    }
}

final class RecipesRepositoryFailTests: XCTestCase {
    
    private var subscriptions = Set<AnyCancellable>()
    
    override func setUp() {
        Resolver.registerFailMockers()
    }
    
    override func tearDown() {
        Resolver.root = Resolver.main
        self.subscriptions.forEach { cancellable in
            cancellable.cancel()
        }
    }
    
    func testGetRecipes() throws {
        
        let repository: RecipesRepository = Resolver.resolve()

        repository.getRecipes()
            .sink { completion in
                if case .failure = completion {
                    XCTAssert(true)
                }
                else {
                    XCTAssert(false)
                }
            } receiveValue: { _ in
                
            }
            .store(in: &subscriptions)
    }
}
