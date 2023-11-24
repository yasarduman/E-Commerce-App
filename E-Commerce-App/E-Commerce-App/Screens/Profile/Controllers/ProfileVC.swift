//
//  ProfileVC.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//

import UIKit

final class ProfileVC: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    //MARK: - Properties
    private let profileView = ProfileView()
    private lazy var viewModel = ProfileVM()
    private lazy var models: [SettingsOption] = []
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        profileView.delegate = self
        configureProfile()
        collectionCellRegister()
        setupDelegates()
        configureTableViewCell()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureProfile()
    }
    
    override func loadView() {
        super.loadView()
        view = profileView
    }
    
    //MARK: - Register Custom Cell
    private func collectionCellRegister() {
        profileView.tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
     
    }
    
    //MARK: - Setup Delegates
    private func setupDelegates() {
        profileView.tableView.dataSource = self
        profileView.tableView.delegate = self
    }
    
    private func configureTableViewCell() {
        models.append(SettingsOption(title: "Change Password", icon: UIImage(systemName: "exclamationmark.lock.fill"), iconBackgrondColor: .productCollectionFavoriteButtonBG, handler: {
            let vc = ChangePasswordVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }))

        models.append(SettingsOption(title: "Help and Support", icon: UIImage(systemName: "questionmark.circle"), iconBackgrondColor: .productCollectionFavoriteButtonBG, handler: {
            let vc = HelpAndSupportVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }))

        models.append(SettingsOption(title: "Log out", icon: UIImage(systemName: "rectangle.portrait.and.arrow.forward"), iconBackgrondColor: .productCollectionFavoriteButtonBG, handler: {
            self.viewModel.logout {
                let loginVC = LoginVC()
                let nav = UINavigationController(rootViewController: loginVC)
                self.view.window?.rootViewController = nav
            }
        }))
    }
    
    private func configureProfile() {
        viewModel.fetchUserPhoto { url in
            self.profileView.userImage.downloadSetImage(url: url)
        }
        
        viewModel.fetchUserName { userName in
            self.profileView.userName.text = userName
            
            //Flitered userName
            let nameSurname = userName.components(separatedBy: " ")
            if nameSurname.count >= 2 {
                let userNamex = nameSurname[0]
                self.profileView.userMesage.text = "Tekrardan Hoşgeldin \(userNamex) 🎉"
            } else {
                print("Tekrardan Hoşgeldin 🎉")
            }
        }
    }
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = profileView.tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier) as?  SettingTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = models[indexPath.row]
        model.handler()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        profileView.userImage.image = info[.originalImage] as? UIImage
        viewModel.uploadUserPhoto(imageData: (profileView.userImage.image!))
        self.dismiss(animated: true)
    }
}

extension ProfileVC: ProfileViewProtocol {
    func chooeseImageTapped() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true)
    }
}
