//
//  LanguagesViewController.swift
//  Project
//
//  Created by Asma hassan on 5/12/22.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseCore

class LanguagesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchView: UIView!
    
    var languages = [Language]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        getLanguages()
        setupSearchView()
        
    }
    
    func setupSearchView() {
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        searchView.layer.cornerRadius = 8
    }
    
    func getLanguages() {
        ActivityIndicator.instance.show(self.view)
        Constants.languageRef.observeSingleEvent(of: .value, with: { snapshot in
            // Get user value
            ActivityIndicator.instance.hide()
            do {
                guard let value = snapshot.value else {return}
                guard let data = try? JSONSerialization.data(withJSONObject: value) else {return}
                self.languages = try JSONDecoder().decode([Language].self, from: data)
                self.collectionView.reloadData()
            } catch let error {
                print("Failed to decode JSON \(error)")
            }
        }) { error in
            print(error.localizedDescription)
        }
    }
}
extension LanguagesViewController :UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return languages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LanguageCollectionViewCell", for: indexPath) as! LanguageCollectionViewCell
        let language = languages[indexPath.row]
        cell.setUp(with: language)
        return  cell
    }
}

extension LanguagesViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2 - 20
        return CGSize(width: width, height: width * 1.4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension LanguagesViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "VideosViewController") as? VideosViewController else {return}
        viewController.language = languages[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
            
    }
    
}
