//
//  Resolver.swift
//  ChallengeYape
//
//  Created by Serguei Diaz on 24.06.2023.
//

import Foundation
import Core
import Domain
import Persistance
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register {
            RecipesRestRepository()
        }
        .implements(RecipesRepository.self)
        
        register {
            GetRecipesInteractor()
        }
        .implements(GetRecipesUseCase.self)
    }
}
