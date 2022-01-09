//
//  LoginProtocols.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 05/01/22.
//

import Foundation

// MARK: Wireframe -
protocol LoginRouterProtocol: class {
    
}

// MARK: Presenter -
protocol LoginPresenterProtocol: class {
    func loginAuthFirebase(email: String, password: String)
    func onSuccessAuthLogin() 
    func onFailAuthLogin()
    
}

// MARK: Interactor -
protocol LoginInteractorProtocol: class {
    var presenter: LoginPresenterProtocol? { get set }
    func authFirebase(email: String, password: String)
}

// MARK:  VIEW -
protocol LoginViewProtocol: class {
    var presenter: LoginPresenterProtocol? { get set }
    func successAuthLogin() 
    func failAuthLogin()
}
