//
//  MockNetworkManager.swift
//  E-Commerce-AppTests
//
//  Created by Yaşar Duman on 29.11.2023.
//

@testable import E_Commerce_App

final class MockNetworkManager: NetworkManagerInterfave {
    var invokedGetProducts = false
    var invokedGetProductsCount = 0
    
    func getProducts(onSuccess: @escaping ([E_Commerce_App.Product]) -> (Void), onError: @escaping (String) -> (Void)) {
        invokedGetProducts = true
        invokedGetProductsCount += 1
   
        let mockProducts: [E_Commerce_App.Product] = [MockData.mockProduct1]
        onSuccess(mockProducts)
    }
    
    var invokedGetProductByCategory = false
    var invokedGetProductByCategoryCount = 0
    func getProductByCategory(category: String, onSuccess: @escaping ([E_Commerce_App.Product]) -> (Void), onError: @escaping (String) -> (Void)) {
        invokedGetProductByCategory = true
        invokedGetProductByCategoryCount += 1
      
        onSuccess([MockData.mockProduct1])
    }
    
    var invokedFetchCategory = false
    var invokedFetchCategoryCount = 0
    func fetchCategory(onSuccess: @escaping ([E_Commerce_App.Category]?) -> (), onError: @escaping (String) -> (Void)) {
        invokedFetchCategory = true
        invokedFetchCategoryCount += 1
        
        let mockCategories: [E_Commerce_App.Category] = MockData.mockCategories
        onSuccess(mockCategories)
    }
}
