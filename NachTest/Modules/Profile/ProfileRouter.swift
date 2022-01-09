//
//  ProfileRouter.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 08/01/22.
//

import Foundation
import UIKit

import Foundation
import UIKit

open class ProfileRouter: ProfileRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static public func getController() -> UIViewController {
       // Generating module components
        let navController = ProfileViewController(nibName: "ProfileViewController", bundle: Bundle(for: ProfileViewController.self))
        let view = navController
        let interactor = ProfileInteractor()
        let router = ProfileRouter()
        let presenter = ProfilePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
        
    }
    
}
