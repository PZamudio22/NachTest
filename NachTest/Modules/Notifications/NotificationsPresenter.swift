//
//  NotificationsPresenter.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 08/01/22.
//

import Foundation

class NotificationsPresenter: NotificationsPresenterProtocol {
    
    weak private var view: NotificationsViewProtocol?
    var interactor: NotificationsInteractorProtocol?
    private let router: NotificationsRouterProtocol?
    
    init(interface: NotificationsViewProtocol, interactor: NotificationsInteractorProtocol?, router: NotificationsRouterProtocol ) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
