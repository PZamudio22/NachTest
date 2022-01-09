//
//  ChartsCollectionViewCell.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 09/01/22.
//

import UIKit
import Charts

class ChartsCollectionViewCell: UICollectionViewCell {

// MARK: LOCAL VAR -
    var allData: Questions?
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
    var arrayColor = [UIColor]()
    
// MARK: @IBOUTLETS -
    @IBOutlet weak var pieCharView: PieChartView!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var infoCollections: UICollectionView!
    
// LIFE CYCLE CELL FUNCTIONS -
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
// MARK: GENERAL FUNCTIONS -
    func updateData(data: Questions) {
        arrayColor = [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10,c11, c12, c13, c14, c15, c16, c17, c18, c19, c20]
        allData = data
        UpdatePieChart()
        infoCollections.reloadData()
        
    }

    func UpdatePieChart() {
        infoCollections.register(UINib(nibName: "InfoChartCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "INFOCELL")
        
        // let layout = UICollectionViewFlowLayout()
        // layout.scrollDirection = .horizontal
        // layout.minimumInteritemSpacing = 0
        //  layout.minimumLineSpacing = 5
        //  layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        //  self.infoCollections.collectionViewLayout = layout
        
        infoCollections.delegate = self
        infoCollections.dataSource = self
        
        allData?.chartData?.forEach({ (chart) in
            self.dataEntry.append(PieChartDataEntry(value: Double(chart.percetnage ?? 0), label: ""))
        })
        pieCharView.holeRadiusPercent = 0.9
        let dataSet = PieChartDataSet(entries: self.dataEntry, label: "")
        dataSet.drawValuesEnabled = false
        dataSet.colors = [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10,c11, c12, c13, c14, c15, c16, c17, c18, c19, c20]
        
        self.pieCharView.data = PieChartData(dataSet: dataSet)
        infoCollections.reloadData()
        
    }

}

extension ChartsCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allData?.chartData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "INFOCELL", for: indexPath) as! InfoChartCollectionViewCell
        cell.lblName.text = allData?.chartData?[indexPath.item].text
        cell.lblName.adjustsFontSizeToFitWidth = true
        cell.colorView.roundedObject(isCircle: true, size: 0.0)
        cell.colorView.backgroundColor = arrayColor[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 50)
    }
    
    
}
