//
//  RecipesRepository.swift
//  
//
//  Created by Serguei Diaz on 24.06.2023.
//

import Foundation
import Combine

public protocol RecipesRepository {
    
    init()
    
    func getRecipes() -> AnyPublisher<[RecipeModel], Error>
    
}
