//
//  SecondaryTitleLabel.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//



import UIKit

final class SecondaryTitleLabel: UILabel {
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Convenience Initializer
    convenience init(fontSize: CGFloat, textAlignment: NSTextAlignment, lineBreakMode: NSLineBreakMode) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        self.lineBreakMode = lineBreakMode
    }
    
    //MARK: - Configuration Methods
    private func configureUI() {
        textColor                                 = .secondaryLabel
        adjustsFontForContentSizeCategory         = true // İçerik boyutu kategorisine göre yazı fontunu ayarlar.
        adjustsFontSizeToFitWidth                 = true // Yazının genişliğine sığdırılmasını sağlar.
        minimumScaleFactor                        = 0.9  // Eğer yazı sığdırılamazsa en küçük ölçek faktörü.
        translatesAutoresizingMaskIntoConstraints = false
    }
}
