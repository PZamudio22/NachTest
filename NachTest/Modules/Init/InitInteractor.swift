//
//  InitInteractor.swift
//  NachTest
//
//  Created by Kevin Uriel Velazquez Zamudio on 05/01/22.
//

import Foundation
import FirebaseAuth

class InitInteractor: InitInteractorProtocol {
    
    weak var presenter: InitPresenterProtocol?
    
    func validateLogin(isFrom: Bool) {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                self.presenter?.onSuccessValidate()
            }else{
                if isFrom ==  true {
                    self.presenter?.onFailValidate()
                }
            }
        }
    }
    
}
