//
//  SpecialCollectionCell.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 18.11.2023.
//

import UIKit

final class SpecialCollectionCell: UICollectionViewCell {
    
    //MARK: - Cell's Identifier
    static let identifier = "SpecialCollectionCell"
    
    //MARK: - UI Elements
    lazy var specialImage = CustomImageView(image: UIImage(named: "tekTas"), contentMode: .scaleAspectFit,cornerRadius: 30)
    lazy var specialTitleLabel = TitleLabel(fontSize: 15, textAlignment: .center, lineBreakMode: .byTruncatingTail,textColor: .black)
    lazy var specialDetailLabel = SecondaryTitleLabel(fontSize: 12, textAlignment: .center, lineBreakMode: .byTruncatingTail, textColor: .lightGray)
    private lazy var specialLabelVStack = CustomStackView(axis: .vertical,distiribution: .fillEqually,spacing: 18)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 30 
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubviewsExt(specialImage,specialLabelVStack)
        specialLabelVStack.addArrangedSubviewsExt(specialTitleLabel, specialDetailLabel)
        
        configureSpecialImage()
        configureSpecialLabelVStack()
        // TODO: - Burayı işin bitince sill mocData
        self.specialTitleLabel.text = "Deneme Special"
        self.specialDetailLabel.text = "Deneme Special"
    }
    
    private func configureSpecialImage() {
        specialImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, constant: -10).isActive = true
        specialImage.anchor(top: topAnchor,
                            bottom: bottomAnchor,
                            trailing: trailingAnchor,
                            padding: .init(top: 10,leading: 0, bottom: 10, trailing: 0))
    }
    
    private func configureSpecialLabelVStack() {    
        specialLabelVStack.anchor(leading: leadingAnchor,
                                  trailing: specialImage.leadingAnchor,
                                  padding: .init(leading: 20, trailing: 20))
        
        specialLabelVStack.centerYInSuperview()
    }
    
    func configure(with data: Product) {
        specialTitleLabel.text = data.title
        specialDetailLabel.text = data.description
        if let imageURL = data.image {
            specialImage.downloadSetImage(url: imageURL)
        }
    }
    
}
