//
//  NotificationsComponents.swift
//  NachTest
//
//  Created by Kevin Uriel Velazquez Zamudio on 08/01/22.
//

import Foundation
import UIKit

extension NotificationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NOTIFICELL", for: indexPath) as! NotificationsTableViewCell
        
        cell.mainView.roundedObject(isCircle: false, size: 7.0)
        cell.imgUser.circleImage()
        cell.lblName.text = arrayDummyData[indexPath.row].name
        cell.lblSubText.text = arrayDummyData[indexPath.row].country
        cell.lblText.text = arrayDummyData[indexPath.row].text
        cell.lblHrs.text = arrayDummyData[indexPath.row].time
        cell.imgUser.image = UIImage(named: arrayDummyData[indexPath.item].imgName ?? "")
        
        return cell
    }
    
}
