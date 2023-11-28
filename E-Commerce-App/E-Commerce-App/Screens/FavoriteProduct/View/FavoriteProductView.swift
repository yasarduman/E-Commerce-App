//
//  FavoriteProductView.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 28.11.2023.
//

import UIKit

final class FavoriteProductView: UIView {

    //MARK: - UI Elements
    lazy var favoriteCollection =  CustomCollection(backgroundColor: .systemGray6, cornerRadius: 30,showsScrollIndicator: false, scrollDirection: .vertical)
    
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
        backgroundColor = .secondarySystemBackground

        configureFavoriteCollection()
    }
    
    private func configureFavoriteCollection() {
        addSubview(favoriteCollection)
        favoriteCollection.anchor(top: safeAreaLayoutGuide.topAnchor,
                                           leading: leadingAnchor,
                                           bottom: safeAreaLayoutGuide.bottomAnchor,
                                           trailing: trailingAnchor,
                                           padding: .init(top: 20, leading: 10, trailing: 10))
    }
}
