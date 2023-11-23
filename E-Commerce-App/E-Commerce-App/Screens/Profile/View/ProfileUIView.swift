//
//  ProfileUIView.swift
//  Movie-App
//
//  Created by Yaşar Duman on 4.11.2023.
//

import UIKit

final class ProfileUIView: UIView, UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    //MARK: - UI Elements
    lazy var containerImage: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 60
        container.layer.shadowColor = UIColor.label.cgColor
        container.layer.shadowOffset = CGSize(width: 0, height: 0)
        container.layer.shadowOpacity = 0.9
        container.layer.shadowRadius = 8
        return container
    }()
    
    lazy var userImage: UIImageView = {
        let image = UIImageView()
        let config = UIImage.SymbolConfiguration(weight: .ultraLight)
        image.image = UIImage(systemName: "person.circle",withConfiguration: config)
        image.backgroundColor = .systemBackground
        image.tintColor = .lightGray
        image.clipsToBounds = true
        image.layer.cornerRadius = 60
        return image
    }()
    
    lazy var userAddImageIcon: UIImageView = {
        let image = UIImageView()
        let config = UIImage.SymbolConfiguration(weight: .bold)
        image.image = UIImage(systemName: "pencil.circle.fill", withConfiguration: config)
        image.tintColor = .productCollectionFavoriteButtonBG
        return image
    }()
    private lazy var userName = TitleLabel(text: "Yaşar DUMAN",fontSize: 20)
    private lazy var userMesage = TitleLabel(text: "Tekrardan Hoşgeldin Yaşar 🎉",fontSize: 15, textColor: .secondaryLabel)
    
    lazy var tableView = UITableView()
    
  
    
    // MARK: - Initializers
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
        addSubviewsExt(containerImage, userAddImageIcon, userName, userMesage, tableView)
        configureContainerImage()
        configureImage()
        configureLabel()
        configureTableView()
    }
    
    private func configureContainerImage(){
       
        containerImage.anchor(top: safeAreaLayoutGuide.topAnchor,
                              leading: leadingAnchor,
                              padding: .init(top:20 ,leading: 20))
        containerImage.anchor(size: .init(width: 120, height: 120))
        
    }
    
    private func configureImage(){
        containerImage.addSubview(userImage)
        
        userImage.fillSuperview()
        
        userAddImageIcon.anchor(bottom: userImage.bottomAnchor,
                                trailing: userImage.trailingAnchor,
                                padding: .init( bottom: 5, trailing: 5),
                                size: .init(width: 30, height: 30))
    }
    
    private func configureLabel() {
        userName.anchor(top: userImage.topAnchor,
                        leading: userImage.trailingAnchor,
                        padding: .init(top: 20, leading: 20))
        
        userMesage.anchor(top: userName.topAnchor,
                          leading: userImage.trailingAnchor,
                          trailing: trailingAnchor,
                          padding: .init(top: 40, leading: 20))
    }
    
    private func configureTableView() {
        tableView.anchor(top: containerImage.bottomAnchor,
                         leading: leadingAnchor,
                         bottom: safeAreaLayoutGuide.bottomAnchor,
                         trailing: trailingAnchor,
                         padding: .init(top: 40, leading: 20,trailing: 20)
        )
    }
}
