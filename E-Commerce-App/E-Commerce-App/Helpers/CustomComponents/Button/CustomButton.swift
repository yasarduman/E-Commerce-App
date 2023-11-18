//
//  CustomButton.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//


import UIKit

final class CustomButton: UIButton {
    
    enum FontWeight {
        case regular, semibold, bold
    }
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Convenience Initializer
    convenience init(bgColor: UIColor, color: UIColor, title: String, fontSize: Int = 18, fontWeight: FontWeight = .semibold, systemImageName: String? = nil, pointSize: CGFloat? = 15 , cornerStyle: UIButton.Configuration.CornerStyle? = .medium) {
        self.init(frame: .zero)
        set(bgColor: bgColor, color: color, title: title, fontSize: fontSize, fontWeight: fontWeight, systemImageName: systemImageName, pointSize: pointSize, cornerStyle: cornerStyle)
    }
    
    //MARK: - Configuration Methods
    private func configure() {
        configuration = .tinted()
        configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Helper Functions
    private func set(bgColor: UIColor, color: UIColor, title: String, fontSize: Int, fontWeight: FontWeight, systemImageName: String?, pointSize: CGFloat? = 15, cornerStyle: UIButton.Configuration.CornerStyle?) {
        configuration?.baseBackgroundColor = bgColor
        configuration?.baseForegroundColor = color
        configuration?.cornerStyle = cornerStyle ?? .medium
        configuration?.title = title
        
        if let imageName = systemImageName {
            configuration?.image = UIImage(systemName: imageName,withConfiguration: UIImage.SymbolConfiguration(pointSize: pointSize ?? 10))
            configuration?.imagePadding = 6
        }
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: fontWightToUIFontWeight(weight: fontWeight))
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
