//
//  RecipeRow.swift
//  Recipes
//
//  Created by Anand on 10/7/24.
//

import Foundation
import SwiftUI

struct RecipeRow: View {
    let recipe: Recipe
    @StateObject private var imageLoader = ImageLoader()
    
    var body: some View {
        HStack {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            } else {
                ProgressView()
                    .frame(width: 50, height: 50)
            }
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                Text(recipe.cuisine)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .onAppear {
            imageLoader.loadImage(from: recipe.photoUrlSmall)
        }
    }
}
