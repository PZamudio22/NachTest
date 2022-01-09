//
//  NotificationsProtocols.swift
//  NachTest
//
//  Created by Kevin Uriel Velazquez Zamudio on 08/01/22.
//

import Foundation

// MARK: Wireframe -
protocol NotificationsRouterProtocol: class {
    
}

// MARK: Presenter -
protocol NotificationsPresenterProtocol: class {
}

// MARK: Interactor -
protocol NotificationsInteractorProtocol: class {
    var presenter: NotificationsPresenterProtocol? { get set }
}

// MARK:  VIEW -
protocol NotificationsViewProtocol: class {
    var presenter: NotificationsPresenterProtocol? { get set }
    
}
