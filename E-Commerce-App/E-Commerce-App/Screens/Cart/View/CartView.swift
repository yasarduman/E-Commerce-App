//
//  CartView.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 24.11.2023.
//

import UIKit

final class CartView: UIView {

    //MARK: - UI Elements
    lazy var cartCollectionView = CustomCollection(backgroundColor: .systemGray6, showsScrollIndicator: false,scrollDirection: .vertical)
    private lazy var checkoutContainerView = CustomView(backgroundColor: .white,clipsToBound: true, cornerRadius: 30)
    private var priceTitle = TitleLabel(text: "Total Price",fontSize: 16, textColor: .gray)
    lazy var priceLabel = TitleLabel(fontSize: 24,textAlignment: .center)
    private lazy var priceVStack = CustomStackView(axis: .vertical, alignment: .leading)
    private lazy var checkoutButton = CustomButton(bgColor: .productCollectionFavoriteButtonBG, color: .label, title: "Checkout", systemImageName: "checkmark.shield.fill", cornerStyle: .capsule)
    
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
        addSubviewsExt(cartCollectionView,checkoutContainerView)
        checkoutContainerView.addSubviewsExt(priceVStack,checkoutButton)
        priceVStack.addArrangedSubviewsExt(priceTitle, priceLabel)
        
        configureCheckoutHstack()
        configureCartCollection()
        configureCheckoutButton()
        configurePriceVStack()
    }
    
    private func configureCartCollection() {
        cartCollectionView.anchor(top: safeAreaLayoutGuide.topAnchor,
                             leading: leadingAnchor,
                             bottom: checkoutContainerView.topAnchor,
                             trailing: trailingAnchor)
    }
    
    private func configureCheckoutHstack() {
        checkoutContainerView.anchor(leading: leadingAnchor,
                              bottom: safeAreaLayoutGuide.bottomAnchor,
                              trailing: trailingAnchor,
                              size: .init(heightSize: 100))
        checkoutContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private func configureCheckoutButton() {
        checkoutButton.anchor(trailing: trailingAnchor,
                              padding: .init(trailing: 10),
            size: .init(widthSize: 250,heightSize: 50))
        checkoutButton.centerYInSuperview()
    }
    
    private func configurePriceVStack() {
        priceVStack.anchor(leading: leadingAnchor,
                           padding: .init(leading: 10)
                           
        )
        priceVStack.centerYInSuperview()
    }
}
