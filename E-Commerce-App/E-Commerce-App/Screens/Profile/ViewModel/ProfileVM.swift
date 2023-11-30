//
//  ProfileVM.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage


// MARK: - Settings Option Data Structure
struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgrondColor: UIColor
    let handler: (() -> Void)
}


// MARK: - ViewModel
final class ProfileVM {
    let currentUserID = Auth.auth().currentUser!.uid
    lazy var firebaseAuthManager = FirebaseAuthManager()
    
    
    func fetchUserName(completion: @escaping (String) -> Void) {
        Firestore.firestore()
            .collection("UsersInfo")
            .document(currentUserID)
            .getDocument { snapshot, error in
                if let error = error {
                    print(error.localizedDescription)
                }
                if let snapshot = snapshot {
                    if let data = snapshot.data() {
                        let userName = data["userName"] as! String
                        completion(userName)
                    }
                }
            }
    }
    
    func uploadUserPhoto(imageData: UIImage) {
        let storageRefernce = Storage.storage().reference()
        
        //turn of image into data
        let imageData = imageData.jpegData(compressionQuality: 0.8)
        
        guard imageData != nil else{
            return
        }
        
        let fileRef = storageRefernce.child("Media/\(currentUserID).jpg")
        
        fileRef.putData(imageData!, metadata: nil)
    }
    
    func fetchUserPhoto(completion: @escaping (String) -> Void) {
        let storageRef = Storage.storage().reference()
        
        let fileRef = storageRef.child("Media/\(currentUserID).jpg")
        fileRef.downloadURL { url, error in
            if error == nil {
                let imageUrl = url?.absoluteString
                completion(imageUrl!)
            }
        }
    }
    
    func logout(completion: @escaping () -> Void ) {
        firebaseAuthManager.signOut {
            completion()
        } onError: { error in
            print(error)
        }
    }
}
