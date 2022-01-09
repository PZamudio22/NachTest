//
//  PieListProtcols.swift
//  NachTest
//
//  Created by Kevin Uriel Velazquez Zamudio on 08/01/22.
//

import Foundation
import Charts

// MARK: Wireframe -
protocol PieListRouterProtocol: class {
    
}

// MARK: Presenter -
protocol PieListPresenterProtocol: class {
    func requestList()
    func onSuccessList(data: ChartsData, response: HTTPURLResponse)
    func onFailList(error: Error)
    
}

// MARK: Interactor -
protocol PieListInteractorProtocol: class {
    var presenter: PieListPresenterProtocol? { get set }
    func getCharts()
}

// MARK:  VIEW -
protocol PieListViewProtocol: class {
    var presenter: PieListPresenterProtocol? { get set }
    func successList(data: ChartsData)
    func failList(messagge: String)
    
}

