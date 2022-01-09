//
//  InitProtocols.swift
//  NachTest
//
//  Created by Kevin Uriel Velazquez Zamudio on 05/01/22.
//

import Foundation

// MARK: Wireframe -
protocol InitRouterProtocol: class {
    
}

// MARK: Presenter -
protocol InitPresenterProtocol: class {
    func validateLogin(isFrom: Bool)
    func onSuccessValidate()
    func onFailValidate()

}

// MARK: Interactor -
protocol InitInteractorProtocol: class {
    var presenter: InitPresenterProtocol? { get set }
    func validateLogin(isFrom: Bool)
}

// MARK:  VIEW -
protocol InitViewProtocol: class {
    var presenter: InitPresenterProtocol? { get set }
    func successAuthValidate() 
    func failAuthValidate()
        
}
