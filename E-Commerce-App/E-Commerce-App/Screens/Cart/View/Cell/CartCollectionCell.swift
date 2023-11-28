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
    private lazy var productTitle = TitleLabel(fontSize: 15, textColor: .black, numberOfLines: 0)
    private lazy var removeButton = CustomButton(bgColor: .clear, color: .gray, systemImageName: "trash")
    private lazy var titleAndRemovHstack = CustomStackView(axis: .horizontal, alignment: .center)
    private lazy var categoryLabel = TitleLabel(fontSize: 12, textColor: .gray, numberOfLines: 1)
    private lazy var priceLabel = TitleLabel(fontSize: 18, textColor: .black)
    private lazy var stepperPlusButton = CustomButton(bgColor: .systemGray3, color: .black, systemImageName: "plus", cornerStyle: .capsule)
    lazy var stepperLabel = TitleLabel(fontSize: 15, textAlignment: .center, textColor: .black)
    private lazy var stepperMinusButton = CustomButton(bgColor: .systemGray3, color: .black, systemImageName: "minus", cornerStyle: .capsule)
    private lazy var stepperHStack = CustomStackView(axis: .horizontal, distiribution: .fill, spacing: 6)
    private lazy var stepperAndPriceHStack = CustomStackView(axis: .horizontal, alignment: .center)
    private lazy var allInOneVStack = CustomStackView(axis: .vertical)
    
    
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
        configureRemoveButton()
    }
    
    private func configureProductImage() {
        productImage.centerYInSuperview()
        productImage.anchor(leading: leadingAnchor,
                            padding: .init(leading: 10),
                            size: .init(widthSize: 100, heightSize: 100))
    }
    
    private func configureAllInOneVStack() {
        allInOneVStack.anchor(leading: productImage.trailingAnchor,
                              trailing: trailingAnchor,
                              padding: .init(leading: 10,trailing: 10))
        allInOneVStack.centerYInSuperview()
    }
    private func configureStepperButton() {
        stepperMinusButton.anchor(size: .init(width: 40, height: 40))
        stepperPlusButton.anchor(size: .init(width: 40, height: 40))
    }
    private func configureRemoveButton() {
        removeButton.anchor(size: .init(width: 50, height: 50))
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


