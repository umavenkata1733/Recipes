//
//  RecipeViewModel.swift
//  Recipes
//
//  Created by Anand on 10/7/24.
//

import Foundation
import SwiftUI

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let service = RecipeService()
    
    func fetchRecipes() async {
        await fetchRecipes(from: Constants.URLs.recipes)
    }
    
    func fetchRecipes(from urlString: String) async {
        await updateLoadingState(isLoading: true)
        
        do {
            let recipes = try await service.fetchRecipes(from: urlString)
            await updateRecipes(recipes)
        } catch {
            await updateErrorState(errorMessage: Constants.ErrorMessages.fetchFailed + error.localizedDescription)
        }
        
        await updateLoadingState(isLoading: false)
    }
    
    @MainActor
    private func updateRecipes(_ recipes: [Recipe]) {
        self.recipes = recipes
    }
    
    @MainActor
    private func updateLoadingState(isLoading: Bool) {
        self.isLoading = isLoading
    }
    
    @MainActor
    private func updateErrorState(errorMessage: String?) {
        self.errorMessage = errorMessage
    }
}
