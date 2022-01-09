//
//  ProfileComponents.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 08/01/22.
//

import Foundation
import UIKit

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "POSTCELL", for: indexPath) as! PostsTableViewCell
        heightPostTable.constant = cell.bounds.height * CGFloat(dummyData.count)
        cell.imgUser.image = UIImage(named: dummyData[indexPath.row].imgName ?? "")
        cell.imgUser.circleImage()
        cell.imgBig.image = UIImage(named: "edificios")
        cell.lblName.text = dummyData[indexPath.row].userName
        cell.lblDate.text = dummyData[indexPath.row].country
        cell.lblText.text = dummyData[indexPath.row].postText
        cell.lblPrice.text = dummyData[indexPath.row].price
        
        return cell
    }
    
    
}
