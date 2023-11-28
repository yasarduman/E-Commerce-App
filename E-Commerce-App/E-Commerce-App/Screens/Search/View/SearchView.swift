//
//  SearchView.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 24.11.2023.
//

import UIKit

class SearchView: UIView {
    
    //MARK: - UI Elements
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        return searchController
    }()
    
    lazy var resultsCollectionView = CustomCollection(backgroundColor: .systemGray6,
                                                      showsScrollIndicator: false,
                                                      scrollDirection: .vertical)
    
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    //MARK: - Configuration Methods
    private func configureUI() {
        backgroundColor = .secondarySystemBackground
        configureResultsCollectionView()
    }
    
    private func configureResultsCollectionView() {
        addSubview(resultsCollectionView)
        resultsCollectionView.fillSuperview()
    }
    
}
