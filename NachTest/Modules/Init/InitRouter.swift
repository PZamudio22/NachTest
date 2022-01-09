//
//  InitRouter.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 05/01/22.
//

import Foundation
import UIKit

open class InitRouter: InitRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static public func getController(form: Bool) -> UIViewController {
        
       // Generating module components
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: InitViewController.self))
        let view: InitViewController = storyboard.instantiateViewController(identifier: "InitView") as! InitViewController
        let interactor = InitInteractor()
        let router = InitRouter()
        let presenter = InitPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        view.isFromLaunch = form
        interactor.presenter = presenter
        router.viewController = view
        
        return view
        
    }
    
}
