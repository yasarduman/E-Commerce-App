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
    
    func updateUI(with data: Product) {
        
        if let image = data.image {
            productDetailView.productImage.downloadSetImage(url: image)            
        }
        productDetailView.productTitle.text = data.title
        productDetailView.descriptionLabel.text = data.description
        if let rating = data.rating {
            productDetailView.salesAmountLabel.text = String(rating.count!) + " Sold"
            productDetailView.ratingCountLabel.text = String(rating.rate!)
        }
        if let price = data.price {
            productDetailView.priceLabel.text = "£" + String(price)
        }
    }
}

extension ProductDetailVC: ProductDetailVCInterface {
    func configureViewController() {
        productDetailView.delegate = self
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
