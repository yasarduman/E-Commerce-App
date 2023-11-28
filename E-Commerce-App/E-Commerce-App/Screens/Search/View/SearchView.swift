//
//  SearchView.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 24.11.2023.
//

import UIKit

class SearchView: UIView {
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureUI() {
        backgroundColor = .secondarySystemBackground
    }
    
}
