//
//  ProductDetailVM.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 22.11.2023.
//

import Foundation

protocol ProductDetailVMIterface {
    var view: ProductDetailVCInterface? { get set}
    func viewDidLoad()
}

final class ProductDetailVM {
    weak var view: ProductDetailVCInterface?
    var product: Product?
    var isFavorite: Bool?
    
    private func checkProductFavorited() {
        guard let product else { return }
        FirestoreManager.shared.checkProductFavoriteStatus(product: product) { isFavorited in
            self.isFavorite = isFavorited
            self.view?.configureViewController()
        } onError: { error in
            print(error)
        }
    }
    
    func toggleFavoriteStatus() {
        guard let product else { return }
        FirestoreManager.shared.checkProductFavoriteStatus(product: product) { isFavorited in
            if isFavorited {
                FirestoreManager.shared.removeProductFromFavorites(product: product) { [weak self] in
                    guard let self else { return }
                    checkProductFavorited()
                } onError: { error in
                    print(error)
                }
            } else {
                FirestoreManager.shared.addProductToFavorites(product: product) { [weak self] in
                    guard let self else { return }
                    checkProductFavorited()
                } onError: { error in
                    print(error)
                }
            }
        } onError: { error in
            print(error)
        }
    }
    
}

extension ProductDetailVM: ProductDetailVMIterface{
    func viewDidLoad() {
        checkProductFavorited()
    }
}
