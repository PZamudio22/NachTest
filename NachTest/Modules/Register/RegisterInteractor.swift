//
//  RegisterInteractor.swift
//  NachTest
//
//  Created by Kevin Uriel Velazquez Zamudio on 08/01/22.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import UIKit

class RegisterInteractor: RegisterInteractorProtocol {
    weak var presenter: RegisterPresenterProtocol?
    var referenceDB: DatabaseReference!
    var imgDefault = Data()
    
    func registerNewUser(email: String, password: String, name: String, image: UIImage, nameImg: String) {
        referenceDB = Database.database().reference()
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if user != nil {
                self.saveUserInDataBase(name: name, email: email, password: password, image: image)
            }else{
                if let error = error?.localizedDescription {
                    print("Firebase error", error)
                    self.presenter?.onFailCreateUser()
                }else{
                    print("Code error")
                    self.presenter?.onFailCreateUser()
                }
            }
        }
        
    }
    
    func saveUserInDataBase(name: String, email: String, password: String, image: UIImage) {
        
        let storage = Storage.storage().reference()
        let imgName = UUID()
        let directory = storage.child("profileImages/\(imgName)")
        let metadata = StorageMetadata()
        metadata.contentType =  "image/png"
        directory.putData(image.pngData() ?? imgDefault, metadata: metadata) { (data, error) in
            if error == nil {
                print("DEBUG: La imagen se guardo")
            }else{
                if let error = error?.localizedDescription {
                    print("Firebase error", error)
                    
                }else{
                    print("Code error")
                }
            }
        }
        
        guard let id = Auth.auth().currentUser?.uid else { return }
        guard let email = Auth.auth().currentUser?.email else { return }
        
        let elements = [
            "id" : id,
            "name" : name,
            "email" : email,
            "profileImgURL" : String(describing: directory)
        ]
        
        referenceDB.child("users").child(id).setValue(elements)
        self.presenter?.onSuccessCreateUser()
        
    }
    
}
