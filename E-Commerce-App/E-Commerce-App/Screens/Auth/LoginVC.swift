//
//  LoginVC.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 23.11.2023.
//

import UIKit
import Firebase
import GoogleSignIn
import FirebaseAuth

final class LoginVC: UIViewController {

    //MARK: - Properties
    private let loginView      = LoginView()
    private lazy var viewModel = AuthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
    }
    
    override func loadView() {
        super.loadView()
        view = loginView
    }
    
}

//MARK: - HomeViewInterface
extension LoginVC: LoginViewProtocol {

    func signUpTapped() {
        let vc = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func forgotPasswordTapped() {
        let vc = ForgotPasswordVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func signIn() {
        //Email & Password Validation
        
        guard let email = loginView.emailTextField.text,
              let password = loginView.passwordTextField.text else{
            presentAlert(title: "Alert!", message: "Email and Password ?", buttonTitle: "Ok")
            return
        }
        
        guard email.isValidEmail(email: email) else {
            presentAlert(title: "Alert!", message: "Email Invalid", buttonTitle: "Ok")
            return
        }

        viewModel.login(email: email, password: password) { [weak self] in
            guard let self else { return }
            presentAlert(title: "Alert!", message: "Entry Successful 🥳", buttonTitle: "Ok")
            let mainTabBar = MainTabBarController()
            self.view.window?.rootViewController = mainTabBar
        }
    }
    
    func googleSignIn() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
            guard error == nil else {
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString,
                    let userName: String = user.profile?.name
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            viewModel.signInGoogle(credential: credential,username: userName) {[weak self] in
                guard let self else { return }
                presentAlert(title: "Alert!", message: "Registration Successful 🥳", buttonTitle: "Ok")
                let mainTabBar = MainTabBarController()
                self.view.window?.rootViewController = mainTabBar
            }
        }
    }
}
