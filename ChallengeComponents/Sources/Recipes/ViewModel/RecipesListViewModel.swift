//
//  RecipesListViewModel.swift
//  
//
//  Created by Serguei Diaz on 24.06.2023.
//

import Foundation
import Domain
import Resolver
import Combine
import SwiftUI

public class RecipesListViewModel: RecipesListViewModelProtocol {
    
    @Injected var getRecipesInteractor: GetRecipesUseCase
    
    @Published var allRecipes: [RecipeModel] = []
    
    @Published public var recipes: [RecipeModel] = []
    
    @Published public var filter: String = ""
    
    @Published public var isLoading: Bool = false
    
    @Published public var showAlert: Bool = false
    
    private var subscriptions = Set<AnyCancellable>()
    
    required public init() {
        
        self.getRecipes()
        
        $filter
            .sink { completion in
                print(completion)
            } receiveValue: { value in
                if value != "" {
                    self.recipes = self.allRecipes.filter({ recipe in
                        recipe.name.lowercased().hasPrefix(value.lowercased()) ||
                        recipe.ingredients.contains(where: { ingredient in
                            ingredient.lowercased().hasPrefix(value.lowercased())
                        })
                    })
                }
                else {
                    self.recipes = self.allRecipes
                }
            }
            .store(in: &subscriptions)
    }
    
    public func getRecipes() {
        withAnimation {
            self.isLoading = true
        }
        
        self.getRecipesInteractor.execute()
            .sink { completion in
                if case .failure = completion {
                    self.showAlert = true
                }
                withAnimation {
                    self.isLoading = false
                }
            } receiveValue: { response in
                self.allRecipes = response
                self.recipes = response
                self.filter = ""
            }
            .store(in: &subscriptions)
    }
    
    deinit {
        self.subscriptions.forEach { cancellable in
            cancellable.cancel()
        }
    }
    
}
