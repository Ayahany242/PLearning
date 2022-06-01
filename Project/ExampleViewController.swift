////
////  ExampleViewController.swift
////  Project
////
////  Created by Asma hassan on 5/8/22.
////  Copyright © 2022 Asma hassan. All rights reserved.
////
//
//import UIKit
//import FSPagerView
//
//class ExampleViewController: UIViewController,FSPagerViewDataSource,FSPagerViewDelegate {
//    @IBOutlet weak var pagerView: FSPagerView! {
//        didSet {
//            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
//        }
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let pagerView = FSPagerView(frame: frame1)
//        pagerView.dataSource = self
//        pagerView.delegate = self
//        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
//        self.view.addSubview(pagerView)
//        // Create a page control
//        let pageControl = FSPageControl(frame: frame2)
//        self.view.addSubview(pageControl)
//    }
//
//    public func numberOfItems(in pagerView: FSPagerView) -> Int {
//        return 4
//    }
//
//    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
//        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
//        cell.imageView?.image = ...
//        cell.textLabel?.text = ...
//        return cell
//    }
//    func pagerView(_ pagerView: FSPagerView, shouldHighlightItemAt index: Int) -> Bool{}
//    func pagerView(_ pagerView: FSPagerView, didHighlightItemAt index: Int)
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return data.count
////    }
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let logo = data[indexPath.row]
////        let cell = tableView.dequeueReusableCell(withIdentifier: "ExampleTableViewCell", for: indexPath) as! ExampleTableViewCell
////        cell.label.text = logo.title
////        cell.ImageView.image = UIImage(named: logo.imageName)
////        return cell
////    }
////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        return 100
////    }
//
//}
