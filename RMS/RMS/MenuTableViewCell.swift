//
//  MenuTableViewCell.swift
//  RMS
//
//  Created by Rashdan Natiq on 28/09/2017.
//  Copyright © 2017 Devclan. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var backGroundView: UIView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
