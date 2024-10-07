//
//  Constants.swift
//  Recipes
//
//  Created by Anand on 10/7/24.
//

import Foundation

struct Constants {
    struct URLs {
        static let recipes = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
        static let malformedRecipes = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
        static let emptyRecipes = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
    }
    
    struct ErrorMessages {
        static let fetchFailed = "Failed to fetch recipes: "
    }
}
