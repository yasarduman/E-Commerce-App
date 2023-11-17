//
//  CustomCollection.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//

import UIKit

final class CustomCollection: UICollectionView {

    // MARK: - Initialization
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Convenience Initializer
    convenience init(backgroundColor: UIColor? = nil, cornerRadius: CGFloat = 0, showsScrollIndicator: Bool = true, paging: Bool = false, layout: UICollectionViewFlowLayout) {
        self.init(frame: .zero, collectionViewLayout: layout)
        setupLayout(layout)
        set(backgroundColor: backgroundColor, cornerRadius: cornerRadius, showsScrollIndicator: showsScrollIndicator, paging: paging)
    }

    // MARK: - Configuration
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - Private Methods
    private func setupLayout(_ layout: UICollectionViewFlowLayout) {
        // Additional layout configuration if needed
    }

    private func set(backgroundColor: UIColor? = nil, cornerRadius: CGFloat = 0, showsScrollIndicator: Bool = true, paging: Bool = false) {
        self.backgroundColor = backgroundColor
        layer.cornerRadius = cornerRadius
        showsVerticalScrollIndicator = showsScrollIndicator
        showsHorizontalScrollIndicator = showsScrollIndicator
        isPagingEnabled = paging
    }
}

