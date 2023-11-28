//
//  FavoriteProductVC.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 28.11.2023.
//

import UIKit

protocol FavoriteProductVCInterface: AnyObject {
    func configureViewController()
    func favoriteCollectionReloadData()
}

final class FavoriteProductVC: UIViewController {

    //MARK: - Properties
    private let favoriteProtductView = FavoriteProductView()
    private lazy var viewModel = FavoriteProductVM()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        view = favoriteProtductView
    }
    
    //MARK: - Configure NavBar
    private func configureNavBar() {
        title = "Favorite Products"
        navigationItem.backBarButtonItem?.tintColor = .black
    }
    
    //MARK: - Register Custom Cell
    private func collectionCellRegister() {
        favoriteProtductView.favoriteCollection.register(SpecialCollectionCell.self, forCellWithReuseIdentifier: SpecialCollectionCell.identifier)
    }
    
    //MARK: - Setup Delegates
    private func setupDelegates() {
        favoriteProtductView.favoriteCollection.delegate = self
        favoriteProtductView.favoriteCollection.dataSource = self
    }
}

extension FavoriteProductVC:  UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.favoriteProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = favoriteProtductView.favoriteCollection.dequeueReusableCell(withReuseIdentifier: SpecialCollectionCell.identifier, for: indexPath) as? SpecialCollectionCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: viewModel.favoriteProducts[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = viewModel.favoriteProducts[indexPath.item]
        let vc = ProductDetailVC(product: product)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: favoriteProtductView.favoriteCollection.frame.width, height: favoriteProtductView.favoriteCollection.frame.width / 2 - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          return 20
    }
 
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let deleteAction = UIAction(title: "Sil") { [weak self] _ in
            guard let self else { return }
            
            let product = viewModel.favoriteProducts[indexPath.item]
            viewModel.removeProductFromFavorites(for: product)
          
        }

        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            UIMenu(title: "Actions", children: [deleteAction])
        }
    }
}

extension FavoriteProductVC: FavoriteProductVCInterface {
    func favoriteCollectionReloadData() {
        favoriteProtductView.favoriteCollection.reloadData()
    }
    
    func configureViewController() {
        configureNavBar()
        collectionCellRegister()
        setupDelegates()
    }
}
