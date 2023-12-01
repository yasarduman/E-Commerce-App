//
//  CartVM.swift
//  E-Commerce-App
//
//  Created by Erislam Nurluyol on 27.11.2023.
//

import Foundation

protocol CartVMInterface {
    func viewDidLoad()
    func viewWillAppear()
}

final class CartVM {
    
    private weak var view: CartVCInterface?
    private let firestoreManager: FirestoreManagerInterface
    
    var cartItems: [CartItem]?
    var totalPrice: Double = 0
    
    init(view: CartVCInterface,
         firestoreManager: FirestoreManagerInterface = FirestoreManager.shared) {
        self.view = view
        self.firestoreManager = firestoreManager
    }
    
    private func getProductsFromCart() {
        firestoreManager.getProductsFromCart { [weak self] cartItems in
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
        firestoreManager.removeProductFromCart(product: cartItem.product) { [weak self] in
            guard let self else { return }
            getProductsFromCart()
        } onError: { error in
            print(error)
        }
    }
    
    func increaseCountOfCartItem(cartItem: CartItem) {
        firestoreManager.increaseCountOfCartItem(cartItem: cartItem) { [weak self] in
            guard let self else { return }
            getProductsFromCart()
        } onError: { error in
            print(error)
        }
    }
    
    
    func decreaseCountOfCartItem(cartItem: CartItem) {
        firestoreManager.decreaseCountOfCartItem(cartItem: cartItem) { [weak self] in
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
