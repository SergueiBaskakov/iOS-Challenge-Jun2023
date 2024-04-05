//
//  GetRecipesUseCase.swift
//  
//
//  Created by Serguei Diaz on 24.06.2023.
//

import Foundation
import Combine

public protocol GetRecipesUseCase {
    
    var repository: RecipesRepository { get set }
    
    func execute() -> AnyPublisher<[RecipeModel], Error>
    
}
