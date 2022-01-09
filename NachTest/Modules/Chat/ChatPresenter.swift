//
//  ChatPresenter.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 08/01/22.
//

import Foundation

class ChatPresenter: ChatPresenterProtocol {
    
    weak private var view: ChatViewProtocol?
    var interactor: ChatInteractorProtocol?
    private let router: ChatRouterProtocol?
    
    init(interface: ChatViewProtocol, interactor: ChatInteractorProtocol?, router: ChatRouterProtocol ) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
