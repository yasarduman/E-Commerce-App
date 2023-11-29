//
//  SearchVC.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//

import UIKit

protocol SearchVCInterface: AnyObject {
    func configureNavigationBar()
    func prepareSearchController()
    func prepareCollectionView()
    func reloadData()
}

final class SearchVC: UIViewController {
    
    //MARK: - Properties
    private lazy var searchView = SearchView()
    private lazy var viewModel = SearchVM(view: self)
    
    
    //MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
}

extension SearchVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.filteredProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = searchView.resultsCollectionView.dequeueReusableCell(withReuseIdentifier: SpecialCollectionCell.identifier, for: indexPath) as? SpecialCollectionCell else { return .init() }
        
        let product = viewModel.filteredProducts[indexPath.item]
        cell.configure(with: product)
        
        return cell
    }
}

extension SearchVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: searchView.resultsCollectionView.frame.width - 20 , height: searchView.resultsCollectionView.frame.height / 6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}

extension SearchVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = viewModel.filteredProducts[indexPath.item]
        let vc = ProductDetailVC(product: product)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SearchVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.getProductsBySearchText(searchText: searchText)
    }
}

extension SearchVC: SearchVCInterface {
    
    func configureNavigationBar() {
        navigationItem.title = "Product Search"
        navigationItem.searchController = searchView.searchController
    }
    
    func prepareSearchController() {
        searchView.searchController.searchBar.delegate = self
    }
    
    func prepareCollectionView() {
        searchView.resultsCollectionView.register(SpecialCollectionCell.self, forCellWithReuseIdentifier: SpecialCollectionCell.identifier)
        searchView.resultsCollectionView.dataSource = self
        searchView.resultsCollectionView.delegate = self
    }
    
    func reloadData() {
        searchView.resultsCollectionView.reloadData()
    }
}
