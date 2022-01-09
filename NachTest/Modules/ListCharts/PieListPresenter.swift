//
//  PieListPresenter.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 08/01/22.
//

import Foundation

class PieListPresenter: PieListPresenterProtocol {
    
    weak private var view: PieListViewProtocol?
    var interactor: PieListInteractorProtocol?
    private let router: PieListRouterProtocol?
    
    init(interface: PieListViewProtocol, interactor: PieListInteractorProtocol?, router: PieListRouterProtocol ) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func requestList() {
        interactor?.getCharts()
    }
    
    func onSuccessList(data: ChartsData, response: HTTPURLResponse) {
        DispatchQueue.main.async {
            if response.statusCode == 200 {
                self.view?.successList(data: data)
            }else{
                self.view?.failList(messagge: "Error en el codigo")
            }
        }
    }
    
    func onFailList(error: Error) {
        DispatchQueue.main.async {
            self.view?.failList(messagge: error.localizedDescription)
        }
    }

}
