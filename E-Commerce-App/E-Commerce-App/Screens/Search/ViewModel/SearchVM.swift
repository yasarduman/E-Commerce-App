//
//  SearchVM.swift
//  E-Commerce-App
//
//  Created by Erislam Nurluyol on 27.11.2023.
//

import Foundation

protocol SearchVMInterface {
    var view: SearchVCInterface? { get set }
    func viewDidLoad()
}

final class SearchVM {
    weak var view: SearchVCInterface?
    var products : [Product] = []
    var filteredProducts: [Product] = []
    
    func getAllProducts() {
        NetworkManager.shared.getProducts { [weak self] products in
            guard let self else { return }
            self.products = products
            self.filteredProducts = products
            self.view?.reloadData()
        } onError: { error in
            print(error)
        }
    }
    
    func getProductsBySearchText(searchText: String) {
        if searchText == "" {
            filteredProducts = products
            self.view?.reloadData()
        } else {
            filteredProducts = products.filter({ $0.title!.lowercased().contains(searchText.lowercased()) })
            self.view?.reloadData()
        }
    }
}

extension SearchVM: SearchVMInterface {
    func viewDidLoad() {
        getAllProducts()
        view?.configureNavigationBar()
        view?.prepareSearchController()
        view?.prepareCollectionView()
    }
}
