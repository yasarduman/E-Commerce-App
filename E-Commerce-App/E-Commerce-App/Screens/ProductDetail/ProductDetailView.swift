//
//  ProductDetailView.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 21.11.2023.
//

import UIKit

final class ProductDetailView: UIView {

    //MARK: - UI Elements
    private lazy var productImage = CustomImageView(image: UIImage(named: "tekTas"),contentMode: .scaleAspectFit)
    private lazy var productTitle = TitleLabel(text: "Lorem Ipsum is simple",fontSize: 20, textAlignment: .left, lineBreakMode: .byTruncatingTail)
    private lazy var addToFavoritesButton = CustomButton(bgColor: .productCollectionFavoriteButtonBG, color: .productCollectionFavoriteButtonBG, systemImageName: "suit.heart", pointSize: 20,cornerStyle: .capsule)
    private lazy var favAndTitleHStack = CustomStackView(axis: .horizontal, distiribution: .fill, spacing: 6)
    private lazy var seperatorView = CustomView(backgroundColor: .tertiaryLabel)
    private lazy var descriptionLabel : UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = true
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.backgroundColor = .systemGray6
        textView.isEditable = false
        textView.isSelectable = false
        
        return textView
    }()
    private lazy var ratingHstack = CustomStackView(axis: .horizontal,distiribution: .equalCentering, spacing: 8)
    private lazy var salesAmountView = CustomView(backgroundColor: .systemGray5, cornerRadius: 12)
    private lazy var salesAmountLabel = TitleLabel(text: "320 sold", fontSize: 15, textAlignment: .center)
    private lazy var ratingCountHstack = CustomStackView(axis: .horizontal,alignment: .center, spacing: 8)
    private lazy var ratingCountImageView = CustomImageView(image: UIImage(systemName: "star.leadinghalf.filled"))
    private lazy var ratingCountLabel = TitleLabel(text:"4.5",fontSize: 16, textAlignment: .left)
    private lazy var seperatorView2 = CustomView(backgroundColor: .tertiaryLabel)
    private lazy var priceTitleAndButttonHStack = CustomStackView(axis: .horizontal, distiribution: .equalCentering, spacing: 5)
    private lazy var priceVStack = CustomStackView(axis: .vertical, alignment: .center, spacing: 5)
    private lazy var priceTitle = TitleLabel(text: "Total Price", fontSize: 15, textAlignment: .center, fontWeight: .semibold)
    private lazy var priceLabel = TitleLabel(text: "£18.65", fontSize: 22, textAlignment: .center)
    private lazy var addToCartButton = CustomButton(bgColor: .productCollectionFavoriteButtonBG, color: .productCollectionFavoriteButtonBG,title: "Add To Cart", systemImageName: "handbag",cornerStyle: .capsule)
    
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
        addSubviewsExt(productImage ,favAndTitleHStack, seperatorView, ratingHstack, descriptionLabel, priceTitleAndButttonHStack, seperatorView2)
        configureProductImage()
        configureFavAndTitleHStack()
        configureSeperator()
        configureRatingHstack()
        configureDescriptionLabel()
        configurePriceTitleAndButttonHStack()
        configureSeperatorView2()
    }
    
    private func configureProductImage() {
        productImage.anchor(top: safeAreaLayoutGuide.topAnchor,
                            leading: leadingAnchor,
                            trailing: trailingAnchor,
                            size: .init(heightSize: 300))
    }
    
    private func configureFavAndTitleHStack() {
        favAndTitleHStack.addArrangedSubviewsExt(productTitle, addToFavoritesButton)
        favAndTitleHStack.anchor(top: productImage.bottomAnchor,
                                 leading: leadingAnchor,
                                 trailing: trailingAnchor,
                                 padding: .init(leading: 10,trailing: 10))
    }
    
    private func configureSeperator() {
        seperatorView.anchor(top: favAndTitleHStack.bottomAnchor,
                             leading: leadingAnchor,
                             trailing: trailingAnchor,
                             padding: .init(top: 10,leading: 10,trailing: 10),
                             size: .init(heightSize: 0.9) )
    }
    
    private func configureRatingHstack() {
        ratingHstack.addArrangedSubviewsExt(salesAmountView, ratingCountHstack)
        ratingCountHstack.addArrangedSubviewsExt(ratingCountImageView, ratingCountLabel)
        salesAmountView.addSubview(salesAmountLabel)
        
        salesAmountView.anchor(size: .init(width: 100, height: 40))
        salesAmountLabel.centerInSuperview()
        ratingCountImageView.tintColor = .label
        ratingHstack.anchor(top: seperatorView.bottomAnchor,
                           leading: leadingAnchor,
                            padding: .init(top: 10, leading: 10),
                            size: .init(widthSize: 180)
        )
     
    }

    
    private func configureDescriptionLabel() {
        // TODO: - mock data kaldır işin bitince apiden veri çekince!!
        descriptionLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
        descriptionLabel.anchor(top: ratingHstack.bottomAnchor,
                                leading: leadingAnchor,
                                bottom: seperatorView2.topAnchor,
                                trailing: trailingAnchor,
                                padding: .init(top: 10, leading: 10,bottom: 10, trailing: 10))
    }
    
    
    private func configurePriceTitleAndButttonHStack() {
        priceTitleAndButttonHStack.addArrangedSubviewsExt(priceVStack, addToCartButton)
        priceVStack.addArrangedSubviewsExt(priceTitle, priceLabel)
        
        addToCartButton.anchor(size: .init(widthSize: 200))
        
        priceTitleAndButttonHStack.anchor(leading: leadingAnchor,
                                          bottom: safeAreaLayoutGuide.bottomAnchor,
                                          trailing: trailingAnchor,
                                          padding: .init(leading: 10,bottom: 10,trailing: 10))
    }
    
    private func configureSeperatorView2() {
        seperatorView2.anchor(leading: leadingAnchor,
                              bottom: priceTitleAndButttonHStack.topAnchor,
                              trailing: trailingAnchor,
                              padding: .init(leading: 10,bottom: 10,trailing: 10),
                              size: .init(heightSize: 0.9))
    }
}
