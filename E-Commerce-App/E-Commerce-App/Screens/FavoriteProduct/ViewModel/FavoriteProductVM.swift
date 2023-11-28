//
//  FavoriteProductVM.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 28.11.2023.
//

import Foundation
// MARK: - SpecialVMInterface
protocol FavoriteProductVMInterface {
    var view: FavoriteProductVCInterface? { get set }
    func viewDidLoad()
}
final class FavoriteProductVM {
    weak var view: FavoriteProductVCInterface?
    lazy var favoriteProducts: [Product] = []
    
    

    func getProductsFromFavorites() {
        FirestoreManager.shared.getProductsFromFavorites { [weak self] favoriteProducts in
            guard let self else { return }
            
            self.favoriteProducts = favoriteProducts
            view?.configureViewController()
            view?.favoriteCollectionReloadData()
        } onError: { error in
            print(error)
        }
    }
    
    func removeProductFromFavorites(for product: Product){
        FirestoreManager.shared.removeProductFromFavorites(product: product) { [weak self]  in
            guard let self else { return }
            
            getProductsFromFavorites()
        } onError: { error in
            print(error)
        }
    }
}

// MARK: - SpecialVMInterface
extension FavoriteProductVM: FavoriteProductVMInterface {
    func viewDidLoad() {
        getProductsFromFavorites()
    }
}
