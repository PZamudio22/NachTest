//
//  HomeTableViewCell.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 08/01/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblPostText: UILabel!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var imgBig: UIImageView!
    @IBOutlet weak var imgHeart: UIImageView!
    @IBOutlet weak var imgMesagge: UIImageView!
    @IBOutlet weak var lblPrecio: UILabel!
    @IBOutlet weak var imgEllipsis: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
