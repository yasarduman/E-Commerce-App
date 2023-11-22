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
    private lazy var specialImage = CustomImageView(image: UIImage(named: "tekTas"), contentMode: .scaleAspectFit,cornerRadius: 30)
    private lazy var specialTitleLabel = TitleLabel(fontSize: 15, textAlignment: .center, lineBreakMode: .byWordWrapping,textColor: .black)
    private lazy var specialHStack = CustomStackView(axis: .horizontal ,alignment: .center,distiribution: .fillEqually,spacing: 18)
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 30 
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Configuration
    private func configureUI() {
        addSubview(specialHStack)
        specialHStack.addArrangedSubviewsExt(specialTitleLabel, specialImage)
        configureSpecialHStack()
   
        // TODO: - Burayı işin bitince sill mocData
        self.specialTitleLabel.text = "Deneme Special"
        
    }
    
    private func configureSpecialHStack() {
        specialHStack.fillSuperview(padding: .init(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    func configure(with data: Product) {
        specialTitleLabel.text = data.title

        if let imageURL = data.image {
            specialImage.downloadSetImage(url: imageURL)
        }
    }
    
}
