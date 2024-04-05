//
//  File.swift
//  
//
//  Created by Serguei Diaz on 25.06.2023.
//

import Foundation
import Domain
import Combine
import SwiftUI

public class DesignRecipesListViewModel: RecipesListViewModelProtocol {
    
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
            self.allRecipes = [Mockers.recipeMock1(), Mockers.recipeMock2()]
            
            self.recipes = self.allRecipes
            
            self.filter = ""
            
            withAnimation {
                self.isLoading = false
            }
        }
    }
    
    deinit {
        self.subscriptions.forEach { cancellable in
            cancellable.cancel()
        }
    }
    
}
