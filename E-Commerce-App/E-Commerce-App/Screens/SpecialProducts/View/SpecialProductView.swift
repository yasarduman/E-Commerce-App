//
//  SpecialProductView.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 20.11.2023.
//

import UIKit

final class SpecialProductView: UIView {

    //MARK: - UI Elements
    lazy var allProductCollection = CustomCollection(backgroundColor: .systemGray6, cornerRadius: 30,showsScrollIndicator: false, scrollDirection: .vertical)
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Configuration
    private func configureUI() {
        backgroundColor = .systemGray6
        configureSpecialProductCollection()
    }
    
    private func configureSpecialProductCollection() {
        addSubview(allProductCollection)
        allProductCollection.anchor(top: safeAreaLayoutGuide.topAnchor,
                                     leading: leadingAnchor,
                                    bottom: safeAreaLayoutGuide.bottomAnchor,
                                     trailing: trailingAnchor,
                                     padding: .init(top: 20, leading: 10, trailing: 10))
    }
}
