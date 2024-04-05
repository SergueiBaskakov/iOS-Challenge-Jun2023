//
//  RecipeDetailView.swift
//  
//
//  Created by Serguei Diaz on 23.06.2023.
//

import SwiftUI
import Kingfisher
import Utils
import Domain

struct RecipeDetailView: View {
    
    let recipe: RecipeModel
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack{
                    KFImage(URL(string: recipe.imageUrl))
                        .placeholder({ _ in
                            ImagePlaceholder()
                        })
                        .resizable()
                        .scaledToFit()
                    
                    Text(recipe.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 20, weight: .bold))
                    
                    Text(recipe.description)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 5)
                    
                    Text("Ingredientes:")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 16, weight: .semibold))
                    
                    Text(recipe.ingredients.joined(separator: ", "))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .shadow(radius: 4, x: 0, y: 4)
                
            )
            .padding(.bottom, 10)
            
            NavigationLink {
                MapView(.init(name: recipe.name, coordinate: .init(latitude: recipe.latitude, longitude: recipe.longitude)))
            } label: {
                Text("Ir al mapa")
            }
            .buttonStyle(PrimaryButtonStyle())
        }
        .padding()
        .navigationBar(title: "Detalle")
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Mockers.recipeMock1())
            .preferredColorScheme(.light)
        
    }
}

