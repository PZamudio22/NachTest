//
//  ProfilePresenter.swift
//  NachTest
//
//  Created by Kevin Uriel Velazquez Zamudio on 08/01/22.
//

import Foundation

class ProfilePresenter: ProfilePresenterProtocol {
    
    weak private var view: ProfileViewProtocol?
    var interactor: ProfileInteractorProtocol?
    private let router: ProfileRouterProtocol?
    
    init(interface: ProfileViewProtocol, interactor: ProfileInteractorProtocol?, router: ProfileRouterProtocol ) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
