//
//  RegisterVC.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 23.11.2023.
//

import UIKit

final class RegisterVC: UIViewController {

    //MARK: - Properties
    private let registerView = RegisterView()
    private lazy var authViewModel = AuthViewModel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func loadView() {
        super.loadView()
        view = registerView
    }
    
}

extension RegisterVC : RegisterViewProtocol {
    func signUpTapped() {
        
         //Email & Password Validation
        guard let userName = registerView.userNameTextField.text,
              let email = registerView.emailTextField.text,
              let password = registerView.passwordTextField.text,
              let rePassword = registerView.repasswordTextField.text else{
             presentAlert(title: "Alert!", message: "Username, email, password, rePassword ?", buttonTitle: "Ok")
             return
         }
         guard email.isValidEmail(email: email) else {
             presentAlert(title: "Alert!", message: "Email Invalid", buttonTitle: "Ok")
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
             // TODO: - bu çalışmıyor bunu kontrol et !!!
             guard password == rePassword else {
                 presentAlert(title: "Alert!", message: "Password and password repeat are not the same", buttonTitle: "Ok")
                 return
             }
     
         return
         }
         
         authViewModel.register(userName: userName,
                          email: email,
                          password: password) { [weak self] in
             guard let self else { return }
             presentAlert(title: "Alert!", message: "Registration Successful 🥳", buttonTitle: "Ok")
             let mainTabBar = MainTabBarController()
             self.view.window?.rootViewController = mainTabBar
         }
    }
    
    func signInTapped() {

        self.navigationController?.popToRootViewController(animated: true)
    }
}
