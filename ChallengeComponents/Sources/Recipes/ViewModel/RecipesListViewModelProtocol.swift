//
//  RecipesListViewModelProtocol.swift
//  
//
//  Created by Serguei Diaz on 25.06.2023.
//

import Foundation
import Domain

public protocol RecipesListViewModelProtocol: ObservableObject {
    
    init ()
    
    var recipes: [RecipeModel] { get set }
    
    var filter: String { get set }
    
    var isLoading: Bool { get set }
    
    var showAlert: Bool { get set }
    
    func getRecipes()
}
