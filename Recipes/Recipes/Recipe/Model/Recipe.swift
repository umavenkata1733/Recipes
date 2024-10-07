//
//  Recipe.swift
//  Recipes
//
//  Created by Anand on 10/7/24.
//

import Foundation

struct RecipeResponse: Codable {
    let recipes: [Recipe]
}

struct Recipe: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let cuisine: String
    let photoUrlSmall: String
    let sourceURL: String?
    let youtubeURL: String?


    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case name
        case cuisine
        case photoUrlSmall = "photo_url_small"
        case sourceURL = "source_url"
        case youtubeURL = "youtube_url"
    }
}
