//
//  RecipesRestRepository.swift
//  
//
//  Created by Serguei Diaz on 24.06.2023.
//

import Foundation
import Domain
import Combine
import Utils

public struct RecipesRestRepository: RecipesRepository {
                
    public init(){}
    
    public func getRecipes() -> AnyPublisher<[RecipeModel], Error> {
        RestHandler()
            .scheme(.https)
            .host(EnvironmentValues.baseUrl)
            .path("/recipes")
            .execute(.get, decoding: [RecipeMapper].self)
            .tryMap { (response) -> [RecipeModel] in
                response.map { recipe in
                    recipe.execute()
                }
            }
            .eraseToAnyPublisher()
    }
}
