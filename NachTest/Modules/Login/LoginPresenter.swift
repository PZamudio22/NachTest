//
//  LoginPresenter.swift
//  NachTest
//
//  Created by Kevin Uriel Velazquez Zamudio on 05/01/22.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    
    weak private var view: LoginViewProtocol?
    var interactor: LoginInteractorProtocol?
    private let router: LoginRouterProtocol?
    
    init(interface: LoginViewProtocol, interactor: LoginInteractorProtocol?, router: LoginRouterProtocol ) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func loginAuthFirebase(email: String, password: String) {
        interactor?.authFirebase(email: email, password: password)
    }
    
    func onSuccessAuthLogin() {
        self.view?.successAuthLogin()
    }
    
    func onFailAuthLogin() {
        self.view?.failAuthLogin()
    }
}

