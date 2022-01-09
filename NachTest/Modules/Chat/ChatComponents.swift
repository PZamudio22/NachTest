//
//  ChatComponents.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 08/01/22.
//

import Foundation
import UIKit

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CHATCELL", for: indexPath) as! ChatTableViewCell
        
        cell.imgPerson.image = UIImage(named: arrayDummyData[indexPath.row].imgName ?? "")
        cell.imgPerson.circleImage()
        cell.mainView.roundedObject(isCircle: false, size: 7.0)
        cell.numberView.roundedObject(isCircle: true, size: 0.0)
        cell.lblName.text = arrayDummyData[indexPath.row].userName
        cell.lblText.text = arrayDummyData[indexPath.row].messaggeText
        cell.lblDate.text = arrayDummyData[indexPath.row].dayAgo
        cell.lbl2.text = "\(arrayDummyData[indexPath.row].NumberMessagges ?? 0)"
        cell.lbl2.adjustsFontSizeToFitWidth = true
        return cell
    }
    
}
