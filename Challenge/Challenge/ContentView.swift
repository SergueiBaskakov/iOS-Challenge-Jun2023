//
//  ContentView.swift
//  ChallengeYape
//
//  Created by Serguei Diaz on 20.06.2023.
//

import SwiftUI
import Recipes

struct ContentView<V: RecipesListViewModelProtocol>: View {
    var body: some View {
        NavigationView {
            RecipesListView<V>()
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView<DesignRecipesListViewModel>()
    }
}
