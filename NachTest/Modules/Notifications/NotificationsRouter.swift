//
//  NotificationsRouter.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 08/01/22.
//

import Foundation
import UIKit

open class NotificationsRouter: NotificationsRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static public func getController() -> UIViewController {
       // Generating module components
        let navController = NotificationsViewController(nibName: "NotificationsViewController", bundle: Bundle(for: NotificationsViewController.self))
        let view = navController
        let interactor = NotificationsInteractor()
        let router = NotificationsRouter()
        let presenter = NotificationsPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
        
    }
    
}
