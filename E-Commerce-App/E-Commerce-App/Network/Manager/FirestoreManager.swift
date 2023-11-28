//
//  FirestoreManager.swift
//  E-Commerce-App
//
//  Created by Erislam Nurluyol on 27.11.2023.
//

import FirebaseFirestore

final class FirestoreManager {
    static let shared = FirestoreManager()
    private let currentUserRef = Firestore.firestore().collection("UsersInfo").document(ApplicationVariables.currentUserID!)
    
    private init() {}
    
    func addProductToCart(product: Product, onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        let productRef = currentUserRef
            .collection("cart")
            .document(product.id!.description)
        
        let data = [
            "product" : [
                "id" : product.id!,
                "title" : product.title!,
                "price" : product.price!,
                "description" : product.description!,
                "category" : product.category!.rawValue,
                "image" : product.image!,
                "rating" : [
                    "rate" : product.rating!.rate!,
                    "count" : product.rating!.count!
                ]
            ],
            "count" : 1
        ] as [String : Any]
        
        FirestoreService.shared.checkDocumentExists(reference: productRef) { exists in
            if exists {
                FirestoreService.shared.updateData(reference: productRef, data: ["count" : FieldValue.increment(1.0)]) {
                    onSuccess()
                } onError: { error in
                    onError(error.localizedDescription)
                }
            } else {
                FirestoreService.shared.setData(reference: productRef, data: data) {
                    onSuccess()
                } onError: { error in
                    onError(error.localizedDescription)
                }
            }
        } onError: { error in
            onError(error.localizedDescription)
        }
    }
    
    func removeProductFromCart(product: Product, onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        let productRef = currentUserRef
            .collection("cart")
            .document(product.id!.description)
        
        FirestoreService.shared.checkDocumentExists(reference: productRef) { exists in
            if exists {
                FirestoreService.shared.deleteDocument(reference: productRef) {
                    onSuccess()
                } onError: { error in
                    onError(error.localizedDescription)
                }
            } else { return }
        } onError: { error in
            onError(error.localizedDescription)
        }
        
    }
    
    func getProductsFromCart(onSuccess: @escaping ([CartItem]) -> Void, onError: @escaping (String) -> Void) {
        let cartRef = currentUserRef
            .collection("cart")
        FirestoreService.shared.getDocuments(reference: cartRef) { (cartItems: [CartItem]) in
            onSuccess(cartItems)
        } onError: { error in
            onError(error.localizedDescription)
        }
    }
    
    func increaseCountOfCartItem(cartItem: CartItem, onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        let cartItemRef = currentUserRef
            .collection("cart")
            .document(cartItem.product.id!.description)
        
        FirestoreService.shared.checkDocumentExists(reference: cartItemRef) { exists in
            if exists {
                FirestoreService.shared.updateData(reference: cartItemRef, data: ["count" : FieldValue.increment(1.0)]) {
                    onSuccess()
                } onError: { error in
                    onError(error.localizedDescription)
                }
            } else { return }
        } onError: { error in
            onError(error.localizedDescription)
        }
    }
    
    func decreaseCountOfCartItem(cartItem: CartItem, onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        let cartItemRef = currentUserRef
            .collection("cart")
            .document(cartItem.product.id!.description)
        
        FirestoreService.shared.getDocument(reference: cartItemRef) { (cartItem: CartItem) in
            if cartItem.count == 1 {
                self.removeProductFromCart(product: cartItem.product) {
                    onSuccess()
                } onError: { error in
                    onError(error)
                }
            } else {
                FirestoreService.shared.updateData(reference: cartItemRef, data: ["count" : FieldValue.increment(-1.0)]) {
                    onSuccess()
                } onError: { error in
                    onError(error.localizedDescription)
                }
            }
        } onError: { error in
            onError(error.localizedDescription)
        }
    }
    
    func getProductsFromFavorites(onSuccess: @escaping ([Product]) -> Void, onError: @escaping (String) -> Void) {
        let favoritesRef = currentUserRef
            .collection("favorites")
        
        FirestoreService.shared.getDocuments(reference: favoritesRef) { (favorites: [Product]) in
            onSuccess(favorites)
        } onError: { error in
            onError(error.localizedDescription)
        }
    }
    
    func checkProductFavoriteStatus(product: Product, onSuccess: @escaping (Bool) -> Void, onError: @escaping (String) -> Void) {
        let productRef = currentUserRef
            .collection("favorites")
            .document(product.id!.description)
        
        FirestoreService.shared.checkDocumentExists(reference: productRef) { exists in
            onSuccess(exists)
        } onError: { error in
            onError(error.localizedDescription)
        }
    }
    
    func addProductToFavorites(product: Product, onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        let productRef = currentUserRef
            .collection("favorites")
            .document(product.id!.description)
        
        let data = [
            "id" : product.id!,
            "title" : product.title!,
            "price" : product.price!,
            "description" : product.description!,
            "category" : product.category!.rawValue,
            "image" : product.image!,
            "rating" : [
                "rate" : product.rating!.rate!,
                "count" : product.rating!.count!
            ]
        ] as [String : Any]
        
        FirestoreService.shared.setData(reference: productRef, data: data) {
            onSuccess()
        } onError: { error in
            onError(error.localizedDescription)
        }
    }
    
    func removeProductFromFavorites(product: Product, onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        let productRef = currentUserRef
            .collection("favorites")
            .document(product.id!.description)
        
        FirestoreService.shared.deleteDocument(reference: productRef) {
            onSuccess()
        } onError: { error in
            onError(error.localizedDescription)
        }
    }
    
}
