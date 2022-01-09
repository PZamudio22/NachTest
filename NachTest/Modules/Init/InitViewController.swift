//
//  InitViewController.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 05/01/22.
//

import UIKit
import FirebaseAuth

class InitViewController: UIViewController, InitViewProtocol {
    
// MARK: PROTOCOL VAR -
    var presenter: InitPresenterProtocol?
    
// MARK: LOCAL VAR -
    var isFromLaunch = false

// MARK: LIFE CYCLE VIEW FUNCTIONS -
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.validateLogin(isFrom: isFromLaunch)
        
    }
    
// MARK: AUTH FUNCTIONS -
    
    func successAuthValidate() {
        let module = LoginRouter.getController()
        self.navigationController?.pushViewController(module, animated: true)
    }
    
    func failAuthValidate() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: NavigationMenuBaseController.self))
        let customTabBar = storyboard.instantiateViewController(identifier: "TabBarCustom")
        self.navigationController?.pushViewController(customTabBar, animated: true)
    }

}


