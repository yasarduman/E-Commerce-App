//
//  ProfileVC.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//

import UIKit

final class ProfileVC: UIViewController {

    //MARK: - Properties
    private let profileView = ProfileUIView()
 
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionCellRegister()
        setupDelegates()
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
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .red
        return cell
    }
    
    
}
