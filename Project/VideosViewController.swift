//
//  VideosViewController.swift
//  Project
//
//  Created by Asma hassan on 3/11/22.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseCore

class VideosViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var seeMoreButton: UIButton!
    
    var language: Language?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationItem.title = language?.name
        descriptionLabel.text = language?.desc
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    @IBAction func seeMore(_ sender: UIButton) {
        if descriptionLabel.numberOfLines == 2 && descriptionLabel.isTruncated {
            descriptionLabel.numberOfLines = 0
            seeMoreButton.setTitle("See Less", for: .normal)
        } else {
            descriptionLabel.numberOfLines = 2
            seeMoreButton.setTitle("See More", for: .normal)
        }
        descriptionLabel.layoutIfNeeded()
    }
}
extension VideosViewController :UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return language?.videos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCollectionViewCell", for: indexPath) as! VideoCollectionViewCell
        guard let video = language?.videos?[indexPath.row] else {return cell}
        cell.setUp(with: video)
        return  cell
    }
}

extension VideosViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // kan fe width /2
        let width = collectionView.bounds.width
        return CGSize(width: width, height: width * 1.4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension VideosViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        print(data[indexPath.row].title)
        
    }
    
}
