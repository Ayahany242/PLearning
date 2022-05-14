//
//  HomeViewController.swift
//  Project
//
//  Created by Asma hassan on 2/7/22.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    struct Logo {
        let title : String
        let imageName :String
        
        
    }
    let data :[Logo] = [
        Logo(title: "C", imageName: "C"),
        Logo(title: "C++", imageName: "C++"),
        Logo(title: "C#", imageName: "C#"),
        Logo(title: "Java", imageName: "Java"),
        Logo(title: "JavaScript", imageName: "JavaScript"),
        Logo(title: "Flutter", imageName: "Flutter"),
        Logo(title: "Assembly Language", imageName: "Asm"),
        Logo(title: "Swift", imageName: "Swift"),
        Logo(title: "Objective-C", imageName: "ObjectiveC"),
        Logo(title: "Python", imageName: "Python"),
        Logo(title: "SQL", imageName: "Sql")
    
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let logo = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.label.text = logo.title
        cell.iconImageView.image = UIImage(named: logo.imageName)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}   
