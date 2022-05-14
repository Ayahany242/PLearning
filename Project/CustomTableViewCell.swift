//
//  CustomTableViewCell.swift
//  Project
//
//  Created by Asma hassan on 2/23/22.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var iconImageView :UIImageView!
    @IBOutlet weak var label :UILabel!
    override func layoutSubviews() {
        iconImageView.layer.cornerRadius = iconImageView.bounds.height / 2
        iconImageView.clipsToBounds = true
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
