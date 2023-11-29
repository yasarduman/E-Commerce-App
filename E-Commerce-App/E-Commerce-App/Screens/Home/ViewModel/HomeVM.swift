//
//  HomeVM.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 19.11.2023.
//

import Foundation


protocol HomeViewModelInterface {
    func viewDidLoad()
    func viewWillAppear()
}

final class HomeVM {
    private weak var view: HomeVCInterface?
    private let networkManager: NetworkManagerInterfave
    private let firestoreManager: FirestoreManagerInterface
    
    var specialProductsAll : [Product] = []
    var productByCategory: [Product] = []
    var categories = Category.allCases
    var selectedCategory = Category.all
    
    
    init(view: HomeVCInterface, networkManager: NetworkManagerInterfave = NetworkManager.shared, firestoreManager: FirestoreManagerInterface = FirestoreManager.shared) {
        self.view = view
        self.networkManager = networkManager
        self.firestoreManager = firestoreManager
    }
    
    func fetchAllSpecialProducts() {
        networkManager.getProducts { [weak self] products in
            guard let self else { return }
            specialProductsAll = products
            view?.specialProductReloadData()
        } onError: { error in
            print(error)
        }
    }
    
    func fetchProductByCategory(_ category: Category) {
        networkManager.getProductByCategory(category: category.rawValue) {  [weak self] products in
            guard let self else { return }
            firestoreManager.getProductsFromFavorites { favoriteProducts in
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
        networkManager.getProducts { [weak self] products in
            guard let self else { return }
            firestoreManager.getProductsFromFavorites { favoriteProducts in
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
        firestoreManager.checkProductFavoriteStatus(product: product) { isFavorited in
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
                self.firestoreManager.addProductToFavorites(product: product) { [weak self] in
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
