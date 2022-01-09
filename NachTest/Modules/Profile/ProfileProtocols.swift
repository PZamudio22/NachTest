//
//  ProfileProtocols.swift
//  NachTest
//
//  Created by Kevin Uriel Velazquez Zamudio on 08/01/22.
//

import Foundation

// MARK: Wireframe -
protocol ProfileRouterProtocol: class {
    
}

// MARK: Presenter -
protocol ProfilePresenterProtocol: class {
}

// MARK: Interactor -
protocol ProfileInteractorProtocol: class {
    var presenter: ProfilePresenterProtocol? { get set }
}

// MARK:  VIEW -
protocol ProfileViewProtocol: class {
    var presenter: ProfilePresenterProtocol? { get set }
    
}
