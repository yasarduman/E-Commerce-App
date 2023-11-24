//
//  ChangePasswordView.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 24.11.2023.
//

import UIKit

protocol ChangePasswordViewProtocol: AnyObject {
    func resetButtonTapped()
}

final class ChangePasswordView: UIView {
    
    // MARK: - Properties
    private let HeadLabel                 = TitleLabel(text: "Reset Password",fontSize: 20, textAlignment: .left)
    lazy var passwordTextField            = CustomTextField(fieldType: .password)
    lazy var repasswordTextField          = CustomTextField(fieldType: .password)
    private lazy var resetButton          = CustomButton( bgColor: .productCollectionFavoriteButtonBG ,color: .productCollectionFavoriteButtonBG, title: "Reset", fontSize: 22, cornerStyle: .capsule)
    
    weak var delegate: ChangePasswordViewProtocol?
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubviewsExt(HeadLabel, passwordTextField, repasswordTextField, resetButton)
        configureHeadLabel()
        configureTextField()
        configureResetButton()
    }
    
  
    
    // MARK: - Configuration
    private func configureHeadLabel() {
        HeadLabel.anchor(top: safeAreaLayoutGuide.topAnchor,
                         leading: leadingAnchor,
                         padding: .init(top: 0, left: 20, bottom: 0, right: 0))
        
    }
    
    private func configureTextField() {
        passwordTextField.placeholder = "New Password"
        passwordTextField.anchor(top: HeadLabel.bottomAnchor,
                                 leading: leadingAnchor,
                                 trailing: trailingAnchor,
                                 padding: .init(top: 40, leading: 20, trailing: 20),
                                 size: .init(heightSize: 50))
        
        repasswordTextField.placeholder = "Confirm Password"
        repasswordTextField.anchor(top: passwordTextField.bottomAnchor,
                                   leading: leadingAnchor,
                                   trailing: trailingAnchor,
                                   padding: .init(top: 20, leading: 20, trailing: 20),
                                   size: .init(heightSize: 50))
    }
    
    private func configureResetButton(){
        resetButton.anchor(top: repasswordTextField.bottomAnchor,
                           leading: leadingAnchor,
                           trailing: trailingAnchor,
                           padding: .init(top: 20, leading: 20, trailing: 20),
                           size: .init(heightSize: 50))
        
        resetButton.addTarget(self, action: #selector(didTapResetButton), for: .touchUpInside)
    }
    
    // MARK: - @Actions
    @objc private func didTapResetButton(){
        delegate?.resetButtonTapped()
    }
}
