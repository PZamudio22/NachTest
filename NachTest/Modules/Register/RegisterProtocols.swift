//
//  registerProtocols.swift
//  NachTest
//
//  Created by Kevin Uriel Velazquez Zamudio on 08/01/22.
//

import Foundation
import UIKit

// MARK: Wireframe -
protocol RegisterRouterProtocol: class {
    
}

// MARK: Presenter -
protocol RegisterPresenterProtocol: class {
    func postNewUser(email: String, password: String, name: String, image: UIImage, nameImg: String)
    func onSuccessCreateUser() 
    func onFailCreateUser()
        
}

// MARK: Interactor -
protocol RegisterInteractorProtocol: class {
    var presenter: RegisterPresenterProtocol? { get set }
    func registerNewUser(email: String, password: String, name: String, image: UIImage, nameImg: String)

}

// MARK:  VIEW -
protocol RegisterViewProtocol: class {
    var presenter: RegisterPresenterProtocol? { get set }
    
    func successView()
    func failView()
}
