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
//    var languages = [Language]()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Create a pager view
//        let pagerView = FSPagerView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
//        // pagerView.dataSource = self
//        //pagerView.delegate = self
//        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
//        self.view.addSubview(pagerView)
//        // Create a page control
//        let pageControl = FSPageControl(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
//        self.view.addSubview(pageControl)
//        
//    }
//    deinit {
//        self.pagerView.dataSource = nil
//        self.pagerView.delegate = nil
//    }
//    func getExamples() {
//        ActivityIndicator.instance.show(self.view)
//        Constants.languageRef.observeSingleEvent(of: .value, with: { snapshot in
//            // Get user value
//            ActivityIndicator.instance.hide()
//            do {
//                guard let value = snapshot.value else {return}
//                guard let data = try? JSONSerialization.data(withJSONObject: value) else {return}
//                self.languages = try JSONDecoder().decode([Language].self, from: data)
//                self.pagerView.reloadData()
//            } catch let error {
//                print("Failed to decode JSON \(error)")
//            }
//        }) { error in
//            print(error.localizedDescription)
//        }
//    }
//    public func numberOfItems(in pagerView: FSPagerView) -> Int {
//        return languages.count
//    }
//    
//    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
//        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
//        let example = languages[index]
//        cell.setUp(with: example)
//        return cell
//    }
//    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int){
//        let function = FSPagerViewDelegate.self
//        let index = cell
//        function(self,cell as! FSPagerViewCell,index)
//    }
//    func setupPagerView(){
//        pagerView.transformer = FSPagerViewTransformer(type: .zoomOut)
//        pageControl.numberOfPages = 5
//        
//        
//        
//    }
//    
//}
