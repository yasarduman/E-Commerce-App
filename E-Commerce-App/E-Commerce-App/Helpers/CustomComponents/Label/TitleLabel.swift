//
//  TitleLabel.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//


import UIKit

final class TitleLabel: UILabel {
    
    enum FontWeight {
        case regular, semibold, bold
    }
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Convenience Initializer
    convenience init(text:String? = nil ,fontSize: CGFloat, textAlignment: NSTextAlignment = .left, fontWeight: FontWeight = .bold, lineBreakMode: NSLineBreakMode? = nil, textColor: UIColor = .label, numberOfLines: Int = 0) {
        self.init(frame: .zero)
        self.text = text
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: fontWightToUIFontWeight(weight: fontWeight))
        self.lineBreakMode = lineBreakMode ?? .byTruncatingTail
        self.textColor = textColor
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
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


