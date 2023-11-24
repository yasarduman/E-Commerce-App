//
//  HelpAndSupportView.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//

import UIKit

final class HelpAndSupportView: UIView {
    // MARK: - UI Elements
    lazy var containerView : UIView = {
        let container = UIView()
        container.backgroundColor = .secondarySystemBackground
        container.layer.cornerRadius = 10
        return container
    }()
    
    lazy var userImage   = CustomImageView(image: UIImage(named: "men"), cornerRadius: 35)
    lazy var userName    = TitleLabel(text: "Yaşr Duman",fontSize: 20)
    lazy var userMessage = TitleLabel(text: "Send you a message",fontSize: 15)

    lazy var sendImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "message.badge.filled.fill")
        image.tintColor = .productCollectionFavoriteButtonBG
        return image
    }()
    
    // MARK: - Properties
    var userEmail: String?
    
    // MARK: - Initializers
    init(userName:String, userImageName: String ,userEmail: String) {
       super.init(frame: .zero)
       self.userName.text = userName
       self.userImage.image = UIImage(named: userImageName)
       self.userEmail = userEmail
        
       configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Configuration
    private func configureUI(){
        addSubview(containerView)
        containerView.addSubviewsExt(userImage,userName, userMessage, sendImage)
        configureContainer()
        configureuserImage()
        configureUserName()
        configureUserMessage()
        configureSendIamge()
    }
    
    private func configureContainer(){
        
        containerView.backgroundColor = .tertiarySystemGroupedBackground
        containerView.fillSuperview()
    }
    
    private func configureuserImage(){
        userImage.anchor(leading: containerView.leadingAnchor,
                         padding: .init(leading: 15),
                         size: .init(width: 70, height: 70))
        
        userImage.centerYInSuperview()
    }
    
    private func configureUserName(){
        userName.anchor(top: containerView.topAnchor,
                        padding: .init(top: 20))
        
        userName.centerXInSuperview()
    }
    
    private func configureUserMessage(){
        userMessage.anchor(top: userName.bottomAnchor,
                           padding: .init(top: 10))
        
        userMessage.centerXInSuperview()
    }
    
    private func configureSendIamge(){
        sendImage.anchor(trailing: containerView.trailingAnchor,
                         padding: .init(trailing: 10),
                         size: .init(width: 35, height: 35))
        
        sendImage.centerYInSuperview()
        
    }
}
