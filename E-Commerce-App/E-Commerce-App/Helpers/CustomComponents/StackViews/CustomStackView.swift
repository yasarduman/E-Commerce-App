//
//  CustomStackView.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//

import UIKit

class CustomStackView: UIStackView {

 
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(axis: NSLayoutConstraint.Axis? = nil, alignment: UIStackView.Alignment? = nil, distiribution: UIStackView.Distribution? = nil, spacing: CGFloat? = nil, backgroundColor: UIColor? = nil, cornerRadius: CGFloat? = nil) {
        self.init(frame: .zero)
       set(axis: axis, alignment: alignment, distiribution: distiribution, spacing: spacing, backgroundColor: backgroundColor, cornerRadius: cornerRadius)
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func set(axis: NSLayoutConstraint.Axis? = nil, alignment: UIStackView.Alignment? = nil ,distiribution: UIStackView.Distribution? = nil, spacing: CGFloat? = nil, backgroundColor: UIColor? = nil, cornerRadius: CGFloat? = nil) {
        
        if let axis = axis {
            self.axis = axis
        }
        if let alignment = alignment {
            self.alignment = alignment
        }
        if let distiribution = distiribution {
            self.distribution = distiribution
        }
        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor
        }
        if let cornerRadius = cornerRadius {
            layer.cornerRadius = cornerRadius
        }
        if let spacing = spacing {
            self.spacing = spacing
        }
    }
    
}
