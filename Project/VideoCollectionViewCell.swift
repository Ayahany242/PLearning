//
//  VideoCollectionViewCell.swift
//  Project
//
//  Created by Afnan MacBook Pro on 22/05/2022.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit
import YouTubePlayer

class VideoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var vedioName: UILabel!
    @IBOutlet weak var playerView: YouTubePlayerView!
    
    func setUp(with video : Video) {
        vedioName.text = video.name
        guard let link = video.link, let url = URL(string: link) else { return }
        playerView.loadVideoURL(url)
        playerView.play()
//        playerView.delegate = self
    }
}
