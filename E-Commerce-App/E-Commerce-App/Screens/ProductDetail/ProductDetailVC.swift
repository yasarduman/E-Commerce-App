//
//  ProductDetailVC.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 21.11.2023.
//

import UIKit

protocol ProductDetailVCInterface: AnyObject {
    func configureViewController()
}

final class ProductDetailVC: UIViewController {

    //MARK: - Properties
    private let productDetailView = ProductDetailView()
    private let viewModel = ProductDetailVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productDetailView.delegate = self
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
    
    override func loadView() {
        super.loadView()
        view = productDetailView
    }
    
}

extension ProductDetailVC: ProductDetailVCInterface {
    func configureViewController() {
        
    }
}

extension ProductDetailVC: ProductDetailViewProtocol {
    func addToFavorites() {
        print("------->>>>>> DEBUG: addToFavoritesTapped VC bak")
    }
    
    func addProductToCart() {
        print("------->>>>>> DEBUG: addProductToCartTapped VC bak")
    }
}
