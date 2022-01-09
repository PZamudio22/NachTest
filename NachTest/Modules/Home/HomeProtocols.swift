//
//  HomeProtocols.swift
//  NachTest
//
//  Created by Kevin Uriel Velazquez Zamudio on 07/01/22.
//

import Foundation

// MARK: Wireframe -
protocol HomeRouterProtocol: class {
    
}

// MARK: Presenter -
protocol HomePresenterProtocol: class {
}

// MARK: Interactor -
protocol HomeInteractorProtocol: class {
    var presenter: HomePresenterProtocol? { get set }
}

// MARK:  VIEW -
protocol HomeViewProtocol: class {
    var presenter: HomePresenterProtocol? { get set }
    
}
