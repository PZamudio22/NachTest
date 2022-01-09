//
//  ChatProtocols.swift
//  NachTest
//
//  Created by Kevin Uriel Velazquez Zamudio on 08/01/22.
//

import Foundation

// MARK: Wireframe -
protocol ChatRouterProtocol: class {
    
}

// MARK: Presenter -
protocol ChatPresenterProtocol: class {
}

// MARK: Interactor -
protocol ChatInteractorProtocol: class {
    var presenter: ChatPresenterProtocol? { get set }
}

// MARK:  VIEW -
protocol ChatViewProtocol: class {
    var presenter: ChatPresenterProtocol? { get set }
    
}

