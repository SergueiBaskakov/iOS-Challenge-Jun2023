//
//  RecipeMapper.swift
//  
//
//  Created by Serguei Diaz on 24.06.2023.
//

import Foundation
import Domain

struct RecipeMapper: MapperProtocol {
    
    typealias T = RecipeModel
    
    let name: String
    let description: String
    let image: String
    let ingredients: [String]
    let longitude: Double
    let latitude: Double
    
    func execute() -> T {
        T(
            name: self.name,
            description: self.description,
            imageUrl: self.image,
            ingredients: self.ingredients,
            longitude: self.longitude,
            latitude: self.latitude
        )
    }
}
