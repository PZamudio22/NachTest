//
//  HomeRouter.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 07/01/22.
//

import Foundation
import UIKit

open class HomeRouter: HomeRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static public func getController() -> UIViewController {
        
       // Generating module components
        let navController = HomeViewController(nibName: "HomeViewController", bundle: Bundle(for: HomeViewController.self))
        let view = navController
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
        
    }
    
}
