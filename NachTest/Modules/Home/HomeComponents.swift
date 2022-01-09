//
//  HomeComponents.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 07/01/22.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HCELL", for: indexPath) as! HomeTableViewCell
        cell.lblName.text = arrayDummyData[indexPath.row].userName
        cell.lblPostText.text = arrayDummyData[indexPath.row].postText
        cell.lblPrecio.text = arrayDummyData[indexPath.row].price
        cell.lblDate.text = arrayDummyData[indexPath.row].country
        cell.imgUser.image = UIImage(named: arrayDummyData[indexPath.row].imgName ?? "")
        cell.imgBig.image = UIImage(named: "edificios")
        cell.imgUser.circleImage()
        cell.mainView.layer.cornerRadius = 7
    
        switch indexPath.row {
        case 2, 3:
            cell.imgBig.isHidden = true
        default:
            break

        }
        return cell
    }
    
    
}
