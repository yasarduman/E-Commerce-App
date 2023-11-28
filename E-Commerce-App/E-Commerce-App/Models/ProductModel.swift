//
//  ProductModel.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 19.11.2023.
//


import UIKit

// MARK: - Product
struct Product: Codable {
    let id: Int?
    let title: String?
    let price: Double?
    let description: String?
    let category: Category?
    let image: String?
    let rating: Rating?
    var isFavorited: Bool?
}

enum Category: String, Codable ,CaseIterable{
    case all = "All"
    case mensClothing = "men's clothing"
    case womensClothing = "women's clothing"
    case electronics = "electronics"
    case jewelery = "jewelery"
    
    var name: String {
        self.rawValue
    }
    
    var image: UIImage{
        switch self {
        case .all:
            UIImage(named: "allCategories")!
        case .mensClothing:
            UIImage(named: "men")!
        case .womensClothing:
            UIImage(named: "women")!
        case .electronics:
            UIImage(named: "electronics")!
        case .jewelery:
            UIImage(named: "jewelery")!
        }
    }
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double?
    let count: Int?
}
