//
//  ForgotPasswordView.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 23.11.2023.
//

import UIKit

protocol ForgotPasswordViewProtocol: AnyObject{
    func forgotPasswordTapped()
    func signInTapped()
}

class ForgotPasswordView: UIView {
    
    // MARK: - Properties
    private let HeadLabel                 = TitleLabel(text: "Forgot Password", fontSize: 20)
    lazy var emailTextField               = CustomTextField(fieldType: .email)
    private lazy var forgotPasswordButton = CustomButton( bgColor: .productCollectionFavoriteButtonBG ,color: .productCollectionFavoriteButtonBG, title: "Submit", fontSize: 22, cornerStyle: .capsule)
    private let infoLabel                 = SecondaryTitleLabel(text: "Already have an account?" ,fontSize: 16, fontWeight: .regular, numberOfLines: 1)
    private lazy var signInButton         = CustomButton( bgColor:.clear ,color: .label, title: "Sign In.", fontSize: 16, fontWeight: .bold)
    
    private lazy var stackView            = CustomStackView(axis: .horizontal , alignment: .center)
    
    weak var delegate: ForgotPasswordViewProtocol?
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Configuration
    private func configureUI() {
        addSubviewsExt(HeadLabel, emailTextField, forgotPasswordButton, stackView)
        
        configureHeadLabel()
        configureTextField()
        configureForgotPassword()
        configureStackView()
    }
    
    private func configureHeadLabel() {
        HeadLabel.anchor(top: topAnchor,
                         leading: leadingAnchor,
                         padding: .init(top: 80, leading: 20 ))
    }
    
    private func configureTextField() {
        emailTextField.anchor(top: HeadLabel.bottomAnchor,
                                 leading: leadingAnchor,
                                 trailing: trailingAnchor,
                                 padding: .init(top: 40, leading: 20, trailing: 20),
                                 size: .init(heightSize: 50))
    }
    
    private func configureForgotPassword(){
        forgotPasswordButton.anchor(top: emailTextField.bottomAnchor,
                            leading: leadingAnchor,
                            trailing: trailingAnchor,
                            padding: .init(top: 20, leading: 20, trailing: 20),
                            size: .init(heightSize: 50))
        
        forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
    }
    
    private func configureStackView() {
        stackView.addArrangedSubviewsExt(infoLabel, signInButton)

        stackView.anchor(top: forgotPasswordButton.bottomAnchor,
                         padding: .init(top: 5))
        signInButton.anchor(size: .init(widthSize: 90))
        stackView.centerXInSuperview()
        
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    // MARK: - @Actions
    @objc private func didTapForgotPassword() {
        delegate?.forgotPasswordTapped()
    }
    
    @objc private func didTapSignIn() {
        delegate?.signInTapped()
    }
}
