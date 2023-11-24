//
//  CustomImageView.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//

import UIKit

final class CustomImageView: UIImageView {

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Convenience Initializer
    convenience init(image: UIImage? = nil , contentMode: ContentMode = .scaleAspectFit, cornerRadius: CGFloat = 0) {
        self.init(frame: .zero)
        self.image = image
        set(contentMode: contentMode, cornerRadius: cornerRadius)


    }

    // MARK: - Configuration
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - Public Methods
    func set(contentMode: ContentMode = .scaleAspectFit, cornerRadius: CGFloat = 0) {
        self.contentMode = contentMode
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = cornerRadius > 0
    }
}
