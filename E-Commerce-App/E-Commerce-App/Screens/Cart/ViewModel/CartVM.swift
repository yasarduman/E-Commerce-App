//
//  CartVM.swift
//  E-Commerce-App
//
//  Created by Erislam Nurluyol on 27.11.2023.
//

import Foundation

protocol CartVMInterface {
    var view: CartVCInterface? { get set }
    func viewDidLoad()
    func viewWillAppear()
}

final class CartVM {
    weak var view: CartVCInterface?
    
    var cartItems: [CartItem]?
    var totalPrice: Double = 0
    
    func getProductsFromCart() {
        FirestoreManager.shared.getProductsFromCart { [weak self] cartItems in
            guard let self else { return }
            self.cartItems = cartItems
            totalPrice = cartItems.reduce(0, {$0 + $1.product.price! * Double($1.count)})
            view?.reloadTotalPrice()
            view?.reloadData()
        } onError: { error in
            print(error)
        }
    }
    
    func removeProductFromCart(cartItem: CartItem) {
        FirestoreManager.shared.removeProductFromCart(product: cartItem.product) { [weak self] in
            guard let self else { return }
            getProductsFromCart()
        } onError: { error in
            print(error)
        }
    }
    
    func increaseCountOfCartItem(cartItem: CartItem) {
        FirestoreManager.shared.increaseCountOfCartItem(cartItem: cartItem) { [weak self] in
            guard let self else { return }
            getProductsFromCart()
        } onError: { error in
            print(error)
        }
    }
    
    
    func decreaseCountOfCartItem(cartItem: CartItem) {
        FirestoreManager.shared.decreaseCountOfCartItem(cartItem: cartItem) { [weak self] in
            guard let self else { return }
            getProductsFromCart()
        } onError: { error in
            print(error)
        }
    }
    
}

extension CartVM: CartVMInterface {
    func viewDidLoad() {
        view?.configureNavigationController()
        view?.prepareCollectionView()
    }
    
    func viewWillAppear() {
        getProductsFromCart()
    }
}
