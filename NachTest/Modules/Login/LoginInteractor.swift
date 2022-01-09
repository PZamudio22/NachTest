//
//  LoginInteractor.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 05/01/22.
//

import Foundation
import FirebaseAuth

class LoginInteractor: LoginInteractorProtocol {
    weak var presenter: LoginPresenterProtocol?
    
    func authFirebase(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if user != nil {
                self.presenter?.onSuccessAuthLogin()
                
            }else{
                if let error = error?.localizedDescription {
                    print("Firebase error", error)
                    self.presenter?.onFailAuthLogin()
                }else{
                    print("Code error")
                    self.presenter?.onFailAuthLogin()
                }
            }
        }
    }
    
}

