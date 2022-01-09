//
//  PieListRouter.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 08/01/22.
//

import Foundation
import UIKit

open class PieListRouter: PieListRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static public func getController() -> UIViewController {
       // Generating module components
        let navController = PieListViewController(nibName: "PieListViewController", bundle: Bundle(for: PieListViewController.self))
        let view = navController
        let interactor = PieListInteractor()
        let router = PieListRouter()
        let presenter = PieListPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
        
    }
    
}
