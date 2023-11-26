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
        cell.indexPath = indexPath // indexPath'i set ettik
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cartView.cartCollction.frame.width - 20 , height: (cartView.cartCollction.frame.width / 2 ) - 25 )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          return 20
      }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}


extension CartVC: CartCollectionCellInterface {
    func plusStepperValueChanged(indexPath: IndexPath?) {
        guard let indexPath = indexPath else { return }
        print("DEBUG: Artırma işlemi yapılan hücre index'i: \(indexPath.row)")
        
        guard  indexPath == indexPath,
               let cell = cartView.cartCollction.cellForItem(at: indexPath) as? CartCollectionCell else { return }
        
        // Artırma işlemi
        if let currentCount = Int(cell.stepperLabel.text ?? "0") {
            cell.stepperLabel.text = "\(currentCount + 1)"
        }
    }
    
    func minusStepperValueChanged(indexPath: IndexPath?) {
        guard let indexPath = indexPath else { return }
        print("DEBUG: Eksiltme işlemi yapılan hücre index'i: \(indexPath.row)")
        
        guard  indexPath == indexPath,
               let cell = cartView.cartCollction.cellForItem(at: indexPath) as? CartCollectionCell else { return }
        
        // Eksiltme işlemi
        if let currentCount = Int(cell.stepperLabel.text ?? "0"), currentCount > 1 {
            cell.stepperLabel.text = "\(currentCount - 1)"
        }
    }
    
    func removeButtonTapped(indexPath: IndexPath?) {
        guard let indexPath = indexPath else { return }
        print("DEBUG: Silme işlemi yapılan hücre index'i: \(indexPath.row)")
    }
}
