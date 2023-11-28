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
  
    var specialProductsAll : [Product] = []
    var productByCategory: [Product] = []
    var categories = Category.allCases
    var selectedCategory = Category.all
    
    func fetchAllSpecialProducts() {
        NetworkManager.shared.getProducts { [weak self] products in
            guard let self else { return }
            specialProductsAll = products
            view?.specialProductReloadData()
        } onError: { error in
            print(error)
        }
    }
    
    func fetchProductByCategory(_ category: Category) {
        NetworkManager.shared.getProductByCategory(category: category.rawValue) {  [weak self] products in
            guard let self else { return }
            FirestoreManager.shared.getProductsFromFavorites { favoriteProducts in
                let favoriteProductsIDs = favoriteProducts.map({ $0.id! })
                let resultProducts = products.map { product in
                    var updatedProduct = product
                    updatedProduct.isFavorited = favoriteProductsIDs.contains(product.id!)
                    return updatedProduct
                }
                self.productByCategory = resultProducts
                self.selectedCategory = category
                self.view?.categoryCollectionReloadData()
            } onError: { error in
                print(error)
            }
            
        } onError: { error in
            print(error)
        }
    }
    
    func fetchProductByCategoryAll() {
        NetworkManager.shared.getProducts { [weak self] products in
            guard let self else { return }
            FirestoreManager.shared.getProductsFromFavorites { favoriteProducts in
                let favoriteProductsIDs = favoriteProducts.map({ $0.id! })
                let resultProducts = products.map { product in
                    var updatedProduct = product
                    updatedProduct.isFavorited = favoriteProductsIDs.contains(product.id!)
                    return updatedProduct
                }
                self.productByCategory = resultProducts
                self.view?.categoryCollectionReloadData()
            } onError: { error in
                print(error)
            }
        } onError: { error in
            print(error)
        }
    }
    
    func toggleFavoriteStatus(for product: Product) {
        FirestoreManager.shared.checkProductFavoriteStatus(product: product) { isFavorited in
            if isFavorited {
                FirestoreManager.shared.removeProductFromFavorites(product: product) { [weak self] in
                    guard let self else { return }
                    if selectedCategory == Category.all {
                        self.fetchProductByCategoryAll()
                    } else {
                        self.fetchProductByCategory(selectedCategory)
                    }
                } onError: { error in
                    print(error)
                }
            } else {
                FirestoreManager.shared.addProductToFavorites(product: product) { [weak self] in
                    guard let self else { return }
                    if selectedCategory == Category.all {
                        self.fetchProductByCategoryAll()
                    } else {
                        self.fetchProductByCategory(selectedCategory)
                    }
                } onError: { error in
                    print(error)
                }
            }
        } onError: { error in
            print(error)
        }
    }
    
}


//MARK: - HomeViewModelInterface
extension HomeVM: HomeViewModelInterface {
    
    func viewDidLoad() {
        view?.configureViewController()
        fetchAllSpecialProducts()
    }
    
    func viewWillAppear() {
        fetchProductByCategoryAll()
    }
}
