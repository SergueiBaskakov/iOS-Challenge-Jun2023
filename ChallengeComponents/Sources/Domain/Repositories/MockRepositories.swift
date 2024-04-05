//
//  File.swift
//  
//
//  Created by Serguei Diaz on 25.06.2023.
//

import Foundation
import Combine

public struct RecipesSuccessMockRepository: RecipesRepository {
    
    public init() {}
    
    public func getRecipes() -> AnyPublisher<[RecipeModel], Error> {
        Future<[RecipeModel], Error> { promise in
            promise(.success([Mockers.recipeMock1(), Mockers.recipeMock2()]))
        }
        .eraseToAnyPublisher()
    }
}

public struct RecipesFailMockRepository: RecipesRepository {
    
    public init() {}
    
    public func getRecipes() -> AnyPublisher<[RecipeModel], Error> {
        Future<[RecipeModel], Error> { promise in
            promise(.failure(NSError()))
        }
        .eraseToAnyPublisher()
    }
}
