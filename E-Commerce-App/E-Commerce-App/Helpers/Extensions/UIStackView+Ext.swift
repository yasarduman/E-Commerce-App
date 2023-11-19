//
//  UIStackView+Ext.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//

import Foundation

import UIKit

extension UIStackView {
    // MARK: - Adding Arranged Subviews
    func addArrangedSubviewsExt(_ views: UIView...) {
        for view in views { addArrangedSubview(view) }
    }
}
