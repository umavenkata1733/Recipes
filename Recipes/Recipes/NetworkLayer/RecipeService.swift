//
//  RecipeService.swift
//  Recipes
//
//  Created by Anand on 10/7/24.
//

import Foundation

enum RecipeServiceError: Error {
    case invalidUrl
    case invalidData
    case decodingError
    case invalidResponse
}

class RecipeService {
    private let session = URLSession.shared
    
    func fetchRecipes(from urlString: String) async throws -> [Recipe] {
        guard let url = URL(string: urlString) else {
            throw RecipeServiceError.invalidUrl
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw RecipeServiceError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(RecipeResponse.self, from: data)
            return response.recipes
        } catch {
            throw RecipeServiceError.decodingError
        }
    }
}
