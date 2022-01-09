//
//  ChatRouter.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 08/01/22.
//

import Foundation
import UIKit

open class ChatRouter: ChatRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static public func getController() -> UIViewController {
       // Generating module components
        let navController = ChatViewController(nibName: "ChatViewController", bundle: Bundle(for: ChatViewController.self))
        let view = navController
        let interactor = ChatInteractor()
        let router = ChatRouter()
        let presenter = ChatPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
        
    }
    
}
