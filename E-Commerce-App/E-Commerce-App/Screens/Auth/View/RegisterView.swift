//
//  RegisterView.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 23.11.2023.
//

import UIKit
protocol RegisterViewProtocol: AnyObject {
    func signUpTapped()
    func signInTapped()

}

final class RegisterView: UIView {
    
    // MARK: - Properties
    private let HeadLabel                 = TitleLabel(text: "Create an account",fontSize: 20)
    lazy var userNameTextField            = CustomTextField(fieldType: .username)
    lazy var emailTextField               = CustomTextField(fieldType: .email)
    lazy var passwordTextField            = CustomTextField(fieldType: .password)
    lazy var repasswordTextField          = CustomTextField(fieldType: .password)
    private lazy var signUpButton         = CustomButton( bgColor: .productCollectionFavoriteButtonBG ,color: .productCollectionFavoriteButtonBG, title: "Sign Up", fontSize: 22, cornerStyle: .capsule)
    private let infoLabel                 = SecondaryTitleLabel(text: "Already have an account?" ,fontSize: 16, fontWeight: .regular, numberOfLines: 1)
    private lazy var signInButton         = CustomButton( bgColor:.clear ,color: .label, title: "Sign In.", fontSize: 16, fontWeight: .bold)
    
    private lazy var stackView            = CustomStackView(axis: .horizontal , alignment: .center)
    
    
    weak var delegate: RegisterViewProtocol?
    
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
        addSubviewsExt(HeadLabel, userNameTextField, emailTextField, passwordTextField, repasswordTextField, signUpButton, signInButton, stackView)
        
        configureHeadLabel()
        configureTextField()
        configureSignUp()
        configureStackView()
    }
    
    private func configureHeadLabel() {
        HeadLabel.anchor(top: topAnchor,
                         leading: leadingAnchor,
                         padding: .init(top: 80, leading: 20))
    }
    
    private func configureTextField() {
        userNameTextField.anchor(top: HeadLabel.bottomAnchor,
                              leading: leadingAnchor,
                              trailing: trailingAnchor,
                              padding: .init(top: 40, left: 20, bottom: 0, right: 20),
                              size: .init(width: 0, height: 50))
        
        emailTextField.anchor(top: userNameTextField.bottomAnchor,
                              leading: leadingAnchor,
                              trailing: trailingAnchor,
                              padding: .init(top: 20, leading: 20, trailing: 20),
                              size: .init(width: 0, height: 50))

        
        passwordTextField.anchor(top: emailTextField.bottomAnchor,
                              leading: leadingAnchor,
                              trailing: trailingAnchor,
                              padding: .init(top: 20, leading: 20, trailing: 20),
                              size: .init(width: 0, height: 50))
        
        repasswordTextField.placeholder = "Repassword"
           
        repasswordTextField.anchor(top: passwordTextField.bottomAnchor,
                              leading: leadingAnchor,
                              trailing:trailingAnchor,
                              padding: .init(top: 20, leading: 20, trailing: 20),
                              size: .init( heightSize: 50))
    }
    
    private func configureSignUp(){
        signUpButton.anchor(top: repasswordTextField.bottomAnchor,
                            leading: leadingAnchor,
                            trailing: trailingAnchor,
                            padding: .init(top: 20, leading: 20, trailing: 20),
                            size: .init (heightSize: 50))
        
        signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
       
    }

    private func configureStackView() {
        stackView.addArrangedSubviewsExt(infoLabel, signInButton)
        
        stackView.anchor(top: signUpButton.bottomAnchor,
                         padding: .init(top: 5))
        signInButton.anchor(size: .init(widthSize: 90))
        stackView.centerXInSuperview()
        
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    // MARK: - Action
    @objc private func didTapSignUp() {
        delegate?.signUpTapped()
    }
    
    @objc private func didTapSignIn() {
        delegate?.signInTapped()
    }
}
