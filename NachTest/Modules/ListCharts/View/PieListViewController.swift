//
//  PieListViewController.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 08/01/22.
//

import UIKit
import Charts

class PieListViewController: UIViewController, PieListViewProtocol {
    
// MARK: PROTOCOL VAR -
    var presenter: PieListPresenterProtocol?
    
// MARK: @IBOUTLETS -
    @IBOutlet weak var pieCharView: PieChartView!
    @IBOutlet weak var mainCollection: UICollectionView!
    
// MARK: LOCAL VAR -
    var dataEntry : [PieChartDataEntry] = Array()
    let c1 = UIColor.blue
    let c2 = UIColor.red
    let c3 = UIColor.yellow
    let c4 = UIColor.green
    let c5 = UIColor.orange
    let c6 = UIColor.black
    let c7 = UIColor.brown
    let c8 = UIColor.gray
    let c9 = UIColor.systemBlue
    let c10 = UIColor.systemPink
    let c11 = UIColor.init(red: 60/255, green: 199/255, blue: 247/255, alpha: 1)
    let c12 = UIColor(red: 122/255, green: 129/255, blue: 255/255, alpha: 1)
    let c13 = UIColor(red: 148/255, green: 33/255, blue: 147/255, alpha: 1)
    let c14 = UIColor(red: 0/255, green: 143/255, blue: 0/255, alpha: 1)
    let c15 = UIColor(red: 0/255, green: 145/255, blue: 147/255, alpha: 1)
    let c16 = UIColor(red: 1/255, green: 25/255, blue: 147/255, alpha: 1)
    let c17 = UIColor(red: 148/255, green: 17/255, blue: 0/255, alpha: 1)
    let c18 = UIColor(red: 148/255, green: 23/255, blue: 81/255, alpha: 1)
    let c19 = UIColor(red: 0/255, green: 84/255, blue: 147/255, alpha: 1)
    let c20 = UIColor(red: 255/255, green: 212/255, blue: 121/255, alpha: 1)
    
    var arrayQuestion = [Questions]()
    
// MARK: LIFE CYCLE VIEW FUNCTIONS -
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdatePieChart()
        presenter?.requestList()
        
    }
    
// MARK: GENERAL FUNCTIONS -
    func UpdatePieChart() {
        self.dataEntry.append(PieChartDataEntry(value: 50.0, label: ""))
        self.dataEntry.append(PieChartDataEntry(value: 60.0, label: ""))
        self.dataEntry.append(PieChartDataEntry(value: 10.0, label: ""))
        
        pieCharView.holeRadiusPercent = 0.2
        let dataSet = PieChartDataSet(entries: self.dataEntry, label: "")
        dataSet.drawValuesEnabled = false
        dataSet.colors = [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10,c11, c12, c13, c14, c15, c16, c17, c18, c19, c20]
        
        self.pieCharView.data = PieChartData(dataSet: dataSet)
        self.navigationController?.navigationBar.alpha = 1
        
    }
    
// MARK: SETUP FUNTIONS -
    func setupCollection() {
        mainCollection.register(UINib(nibName: "ChartsCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "CHARTCELL")
        mainCollection.delegate = self
        mainCollection.dataSource = self
    }
    
}

// MARK: SERVICES FUNTIONS -
extension PieListViewController {
    func successList(data: ChartsData) {
        data.questions?.forEach({ (item) in
            arrayQuestion.append(item)
        })
        setupCollection()
    }
    
    func failList(messagge: String) {
        print(messagge)
    }
}
