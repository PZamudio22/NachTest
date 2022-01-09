//
//  InitPresenter.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 05/01/22.
//

import Foundation

class InitPresenter: InitPresenterProtocol {
    
    weak private var view: InitViewProtocol?
    var interactor: InitInteractorProtocol?
    private let router: InitRouterProtocol?
    
    init(interface: InitViewProtocol, interactor: InitInteractorProtocol?, router: InitRouterProtocol ) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func validateLogin(isFrom: Bool) {
        interactor?.validateLogin(isFrom: isFrom)
    }
    
    func onSuccessValidate() {
        self.view?.successAuthValidate()
    }
    
    func onFailValidate() {
        self.view?.failAuthValidate()
    }

}
