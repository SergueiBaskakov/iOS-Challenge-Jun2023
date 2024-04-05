//
//  File.swift
//  
//
//  Created by Serguei Diaz on 25.06.2023.
//

import Foundation

public struct Mockers {
    
    public static func recipeMock1() -> RecipeModel {
        RecipeModel(
            name: "Panqueques",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
            imageUrl: "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg",
            ingredients: [
                "harina",
                "azucar",
                "fresa",
                "miel"
              ],
            longitude: -77.042793000000003,
            latitude: -12.046374
        )
    }
    
    public static func recipeMock2() -> RecipeModel {
        RecipeModel(
            name: "Smoothie",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
            imageUrl: "https://images.pexels.com/photos/1099680/pexels-photo-1099680.jpeg?auto=compress&cs=tinysrgb&w=800",
            ingredients: [
                "yogurt",
                "fresa",
                "azucar",
                "arandano"
              ],
            longitude: 37.618423,
            latitude: 55.751244
        )
    }
}
