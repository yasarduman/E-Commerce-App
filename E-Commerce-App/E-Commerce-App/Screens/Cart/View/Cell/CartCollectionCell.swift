//
//  CartCollectionCell.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 24.11.2023.
//

import UIKit

protocol CartCollectionCellInterface: AnyObject {
    func plusStepperValueChanged(indexPath: IndexPath?)
    func minusStepperValueChanged(indexPath: IndexPath?)
    func removeButtonTapped(indexPath: IndexPath?)
}

class CartCollectionCell: UICollectionViewCell {
    
    //MARK: - Cell's Identifier
    static let identifier = "CartCollectionCell"

    //MARK: - Properties
    var indexPath: IndexPath?
    weak var delegate: CartCollectionCellInterface?
    
    //MARK: - UI Elements
    private lazy var productImage = CustomImageView(image: UIImage(systemName: "exclamationmark.circle"), contentMode: .scaleAspectFit)
    private lazy var productTitle = TitleLabel(text: "Product Title", fontSize: 15,numberOfLines: 1)
    private lazy var removeButton = CustomButton(bgColor: .clear, color: .gray, systemImageName: "trash")
    private lazy var titleAndRemovHstack = CustomStackView(axis: .horizontal, alignment: .center)
    private lazy var categoryLabel = TitleLabel(text: "Category..", fontSize: 12, textColor: .gray, numberOfLines: 1)
    private lazy var priceLabel = TitleLabel(text:"£18.99",fontSize: 18)
    private lazy var stepperPlusButton = CustomButton(bgColor: .systemGray3, color: .black, systemImageName: "plus", cornerStyle: .capsule)
    lazy var stepperLabel = TitleLabel(text:"1",fontSize: 15, textAlignment: .center)
    private lazy var stepperMinusButton = CustomButton(bgColor: .systemGray3, color: .black, systemImageName: "minus", cornerStyle: .capsule)
    private lazy var stepperHStack = CustomStackView(axis: .horizontal, distiribution: .fill, spacing: 6)
    private lazy var stepperAndPriceHStack = CustomStackView(axis: .horizontal, alignment: .center)
    private lazy var allInOneVStack = CustomStackView(axis: .vertical, distiribution: .fillEqually )
    
    
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
        backgroundColor = .white
        layer.cornerRadius = 20
        addSubviewsExt(productImage,allInOneVStack)
        allInOneVStack.addArrangedSubviewsExt(titleAndRemovHstack, categoryLabel,stepperAndPriceHStack)
        titleAndRemovHstack.addArrangedSubviewsExt(productTitle, removeButton)
        stepperAndPriceHStack.addArrangedSubviewsExt(priceLabel,stepperHStack)
        stepperHStack.addArrangedSubviewsExt(stepperMinusButton,stepperLabel, stepperPlusButton)
        configureProductImage()
        configureAllInOneVStack()
        configureStepperButton()
        configureActions()
    }
    
    private func configureProductImage() {
        productImage.anchor(leading: leadingAnchor,
                            padding: .init(leading: 10),
                            size: .init(width: 100, height: 100))
        
        productImage.centerYInSuperview()
    }
    
    private func configureAllInOneVStack() {
        allInOneVStack.anchor(leading: productImage.trailingAnchor,
                              trailing: trailingAnchor,
                              padding: .init(leading: 10,trailing: 10))
        allInOneVStack.heightAnchor.constraint(equalTo: productImage.heightAnchor).isActive = true
        allInOneVStack.centerYInSuperview()
    }
    private func configureStepperButton() {
        stepperMinusButton.anchor(size: .init(width: 40, height: 40))
        stepperPlusButton.anchor(size: .init(width: 40, height: 40))
    }
    

    
    private func configureActions() {
        removeButton.addTarget(self, action: #selector(removeButtonTapped), for: .touchUpInside)
        stepperMinusButton.addTarget(self, action: #selector(stepperMinusButtonTapped), for: .touchUpInside)
        stepperPlusButton.addTarget(self, action: #selector(stepperPlusButtonTapped), for: .touchUpInside)
    }
    
    func updateUI(cartItem: CartItem) {
        if let imageURL = cartItem.product.image {
            productImage.downloadSetImage(url: imageURL)
        }
        if let title = cartItem.product.title {
            productTitle.text = title
        }
        
        if let category = cartItem.product.category?.rawValue {
            categoryLabel.text = category
        }
        
        if let price = cartItem.product.price?.description {
            priceLabel.text = "£\(price)"
        }
        
        stepperLabel.text = cartItem.count.description
    }
    
    // MARK: - @Actions
    @objc private func removeButtonTapped() {
        delegate?.removeButtonTapped(indexPath: indexPath)
    }
    
    @objc private func stepperMinusButtonTapped() {
        delegate?.minusStepperValueChanged(indexPath: indexPath)
    }
    
    @objc private func stepperPlusButtonTapped() {
        delegate?.plusStepperValueChanged(indexPath: indexPath)
    }
}


