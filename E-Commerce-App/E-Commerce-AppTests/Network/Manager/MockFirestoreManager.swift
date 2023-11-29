//
//  MockFirestoreManager.swift
//  E-Commerce-AppTests
//
//  Created by Yaşar Duman on 29.11.2023.
//

@testable import E_Commerce_App

final class MockFirestoreManager: FirestoreManagerInterface {
    var invokeAddProductToCart = false
    var invokeAddProductToCartCount = 0
    
    func addProductToCart(product: E_Commerce_App.Product, onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        invokeAddProductToCart = true
        invokeAddProductToCartCount += 1
        onSuccess()
    }
    
    var invokeRemoveProductFromCart = false
    var invokeRemoveProductFromCartCount = 0
    
    func removeProductFromCart(product: E_Commerce_App.Product, onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        invokeRemoveProductFromCart = true
        invokeRemoveProductFromCartCount += 1
        onSuccess()
    }
    
    var invokeGetProductsFromCart = false
    var invokeGetProductsFromCartCount = 0
    
    func getProductsFromCart(onSuccess: @escaping ([E_Commerce_App.CartItem]) -> Void, onError: @escaping (String) -> Void) {
        invokeGetProductsFromCart = true
        invokeGetProductsFromCartCount += 1
        
        onSuccess([MockData.mockCartItem])
    }
    
    var invokeIncreaseCountOfCartItem = false
    var invokeIncreaseCountOfCartItemCount = 0
    
    func increaseCountOfCartItem(cartItem: E_Commerce_App.CartItem, onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        invokeIncreaseCountOfCartItem = true
        invokeIncreaseCountOfCartItemCount += 1
        onSuccess()
    }
    
    var invokeDecreaseCountOfCartItem = false
    var invokeDecreaseCountOfCartItemCount = 0
    
    func decreaseCountOfCartItem(cartItem: E_Commerce_App.CartItem, onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        invokeDecreaseCountOfCartItem = true
        invokeDecreaseCountOfCartItemCount += 1
        onSuccess()
    }
    
    var invokeGetProductsFromFavorites = false
    var invokeGetProductsFromFavoritesCount = 0
    
    func getProductsFromFavorites(onSuccess: @escaping ([E_Commerce_App.Product]) -> Void, onError: @escaping (String) -> Void) {
        invokeGetProductsFromFavorites = true
        invokeGetProductsFromFavoritesCount += 1
        onSuccess([MockData.mockProduct1])
    }
    
    var invokeCheckProductFavoriteStatus = false
    var invokeCheckProductFavoriteStatusCount = 0
    
    func checkProductFavoriteStatus(product: E_Commerce_App.Product, onSuccess: @escaping (Bool) -> Void, onError: @escaping (String) -> Void) {
        invokeCheckProductFavoriteStatus = true
        invokeCheckProductFavoriteStatusCount += 1
        onSuccess(true)
    }
    
    var invokeAddProductToFavorites = false
    var invokeAddProductToFavoritesCount = 0
    
    func addProductToFavorites(product: E_Commerce_App.Product, onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        invokeAddProductToFavorites = true
        invokeAddProductToFavoritesCount += 1
        onSuccess()
    }
    
    var invokeRemoveProductFromFavorites = false
    var invokeRemoveProductFromFavoritesCount = 0
    
    func removeProductFromFavorites(product: E_Commerce_App.Product, onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        invokeRemoveProductFromFavorites = true
        invokeRemoveProductFromFavoritesCount += 1
        onSuccess()
    }
    
    
}
