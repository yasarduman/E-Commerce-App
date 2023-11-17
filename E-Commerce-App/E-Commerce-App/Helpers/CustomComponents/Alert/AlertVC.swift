//
//  AlertVC.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//


import UIKit

final class AlertVC: UIViewController {
    // MARK: - Properties
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    
    //MARK: - UI Elements
    lazy var containerView  = AlertContainerView()
    lazy var titleLabel     = TitleLabel( fontSize: 20, textAlignment: .center,lineBreakMode: .byTruncatingTail)
    lazy var messageLabel   = SecondaryTitleLabel(fontSize:17 ,textAlignment: .center,lineBreakMode: .byWordWrapping)
    lazy var actionButton   = CustomButton(bgColor: .systemPink, color: .systemPink, title: "Ok", systemImageName: "checkmark.circle")
    
    
    //MARK: - Initializers
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        
        self.alertTitle   = title
        self.message      = message
        self.buttonTitle  = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        view.addSubviewsExt(containerView, titleLabel, actionButton, messageLabel)
        configureUI()
    }
    
    
    // MARK: - UI Configuration
    private func configureUI() {
           configureContainerView()
           configureTitleLabel()
           configureMessageLabel()
           configureActionButton()
    }
    
    private func configureContainerView() {
        containerView.centerInSuperview()
        containerView.anchor(size: .init(width: 280, height: 220))
    }
    
    private func configureTitleLabel() {
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        titleLabel.anchor(top: containerView.topAnchor,
                          leading: containerView.leadingAnchor,
                          trailing: containerView.trailingAnchor,
                          padding: .init(top: 20, left: 20, bottom: 0, right: 20),
                          size: .init(width: 0, height: 28))
    }
    
    private func configureMessageLabel(){
        messageLabel.text           = message ?? "Unable to complete request"
        messageLabel.numberOfLines  = 4
        
        messageLabel.anchor(top: titleLabel.bottomAnchor,
                            leading: containerView.leadingAnchor,
                            bottom: actionButton.topAnchor,
                            trailing: containerView.trailingAnchor,
                            padding: .init(top: 8, left: 20, bottom: 12, right: 20))
      
    }
    
    private func configureActionButton() {
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        actionButton.anchor(leading: containerView.leadingAnchor,
                            bottom: containerView.bottomAnchor,
                            trailing: containerView.trailingAnchor,
                            padding: .init(top: 0, left: 20, bottom: 20, right: 20),
                            size: .init(width: 0, height: 44))
      
    }
    
    // MARK: - Actions
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
}
