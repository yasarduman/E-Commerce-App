//
//  ProductCollectionCell.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 18.11.2023.
//

import UIKit

final class ProductCollectionCell: UICollectionViewCell {
    
    //MARK: - Cell's Identifier
    static let identifier = "ProductCollectionCell"
    
    //MARK: - UI Elements
    private lazy var infoSeperatorView = CustomView(backgroundColor: UIColor.ProductCollectionSeperatorBG, cornerRadius: 10)
    private lazy var imageContainerView = CustomView(backgroundColor: UIColor.ProductCollectionImageBG, cornerRadius: 10)
    lazy var productImageView = CustomImageView(image: UIImage(named: "headset"), contentMode: .scaleAspectFit)
    lazy var productFavoriteButton = CustomButton(bgColor: UIColor.ProductCollectionFavoriteButtonBG, color: UIColor.ProductCollectionFavoriteButtonBG, title: "", systemImageName: "suit.heart", pointSize: 14,cornerStyle: .capsule)
    private lazy var productInfoStackView = CustomStackView(axis: .vertical, alignment: .center)
    lazy var productInfoLabel = TitleLabel(fontSize: 12, textAlignment: .left, fontWeight: .regular)
    lazy var priceLabel = TitleLabel(fontSize: 14, textAlignment: .left, fontWeight: .regular)
    
    
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
        addSubviewsExt(infoSeperatorView, imageContainerView)
        
        configureInfoSeperatorView()
        configureImageContainerView()
        configureProductImageView()
        
        
        
    }
    
    private func configureInfoSeperatorView() {
        infoSeperatorView.anchor(leading: leadingAnchor,
                                 bottom: bottomAnchor,
                                 trailing: trailingAnchor,
                                 size: .init(heightSize: 100)
        )
    }
    
    private func configureImageContainerView() {
        imageContainerView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -20).isActive = true
        imageContainerView.anchor(size: .init(heightSize: 100))
        imageContainerView.centerXInSuperview()
        imageContainerView.centerYAnchor.constraint(equalTo: infoSeperatorView.topAnchor).isActive = true
    }
    
    private func configureProductImageView() {
        imageContainerView.addSubview(productImageView)
        imageContainerView.addSubview(productFavoriteButton)
        
        productImageView.fillSuperview(padding: .init(top: 10, bottom: 10))
        
        productFavoriteButton.anchor(top: imageContainerView.topAnchor,
                                     trailing: imageContainerView.trailingAnchor,
                                     padding: .init(top: 4, trailing: 4),
                                     size: .init(width: 25, height: 25))
        
        
    }
    
    
}
