//
//  HelpAndSupportVC.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//


import UIKit
import MessageUI

final class HelpAndSupportVC: UIViewController, MFMailComposeViewControllerDelegate {
    //MARK: - Properties
    private let mailComposer = MFMailComposeViewController()
    private let headLabel    = TitleLabel(text: "Get In Touch",fontSize: 25, textAlignment: .center)
    private let secoLabel    = SecondaryTitleLabel(fontSize: 20,textAlignment: .center,numberOfLines: 2)
    lazy var getInTouchImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "getInTouch")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // MARK: - Header View
    private var user1 = HelpAndSupportView(
        userName: "Yaşar Duman",
        userImageName: "userAvatar",
        userEmail: "01.yasarduman@gmail.com")
    private var user2 = HelpAndSupportView(
        userName: "Erislam Nurluyol",
        userImageName: "userAvatar",
        userEmail: "01.yasarduman@gmail.com")
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemGroupedBackground
        configureUI()
    }
    
    // MARK: - Cofigure UI
    private func configureUI() {
        configureGetInTouchImage()
        configureHeadText()
        configureUser1()
        configureUser2()
    }
    
    private func configureGetInTouchImage(){
        view.addSubviewsExt(getInTouchImage,headLabel,secoLabel,user1 ,user2)
        getInTouchImage.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                               leading: view.leadingAnchor,
                               trailing: view.trailingAnchor,
                               
                               size: .init(heightSize: 300))
    }
    
    private func configureHeadText(){
        secoLabel.text = "If you have any inquiries get in touch with us. We'll be happy to help you"
        
        headLabel.anchor(top: getInTouchImage.bottomAnchor)
        headLabel.centerXInSuperview()
        
        secoLabel.anchor(top: headLabel.bottomAnchor,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor,
                         padding: .init(top: 20, leading: 20, trailing: 20)
        )
    }
    
    // MARK: - Configure Users
    private func configureUser1() {
        user1.anchor(top: secoLabel.bottomAnchor,
                            leading: view.leadingAnchor,
                            trailing: view.trailingAnchor,
                            padding: .init(top: 20, leading: 10, trailing: 10),
                            size: .init(heightSize: 100))
        
        // MARK: - SendEmail
        mailComposer.setToRecipients([user1.userEmail!]) // E-posta alıcısı
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(sendEmail))
        user1.sendImage.isUserInteractionEnabled = true // UIImageView'ı etkileşimli hale getirin
        user1.sendImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func configureUser2() {
        user2.anchor(top: user1.bottomAnchor,
                            leading: view.leadingAnchor,
                            trailing: view.trailingAnchor,
                            padding: .init(top: 20, leading: 10, trailing: 10),
                            size: .init(heightSize: 100))
        
        // MARK: - SendEmail
        mailComposer.setToRecipients([user2.userEmail!]) // E-posta alıcısı
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(sendEmail))
        user2.sendImage.isUserInteractionEnabled = true // UIImageView'ı etkileşimli hale getirin
        user2.sendImage.addGestureRecognizer(tapGestureRecognizer2)
    }
    
    // MARK: - Action
    @objc private func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
                mailComposer.mailComposeDelegate = self
                present(mailComposer, animated: true, completion: nil)
            } else {
               presentAlert(title: "Hata", message: "E-posta gönderme işlevi kullanılamıyor.", buttonTitle: "Ok")
            }
    }
}
