//
//  PieListInteractor.swift
//  NachTest
//
//  Created by Kevin Uriel Velazquez Zamudio on 08/01/22.
//

import Foundation
import UIKit

class PieListInteractor: PieListInteractorProtocol {
    weak var presenter: PieListPresenterProtocol?
    
    func getCharts() {
        guard let apiURL = URL(string: "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld") else { return }
        var request = URLRequest(url: apiURL)
        
        request.httpMethod = "GET"
        request.setValue("applications/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do{
                if data != nil {
                    let contentReponse: ChartsData = try JSONDecoder().decode(ChartsData.self, from: data!)
                    self.presenter?.onSuccessList(data: contentReponse, response: (response as! HTTPURLResponse))
                
                }
                
            }catch{
                print("Error to download data", error.localizedDescription, error)
                self.presenter?.onFailList(error: error)
            }
        }.resume()
        
    }
    
}
