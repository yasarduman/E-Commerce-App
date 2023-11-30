//
//  MockFirestoreManager.swift
//  E-Commerce-AppTests
//
//  Created by Yaşar Duman on 29.11.2023.
//

@testable import E_Commerce_App

final class MockFirestoreManager: FirestoreManagerInterface {
    var invokedAddProductToCart = false
    var invokedAddProductToCartCount = 0
    
    func addProductToCart(product: E_Commerce_App.Product, onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        invokedAddProductToCart = true
        invokedAddProductToCartCount += 1
        onSuccess()
    }
    
    var invokedRemoveProductFromCart = false
    var invokedRemoveProductFromCartCount = 0
    
    func removeProductFromCart(product: E_Commerce_App.Product, onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        invokedRemoveProductFromCart = true
        invokedRemoveProductFromCartCount += 1
        onSuccess()
    }
    
    var invokedGetProductsFromCart = false
    var invokedGetProductsFromCartCount = 0
    
    func getProductsFromCart(onSuccess: @escaping ([E_Commerce_App.CartItem]) -> Void, onError: @escaping (String) -> Void) {
        invokedGetProductsFromCart = true
        invokedGetProductsFromCartCount += 1
        
        onSuccess([MockData.mockCartItem])
    }
    
    var invokedIncreaseCountOfCartItem = false
    var invokedIncreaseCountOfCartItemCount = 0
    
    func increaseCountOfCartItem(cartItem: E_Commerce_App.CartItem, onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        invokedIncreaseCountOfCartItem = true
        invokedIncreaseCountOfCartItemCount += 1
        onSuccess()
    }
    
    var invokedDecreaseCountOfCartItem = false
    var invokedDecreaseCountOfCartItemCount = 0
    
    func decreaseCountOfCartItem(cartItem: E_Commerce_App.CartItem, onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        invokedDecreaseCountOfCartItem = true
        invokedDecreaseCountOfCartItemCount += 1
        onSuccess()
    }
    
    var invokedGetProductsFromFavorites = false
    var invokedGetProductsFromFavoritesCount = 0
    
    func getProductsFromFavorites(onSuccess: @escaping ([E_Commerce_App.Product]) -> Void, onError: @escaping (String) -> Void) {
        invokedGetProductsFromFavorites = true
        invokedGetProductsFromFavoritesCount += 1
        onSuccess([MockData.mockProduct1])
    }
    
    var invokedCheckProductFavoriteStatus = false
    var invokedCheckProductFavoriteStatusCount = 0
    
    func checkProductFavoriteStatus(product: E_Commerce_App.Product, onSuccess: @escaping (Bool) -> Void, onError: @escaping (String) -> Void) {
        invokedCheckProductFavoriteStatus = true
        invokedCheckProductFavoriteStatusCount += 1
        onSuccess(true)
    }
    
    var invokedAddProductToFavorites = false
    var invokedAddProductToFavoritesCount = 0
    
    func addProductToFavorites(product: E_Commerce_App.Product, onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        invokedAddProductToFavorites = true
        invokedAddProductToFavoritesCount += 1
        onSuccess()
    }
    
    var invokedRemoveProductFromFavorites = false
    var invokedRemoveProductFromFavoritesCount = 0
    
    func removeProductFromFavorites(product: E_Commerce_App.Product, onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        invokedRemoveProductFromFavorites = true
        invokedRemoveProductFromFavoritesCount += 1
        onSuccess()
    }
    
    
}
