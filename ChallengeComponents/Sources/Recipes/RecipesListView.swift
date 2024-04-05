//
//  RecipesListView.swift
//  
//
//  Created by Serguei Diaz on 22.06.2023.
//

import SwiftUI
import Kingfisher
import Utils

public struct RecipesListView<ViewModel: RecipesListViewModelProtocol>: View {
    
    public init(){}
    
    @StateObject var viewModel = ViewModel()
    
    public var body: some View {
        VStack() {
            SearchBox(placeholder: "Buscar", text: self.$viewModel.filter)
                .padding(.horizontal)
                .padding(.top)
            
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(self.viewModel.recipes, id: \.self) { recipe in
                        NavigationLink {
                            RecipeDetailView(recipe: recipe)
                        } label: {
                            recipeBox(imageUrl: recipe.imageUrl, title: recipe.name)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                    }
                }
                .padding()
            }
            .loader(isLoading: self.viewModel.isLoading)
        }
        .navigationBarHidden(true)
        .alert(isPresented: self.$viewModel.showAlert) {
            return Alert(title: Text("Error al obtener las recetas"))
        }
        
    }
    
    private func recipeBox(imageUrl: String, title: String) -> some View {
        VStack {
            KFImage(URL(string: imageUrl))
                .placeholder({ _ in
                    ImagePlaceholder()
                })
                .resizable()
                .scaledToFit()
            
            Text(title)
                .font(.system(size: 20, weight: .bold))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(radius: 4, x: 0, y: 4)
            
        )
    }
}

struct SearchBox: View {
    
    let placeholder: String
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            TextField(placeholder, text: $text)
            
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(radius: 4, x: 0, y: 4)
        )
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView<DesignRecipesListViewModel>()
            .preferredColorScheme(.light)
    }
}
