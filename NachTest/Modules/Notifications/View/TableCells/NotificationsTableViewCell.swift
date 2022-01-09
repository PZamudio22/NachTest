//
//  NotificationsTableViewCell.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 08/01/22.
//

import UIKit

class NotificationsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSubText: UILabel!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var lblHrs: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
