//
//  YoutubeViewController.swift
//  Project
//
//  Created by Asma hassan on 2/25/22.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class YoutubeViewController: UIViewController, YTPlayerViewDelegate {

    
     @IBOutlet var playerView: YTPlayerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.delegate = self
        playerView.load(withVideoId: "yWMXU7uBdf0", playerVars: ["playsinline" : 1])

        // Do any additional setup after loading the view.
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
