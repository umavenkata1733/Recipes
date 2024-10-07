//
//  RecipesApp.swift
//  Recipes
//
//  Created by Anand on 10/7/24.
//

import SwiftUI

@main
struct RecipesApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeListView(viewModel: RecipeViewModel())
        }
    }
}
