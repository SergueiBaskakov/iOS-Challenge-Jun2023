//
//  ResolverMocks.swift
//  
//
//  Created by Serguei Diaz on 25.06.2023.
//

import Foundation
import Domain
import Core
import Resolver

public extension Resolver {
    
    static var test: Resolver = Resolver(child: .main)
    
    static func registerSuccessMockers() {
        Resolver.test = Resolver(child: .main)
        Resolver.root = Resolver.test
        
        register {
            RecipesSuccessMockRepository()
        }
        .implements(RecipesRepository.self)
        
        register {
            GetRecipesInteractor()
        }
        .implements(GetRecipesUseCase.self)
    }
    
    static func registerFailMockers() {
        Resolver.test = Resolver(child: .main)
        Resolver.root = Resolver.test
        
        register {
            RecipesFailMockRepository()
        }
        .implements(RecipesRepository.self)
        
        register {
            GetRecipesInteractor()
        }
        .implements(GetRecipesUseCase.self)
    }
}
