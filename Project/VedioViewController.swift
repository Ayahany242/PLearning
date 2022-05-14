//
//  VedioViewController.swift
//  Project
//
//  Created by Asma hassan on 4/21/22.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit

class VedioViewController: UIViewController,UITableViewDataSource , UITableViewDelegate {

    
    private let tableView : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x:0 ,y:0 , width: view.frame.size.width , height:100))
        header.backgroundColor = .secondarySystemBackground
        let imageView = UIImageView(image: UIImage(systemName: "arrowtriangle.right.square"))
        imageView.tintColor = .systemRed
        imageView.contentMode = .scaleAspectFit
        header.addSubview(imageView)
        imageView.frame = CGRect(x: 5, y: 5, width: header.frame.size.height-15 ,height: header.frame.size.height-15)
        let label = UILabel(frame: CGRect(x: 5 + imageView.frame.size.width, y: 5, width: header.frame.size.width - 20 - imageView.frame.size.width,
            height: header.frame.size.height-15))
        header.addSubview(label)
        label.text = "Heelo"
        label.font = .systemFont(ofSize: 22 , weight : .thin)
        
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "HelloWorld"
        return cell
    }

}
