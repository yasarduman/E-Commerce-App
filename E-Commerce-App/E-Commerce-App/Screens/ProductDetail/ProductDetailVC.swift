//
//  ProductDetailVC.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 21.11.2023.
//

import UIKit

final class ProductDetailVC: UIViewController {

    //MARK: - Properties
    private let productDetailView = ProductDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        super.loadView()
        view = productDetailView
    }
    
}
