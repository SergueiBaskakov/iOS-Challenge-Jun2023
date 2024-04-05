//
//  RecipeModel.swift
//  
//
//  Created by Serguei Diaz on 23.06.2023.
//

import Foundation

public struct RecipeModel: Hashable {
    public let name: String
    public let description: String
    public let imageUrl: String
    public let ingredients: [String]
    public let longitude: Double
    public let latitude: Double
    
    public init(name: String, description: String, imageUrl: String, ingredients: [String], longitude: Double, latitude: Double) {
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
        self.ingredients = ingredients
        self.longitude = longitude
        self.latitude = latitude
    }
}
