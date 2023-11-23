//
//  HomeVM.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 19.11.2023.
//

import Foundation


protocol HomeViewModelInterface {
    var view: HomeVCInterface? { get set }
    func viewDidLoad()
    func viewWillAppear()
}


final class HomeVM {
    
    weak var view: HomeVCInterface?
    
    let manager = NetworkManager.shared
  
    var specialProductsAll : [Product] = []
    var productByCategory: [Product] = []
    var categories = Category.allCases
    
    func fetchAllProducts() {
        manager.getProducts { [weak self] products in
            guard let self else { return }
            
            if let products = products {
                self.specialProductsAll = products.shuffled()
                view?.specialProductReloadData()
            }
        } onError: { error in
            print(error)
        }
    }
    

    func fetchProductByCategory(_ category: String) {
        manager.getProductByCategory(category: category) {  [weak self] products in
            guard let self else { return }
            
            if let products = products {
                self.productByCategory = products
                view?.categoryCollectionReloadData()
            }
            
        } onError: { error in
            print(error)
        }
    }
    func fetchProductByCategoryAll() {
        manager.getProducts { [weak self] products in
            guard let self else { return }
            
            if let products = products {
                self.productByCategory = products
                view?.categoryCollectionReloadData()
            }
        } onError: { error in
            print(error)
        }
    }
    
    func toggleFavoriteStatus(for product: Product) {
          // TODO: - isFavorite eklenecek Firebase ...
        print("------->>>>>> DEBUG: Firebase Favoriye Ekleme İşlemi yapıldı...")
        dump(product)
        
        view?.categoryCollectionReloadData()
      }
    
    
    func productCartStatus(for product: Product) {
          // TODO: - isFavorite eklenecek Firebase ...
        print("------->>>>>> DEBUG: Firebase Sepete ekleme Ekleme İşlemi yapıldı...")
        dump(product)
        
        view?.categoryCollectionReloadData()
      }
}


//MARK: - HomeViewModelInterface
extension HomeVM: HomeViewModelInterface {
    
    func viewDidLoad() {
        view?.configureViewController()
    }
    
    func viewWillAppear() {
        fetchAllProducts()
        fetchProductByCategoryAll()
    }
  
    
    
}
