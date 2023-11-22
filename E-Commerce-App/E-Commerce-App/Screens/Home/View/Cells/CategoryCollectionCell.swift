//
//  CategoryCollectionCell.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 18.11.2023.
//

import UIKit

final class CategoryCollectionCell: UICollectionViewCell {
    //MARK: - Cell's Identifier
    static let identifier = "CategoryCollectionCell"
    
    //MARK: - UI Elements
    private lazy var categoryImage = CustomImageView(contentMode: .scaleAspectFit, cornerRadius: 30)
    private lazy var categoryName = TitleLabel(fontSize: 12, textAlignment: .center, fontWeight: .regular, lineBreakMode: .byWordWrapping)
    private lazy var categoryVStack = CustomStackView(axis: .vertical, alignment: .center,spacing: 8)
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
        addSubview(categoryVStack)
        categoryVStack.addArrangedSubviewsExt(categoryImage,categoryName)
        configureCategoryVStack()
        categoryImage.backgroundColor = .lightGray
        categoryImage.anchor(size: .init(width: 60, height: 60))
        
    }
    
    private func configureCategoryVStack() {
        categoryVStack.centerInSuperview()
        categoryVStack.anchor(size: .init(width: 80, height: 80))
    }
    
    func configure(with data: Category ) {
        categoryImage.image = data.image
        categoryName.text = data.name
    }
   
}

