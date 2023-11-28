//
//  SearchVC.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//

import UIKit

protocol SearchVCInterface: AnyObject {
    
}

final class SearchVC: UIViewController {
    
    //MARK: - Properties
    private lazy var searchView = SearchView()
    private lazy var viewModel = SearchVM()
    
    
    
    override func loadView() {
        super.loadView()
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
}

extension SearchVC: SearchVCInterface {
    
}
