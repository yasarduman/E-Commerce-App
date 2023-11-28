//
//  CartVC.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//

import UIKit

protocol CartVCInterface: AnyObject {
    func configureNavigationController()
    func prepareCollectionView()
    func reloadData()
    func reloadTotalPrice()
}

final class CartVC: UIViewController {

    //MARK: - Properties
    private lazy var viewModel = CartVM()
    private lazy var cartView = CartView()
    
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
        view = cartView
    }

}

extension CartVC: UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let itemCount = viewModel.cartItems?.count else { return 0}
        return itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = cartView.cartCollectionView.dequeueReusableCell(withReuseIdentifier: CartCollectionCell.identifier, for: indexPath) as? CartCollectionCell else { return .init() }
        cell.delegate = self
        cell.indexPath = indexPath // indexPath'i set ettik
        guard let cartItems = viewModel.cartItems else { return .init() }
        let cartItem = cartItems[indexPath.item]
        cell.updateUI(cartItem: cartItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cartView.cartCollectionView.frame.width - 20 , height: cartView.cartCollectionView.frame.height / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          return 20
      }
}


extension CartVC: CartCollectionCellInterface {
    func plusStepperValueChanged(indexPath: IndexPath?) {
        guard let indexPath = indexPath else { return }
        if let cartItems = viewModel.cartItems {
            let item = cartItems[indexPath.item]
            viewModel.increaseCountOfCartItem(cartItem: item)
        }
    }
    
    func minusStepperValueChanged(indexPath: IndexPath?) {
        guard let indexPath = indexPath else { return }
        if let cartItems = viewModel.cartItems {
            let item = cartItems[indexPath.row]
            viewModel.decreaseCountOfCartItem(cartItem: item)
        }
    }
    
    func removeButtonTapped(indexPath: IndexPath?) {
        guard let indexPath = indexPath else { return }
        if let cartItems = viewModel.cartItems {
            let item = cartItems[indexPath.row]
            viewModel.removeProductFromCart(cartItem: item)
        }
    }
}

extension CartVC: CartVCInterface {
    func configureNavigationController() {
        title = "Cart"
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func prepareCollectionView() {
        cartView.cartCollectionView.register(CartCollectionCell.self, forCellWithReuseIdentifier: CartCollectionCell.identifier)
        cartView.cartCollectionView.dataSource = self
        cartView.cartCollectionView.delegate = self
    }
    
    func reloadData() {
        cartView.cartCollectionView.reloadData()
    }
    
    func reloadTotalPrice() {
        cartView.priceLabel.text = "£" + String(format: "%.2f", viewModel.totalPrice)
    }
}
