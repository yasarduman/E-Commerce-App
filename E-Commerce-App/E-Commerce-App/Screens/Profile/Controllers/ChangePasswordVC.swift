//
//  ChangePasswordVC.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//

import UIKit

final class ChangePasswordVC: UIViewController {
    
    private let changePasswordView = ChangePasswordView()
    private let authVM : AuthViewModel?   = AuthViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        changePasswordView.delegate = self
        configureViewController()
     
    }
    
    override func loadView() {
        super.loadView()
        view = changePasswordView
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    
}

extension ChangePasswordVC: ChangePasswordViewProtocol {
    func resetButtonTapped() {
        guard let password = changePasswordView.passwordTextField.text,
              let rePassword = changePasswordView.repasswordTextField.text else{
            presentAlert(title: "Alert!", message: "Password ?", buttonTitle: "Ok")
            return
        }
        
        guard password.isValidPassword(password: password) else {
            
            guard password.count >= 6 else {
                presentAlert(title: "Alert!", message: "Password must be at least 6 characters", buttonTitle: "Ok")
                return
            }
            
            guard password.containsDigits(password) else {
                presentAlert(title: "Alert!", message: "Password must contain at least 1 digit", buttonTitle: "Ok")
                return
            }
            
            guard password.containsLowerCase(password) else {
                presentAlert(title: "Alert!", message: "Password must contain at least 1 lowercase character", buttonTitle: "Ok")
                return
            }
            
            guard password.containsUpperCase(password) else {
                presentAlert(title: "Alert!", message: "Password must contain at least 1 uppercase character", buttonTitle: "Ok")
                return
            }
            // TODO: - çalışmıyor buna bakınnn !!!
            guard  password == rePassword  else {
                presentAlert(title: "Alert!", message: "Password and password repeat are not the same", buttonTitle: "Ok")
                return
            }
            return
        }
    
        authVM?.changePassword(password: rePassword) { [weak self] success, error in
            guard let self = self else { return }
            
            if success {
                changePasswordView.passwordTextField.text = ""
                changePasswordView.repasswordTextField.text = ""
                self.presentAlert(title: "Alert!", message: "Password change Successful 🥳", buttonTitle: "Ok")
                
            } else {
                self.presentAlert(title: "Alert!", message: error, buttonTitle: "Ok")
            }
        }
    }
}
