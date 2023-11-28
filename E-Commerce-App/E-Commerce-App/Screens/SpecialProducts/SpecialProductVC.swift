//
//  SpecialProductVC.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 20.11.2023.
//

import UIKit

protocol SpecialVCInterface: AnyObject {
    func configureViewController()
}

final class SpecialProductVC: UIViewController {

    //MARK: - Properties
    private let specialProductView = SpecialProductView()
    private lazy var viewModel = SpecialProductVM()
    private lazy var specialProducts: [Product] = []
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        view = specialProductView
    }
    
    //MARK: - Configure NavBar
    private func configureNavBar() {
        title = "Special Products"
        navigationItem.backBarButtonItem?.tintColor = .black
    }
    
    //MARK: - Register Custom Cell
    private func collectionCellRegister() {
        specialProductView.allProductCollection.register(SpecialCollectionCell.self, forCellWithReuseIdentifier: SpecialCollectionCell.identifier)
    }
    
    //MARK: - Setup Delegates
    private func setupDelegates() {
        specialProductView.allProductCollection.delegate = self
        specialProductView.allProductCollection.dataSource = self
    }
    
    func updateUI(with data: [Product]) {
        specialProducts = data
    }
}

extension SpecialProductVC: UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return specialProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = specialProductView.allProductCollection.dequeueReusableCell(withReuseIdentifier: SpecialCollectionCell.identifier, for: indexPath) as? SpecialCollectionCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: specialProducts[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = specialProducts[indexPath.item]
        let vc = ProductDetailVC(product: product)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: specialProductView.allProductCollection.frame.width, height: specialProductView.allProductCollection.frame.width / 2 - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          return 20
      }

//      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//          return 10
//      }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//           return UIEdgeInsets(top: 25, left: 0, bottom: 25, right: 0)
//       }
    
    
}

extension SpecialProductVC: SpecialVCInterface {
    func configureViewController() {
        configureNavBar()
        collectionCellRegister()
        setupDelegates()
    }
}
