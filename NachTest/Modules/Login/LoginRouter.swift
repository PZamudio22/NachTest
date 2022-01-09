//
//  LoginRouter.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 05/01/22.
//

import Foundation
import UIKit

open class LoginRouter: LoginRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static public func getController() -> UIViewController {
        
       // Generating module components
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: LoginViewController.self))
        let view: LoginViewController = storyboard.instantiateViewController(identifier: "LoginView") as! LoginViewController
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter 
        interactor.presenter = presenter
        router.viewController = view
        
        return view
        
    }
    
}

