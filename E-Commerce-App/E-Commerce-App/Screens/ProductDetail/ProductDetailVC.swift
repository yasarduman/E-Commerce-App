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
    private lazy var viewModel = ProductDetailVM()
    var product: Product
    
    
    //MARK: - Initializers
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
        self.viewModel.product = product
        productDetailView.updateUI(with: product)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
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
        productDetailView.delegate = self
        if let isFavorite = viewModel.isFavorite {
            self.productDetailView.addToFavoritesButton.setImage(UIImage(systemName: isFavorite ? "suit.heart.fill" : "suit.heart"), for: .normal)            
        }
    }
}

extension ProductDetailVC: ProductDetailViewProtocol {
    func addToFavorites() {
        viewModel.toggleFavoriteStatus()
    }
    
    func addProductToCart() {
        FirestoreManager.shared.addProductToCart(product: product) { [weak self] in
            guard let self else { return }
            presentAlert(title: "Alert", message: "The product added to cart successfully 🛒", buttonTitle: "OK")
        } onError: { [weak self] error in
            guard let self else { return }
            presentAlert(title: "Alert", message: error, buttonTitle: "OK")
        }
    }
}
