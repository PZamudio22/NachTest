//
//  PostsTableViewCell.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 08/01/22.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var imgBig: UIImageView!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var imgHeart: UIImageView!
    @IBOutlet weak var imgMesagge: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgEllipsis: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
