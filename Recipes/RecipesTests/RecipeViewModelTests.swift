//
//  RecipeViewModelTests.swift
//  RecipesTests
//
//  Created by Anand on 10/7/24.
//

import XCTest
@testable import Recipes

class RecipeViewModelTests: XCTestCase {
    var viewModel: RecipeViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = RecipeViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchRecipesSuccess() async {
        let expectation = XCTestExpectation(description: "Fetch recipes successfully")
        
        await viewModel.fetchRecipes(from: Constants.URLs.recipes)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertFalse(self.viewModel.recipes.isEmpty)
            XCTAssertNil(self.viewModel.errorMessage)
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 5)
    }
    
    func testFetchRecipesFailure() async {
        let expectation = XCTestExpectation(description: "Fetch recipes failure")
        
        await viewModel.fetchRecipes(from: Constants.URLs.malformedRecipes)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertTrue(self.viewModel.recipes.isEmpty)
            XCTAssertNotNil(self.viewModel.errorMessage)
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 5)
    }
    
    func testFetchEmptyRecipes() async {
        let expectation = XCTestExpectation(description: "Fetch empty recipes")
        
        await viewModel.fetchRecipes(from: Constants.URLs.emptyRecipes)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertTrue(self.viewModel.recipes.isEmpty)
            XCTAssertNil(self.viewModel.errorMessage)
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 5)
    }
}
