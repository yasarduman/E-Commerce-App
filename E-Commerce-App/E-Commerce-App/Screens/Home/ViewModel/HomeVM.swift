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
    
    func fetchAllSpecialProducts() {
        NetworkManager.shared.getProducts { [weak self] products in
            guard let self else { return }
            specialProductsAll = products
            view?.specialProductReloadData()
        } onError: { error in
            print(error)
        }
    }
    
    func fetchProductByCategory(_ category: String) {
        NetworkManager.shared.getProductByCategory(category: category) {  [weak self] products in
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
                    self.fetchProductByCategoryAll()
                } onError: { error in
                    print(error)
                }
            } else {
                FirestoreManager.shared.addProductToFavorites(product: product) { [weak self] in
                    guard let self else { return }
                    self.fetchProductByCategoryAll()
                } onError: { error in
                    print(error)
                }
            }
        } onError: { error in
            print(error)
        }
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
        fetchAllSpecialProducts()
        fetchProductByCategoryAll()
    }
    
    func viewWillAppear() {
        fetchProductByCategoryAll()
    }
    
}
