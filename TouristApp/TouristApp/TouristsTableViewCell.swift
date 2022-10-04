//
//  TouristsTableViewCell.swift
//  TouristApp
//
//  Created by 郭梦阳 on 2022/10/3.
//

import UIKit

class TouristsTableViewCell: UITableViewCell {

    @IBOutlet weak var imgTourist: UIImageView!
    @IBOutlet weak var lblTourists: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
