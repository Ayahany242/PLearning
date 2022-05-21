//
//  LanguageCollectionViewCell.swift
//  Project
//
//  Created by Asma hassan on 5/12/22.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit

class LanguageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var languageImageView: UIImageView!
    
    func setUp(with lang : Language){
        languageImageView.showImage(lang.image)
        titleLabel.text = lang.name
    }
}
