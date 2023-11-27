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
    
}
