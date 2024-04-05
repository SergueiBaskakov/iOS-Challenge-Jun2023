//
//  GetRecipesInteractor.swift
//  
//
//  Created by Serguei Diaz on 22.06.2023.
//

import Foundation
import Domain
import Combine
import Resolver

public struct GetRecipesInteractor: GetRecipesUseCase {
 
    @Injected public var repository: RecipesRepository
    
    public init(){}
    
    public func execute() -> AnyPublisher<[RecipeModel], Error> {
        self.repository.getRecipes()
    }
    
}
