//
//  HomePresenter.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 07/01/22.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    
    weak private var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    private let router: HomeRouterProtocol?
    
    init(interface: HomeViewProtocol, interactor: HomeInteractorProtocol?, router: HomeRouterProtocol ) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
