//
//  MockData.swift
//  E-Commerce-AppTests
//
//  Created by Yaşar Duman on 29.11.2023.
//


import Foundation
@testable import E_Commerce_App

struct MockData {
    // MARK: - Mock Product
    static let mockProduct1: E_Commerce_App.Product = {
        let rating = E_Commerce_App.Rating(rate: 3.9, count: 120)
        return E_Commerce_App.Product(
            id: 1,
            title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
            price: 109.95,
            description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
            category: Category.mensClothing,
            image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
            rating: rating,
            isFavorited: true
        )
    }()
    
    // MARK: - Mock Categories
      static let mockCategoryAll: E_Commerce_App.Category = .all
      static let mockCategoryMensClothing: E_Commerce_App.Category = .mensClothing
      static let mockCategoryWomensClothing: E_Commerce_App.Category = .womensClothing
      static let mockCategoryElectronics: E_Commerce_App.Category = .electronics
      static let mockCategoryJewelery: E_Commerce_App.Category = .jewelery
      
      static let mockCategories: [E_Commerce_App.Category] = [
          mockCategoryMensClothing,
          mockCategoryWomensClothing,
          mockCategoryElectronics,
          mockCategoryJewelery
      ]
    
 // MARK: - Mock CartItem
    static let mockCartItem: E_Commerce_App.CartItem = {
        return E_Commerce_App.CartItem(
            count: 1,
            product: mockProduct1
        )
    }()
}
