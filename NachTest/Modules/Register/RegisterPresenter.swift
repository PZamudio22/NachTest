//
//  RegisterPresenter.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 08/01/22.
//

import Foundation
import UIKit

class RegisterPresenter: RegisterPresenterProtocol {
    
    weak private var view: RegisterViewProtocol?
    var interactor: RegisterInteractorProtocol?
    private let router: RegisterRouterProtocol?
    
    init(interface: RegisterViewProtocol, interactor: RegisterInteractorProtocol?, router: RegisterRouterProtocol ) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
// MARK: POST NEW USER FUNCTION -
    func postNewUser(email: String, password: String, name: String, image: UIImage, nameImg: String) {
        interactor?.registerNewUser(email: email, password: password, name: name, image: image, nameImg: nameImg)
    }
    
    func onSuccessCreateUser() {
        self.view?.successView()
    }
    
    func onFailCreateUser() {
        self.view?.failView()
    }
    
}
