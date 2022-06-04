//
//  LanchScreenViewController.swift
//  Project
//
//  Created by Aya on 6/3/22.
//  Copyright © 2022 Asma hassan. All rights reserved.
//
import UIKit

class LanchScreenViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let logoGif = UIImage.gifImageWithName("logoGif")
        imageView.image = logoGif
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3){
            
            self.performSegue(withIdentifier: "StartViewController", sender: nil)
        }
    }
}
