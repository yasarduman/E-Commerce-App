//
//  LoginView.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 23.11.2023.
//

import UIKit

class LoginView: UIView {
    
    // MARK: - Properties
    private let HeadLabel                 = TitleLabel(text: "Let's sign you in", fontSize: 20)
    private lazy var emailTextField       = CustomTextField(fieldType: .email)
    private lazy var passwordTextField    = CustomTextField(fieldType: .password)
    private lazy var signInButton         = CustomButton( bgColor: .productCollectionFavoriteButtonBG ,color: .productCollectionFavoriteButtonBG , title: "Sign In", fontSize: 22)
    private lazy var googleSignInButton   = CustomButton( bgColor: UIColor.systemBlue ,color: UIColor.systemBlue , title: "Sign In with Google", fontSize: 22, systemImageName: "g.circle.fill")
    private let infoLabel                 = SecondaryTitleLabel(text: "Don't have an account?", fontSize: 16,fontWeight: .regular, numberOfLines: 1)
    private lazy var newUserButton        = CustomButton( bgColor:.clear ,color: .label, title: "Sign Up.", fontSize: 16,fontWeight: .bold)
    private lazy var forgotPasswordButton = CustomButton( bgColor:.clear ,color: .productCollectionFavoriteButtonBG , title: "Forgot password?", fontSize: 16)
    private lazy var stackView            = CustomStackView(axis: .horizontal , alignment: .center)
    
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
        backgroundColor = .systemBackground
      addSubviewsExt(HeadLabel, emailTextField, passwordTextField, forgotPasswordButton, signInButton, googleSignInButton, stackView)
        
        configureHeadLabel()
        configureTextField()
        configureForgotPassword()
        configureSignIn()
        configureStackView()
        
    }
    private func configureHeadLabel() {
        
        HeadLabel.anchor(top: topAnchor,
                         leading: leadingAnchor,
                         padding: .init(top: 80, left: 20, bottom: 0, right: 0))
    }
    
    private func configureTextField() {
        emailTextField.anchor(top: HeadLabel.bottomAnchor,
                              leading: leadingAnchor,
                              trailing: trailingAnchor,
                              padding: .init(top: 40, left: 20, bottom: 0, right: 20),
                              size: .init(width: 0, height: 50))
        
        passwordTextField.anchor(top: emailTextField.bottomAnchor,
                                 leading: leadingAnchor,
                                 trailing: trailingAnchor,
                                 padding: .init(top: 20, left: 20, bottom: 0, right: 20),
                                 size: .init(width: 0, height: 50))
    }
    
    private func configureForgotPassword(){
        forgotPasswordButton.tintColor = .systemPurple
        
        forgotPasswordButton.anchor(top: passwordTextField.bottomAnchor,
                                    trailing: passwordTextField.trailingAnchor,
                                    padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        
       // forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
    }
    
    private func configureSignIn(){
        signInButton.configuration?.cornerStyle = .capsule
        googleSignInButton.configuration?.cornerStyle = .capsule
        
        signInButton.anchor(top: forgotPasswordButton.bottomAnchor,
                            leading: leadingAnchor,
                            trailing: trailingAnchor,
                            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
                            size: .init(width: 0, height: 50))
        
        
        googleSignInButton.anchor(top: signInButton.bottomAnchor,
                                  leading: leadingAnchor,
                                  trailing: trailingAnchor,
                                  padding: .init(top: 20, left: 20, bottom: 0, right: 20),
                                  size: .init(width: 0, height: 50))
        
        
        //signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
       // googleSignInButton.addTarget(self, action: #selector(didTapGoogleSignIn), for: .touchUpInside)
    }
    
    private func configureStackView() {
        stackView.addArrangedSubviewsExt(infoLabel, newUserButton)
        
        stackView.anchor(top: googleSignInButton.bottomAnchor,
                         padding: .init(top: 5))
        newUserButton.anchor(size: .init(widthSize: 90))
        stackView.centerXInSuperview()
  
        
        //newUserButton.addTarget(self, action: #selector(didTapNewUser), for: .touchUpInside)
    }
}

