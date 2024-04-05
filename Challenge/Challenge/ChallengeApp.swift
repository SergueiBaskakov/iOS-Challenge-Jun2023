//
//  ChallengeYapeApp.swift
//  ChallengeYape
//
//  Created by Serguei Diaz on 20.06.2023.
//

import SwiftUI
import Recipes

@main
struct ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView<RecipesListViewModel>()
                .preferredColorScheme(.light)
        }
    }
}
