//
//  RegisterRouter.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 08/01/22.
//

import Foundation
import UIKit

open class RegisterRouter: RegisterRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static public func getController() -> UIViewController {
        
       // Generating module components
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: RegisterViewController.self))
        let view: RegisterViewController = storyboard.instantiateViewController(identifier: "RegisterView") as! RegisterViewController
        let interactor = RegisterInteractor()
        let router = RegisterRouter()
        let presenter = RegisterPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
        
    }
    
}
