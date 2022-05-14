//
//  ExampleTableViewCell.swift
//  Project
//
//  Created by Asma hassan on 5/8/22.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit

class ExampleTableViewCell: UITableViewCell {
    @IBOutlet weak var ImageView :UIImageView!
    @IBOutlet weak var label :UILabel!
    override func layoutSubviews() {
        ImageView.layer.cornerRadius = ImageView.bounds.height / 2
        ImageView.clipsToBounds = true
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
