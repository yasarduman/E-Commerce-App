//
//  NetworkManager.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//

final class NetworkManager {
    
    private let baseURL: String = "https://fakestoreapi.com"
    
    enum Endpoint: String {
       case fetchAllProducts       = "/products"
       case fetchAllCategorys       = "/products/categories"
       case fetchProdudctByCategory = "/products/category/"
    }
    
    static let shared = NetworkManager()
    
    private init() {}
    
    
    func getProducts(onSuccess: @escaping ([Product])->(Void), onError: @escaping (String)->(Void)) {
        AlamofireService.shared.request(path: baseURL + Endpoint.fetchAllProducts.rawValue) { (response: [Product]) in
            onSuccess(response)
        } onError: { error in
            onError(error.localizedDescription)
        }
    }
    
    func getProductByCategory(category: String, onSuccess: @escaping ([Product])->(Void), onError: @escaping (String)->(Void)) {
        AlamofireService.shared.request(path: baseURL + Endpoint.fetchProdudctByCategory.rawValue + category) { (response: [Product]) in
            onSuccess(response)
        } onError: { error in
            onError(error.localizedDescription)
        }
    }
    
    
    func fetchCategory(onSuccess: @escaping ([Category]?) -> (), onError: @escaping (String)->(Void)) {
        AlamofireService.shared.request(path: baseURL + Endpoint.fetchAllCategorys.rawValue) { (response: [Category]) in
            onSuccess(response)
        
        } onError: { error in
            onError(error.localizedDescription)
        }
    }
}


