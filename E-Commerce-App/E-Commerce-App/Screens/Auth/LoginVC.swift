//
//  LoginVC.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 23.11.2023.
//

import UIKit

class LoginVC: UIViewController {

    //MARK: - Properties
    private let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        super.loadView()
        view = loginView
    }
    
}
