//
//  CartVC.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//

import UIKit

final class CartVC: UIViewController {

    //MARK: - Properties
    private let cartView = CartView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    override func loadView() {
        super.loadView()
        view = cartView
    }
    
    private func configureUI() {
        configureViewController()
        collectionCellRegister()
        setupDelegates()
    }
    //MARK: - Configure ViewController
    
    private func configureViewController() {
        title = "Cart"
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .secondarySystemBackground
    }
    
    //MARK: - Register Custom Cell
    private func collectionCellRegister() {
        cartView.cartCollction.register(CartCollectionCell.self, forCellWithReuseIdentifier: CartCollectionCell.identifier)

    }
    
    //MARK: - Setup Delegates
    private func setupDelegates() {
        cartView.cartCollction.dataSource = self
        cartView.cartCollction.delegate = self
    }

}

extension CartVC: UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = cartView.cartCollction.dequeueReusableCell(withReuseIdentifier: CartCollectionCell.identifier, for: indexPath) as? CartCollectionCell else {
            return UICollectionViewCell()
        }
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cartView.cartCollction.frame.width - 20 , height: (cartView.cartCollction.frame.width / 2 ) - 25 )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          return 20
      }
}


extension CartVC: CartCollectionCellInterface {
    func plusStepperValueChanged() {
        print("------->>>>>> DEBUG: plusStepperValueChanged")
    }
    
    func minusStepperValueChanged() {
        print("------->>>>>> DEBUG: minusStepperValueChanged")
    }
    
    func removeButtonTapped() {
        print("------->>>>>> DEBUG: removeButtonTapped")
    }
}
