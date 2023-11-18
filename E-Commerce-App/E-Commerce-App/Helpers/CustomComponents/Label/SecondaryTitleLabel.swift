//
//  SecondaryTitleLabel.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//



import UIKit

final class SecondaryTitleLabel: UILabel {
    
    enum FontWeight {
        case regular, semibold, bold
    }
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Convenience Initializer
    convenience init(fontSize: CGFloat, textAlignment: NSTextAlignment, fontWeight: FontWeight = .semibold, lineBreakMode: NSLineBreakMode? = nil) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: fontWightToUIFontWeight(weight: fontWeight))
        self.lineBreakMode = lineBreakMode ?? .byTruncatingTail
    }
    
    //MARK: - Configuration Methods
    private func configureUI() {
        textColor                                 = .secondaryLabel
        adjustsFontForContentSizeCategory         = true // İçerik boyutu kategorisine göre yazı fontunu ayarlar.
        adjustsFontSizeToFitWidth                 = true // Yazının genişliğine sığdırılmasını sağlar.
        minimumScaleFactor                        = 0.9  // Eğer yazı sığdırılamazsa en küçük ölçek faktörü.
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func fontWightToUIFontWeight(weight: FontWeight) -> UIFont.Weight {
        switch weight {
        case .regular:
            return .regular
        case .semibold:
            return .semibold
        case .bold:
            return .bold
        }
    }
}
