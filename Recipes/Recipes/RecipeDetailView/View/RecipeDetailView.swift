//
//  RecipeDetailView.swift
//  Recipes
//
//  Created by Anand on 10/7/24.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack {
            if let sourceUrl = recipe.sourceURL,  let url = URL(string: sourceUrl) {
                WebView(url: url)
                    .navigationTitle(recipe.name)
            } else {
                Text("Source URL not available")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding()
            }
        }
    }
}
