//
//  ForgotPasswordVC.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 23.11.2023.
//

import UIKit

final class ForgotPasswordVC: UIViewController {
   
    //MARK: - Properties
    private let forgotPasswordView = ForgotPasswordView()
    private lazy var viewModel     = AuthViewModel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        forgotPasswordView.delegate = self
        configureNavBar()
    }
    
    override func loadView() {
        super.loadView()
        view = forgotPasswordView
    }
    
    private func configureNavBar() {
        view.backgroundColor = .systemBackground
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

}

extension ForgotPasswordVC: ForgotPasswordViewProtocol {
    func forgotPasswordTapped() {
        
        guard let email = forgotPasswordView.emailTextField.text else {
            return
        }
        
        guard email.isValidEmail(email: email) else {
            presentAlert(title: "Alert!", message: "Invalide Email Address", buttonTitle: "Ok")
            return
        }
        
        viewModel.resetPassword(email: email) { [weak self] success, message in
            guard let self else { return }

            if success {
                presentAlert(title: "Alert!", message: message, buttonTitle: "Ok")
                navigationController?.popToRootViewController(animated: true)
            } else {
                presentAlert(title: "Alert!", message: message, buttonTitle: "Ok")
            }
        }
    }
    
    func signInTapped() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
