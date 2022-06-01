//
//  ExampleViewController.swift
//  Project
//
//  Created by Asma hassan on 5/8/22.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit
import FSPagerView

class ExampleViewController: UIViewController {

    @IBOutlet weak var pagerView: FSPagerView!
    @IBOutlet weak var pageControl: FSPageControl!
  
    var language: Language?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPagerView()
    }
    
    func setupPagerView() {
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        pageControl.setPath(UIBezierPath(roundedRect: CGRect(x: -12, y: 0, width: 8, height: 8), cornerRadius: 10.0), for: .normal)
        pageControl.setPath(UIBezierPath(roundedRect: CGRect(x: -12, y: 0, width: 8, height: 8), cornerRadius: 10.0), for: .selected)
        pageControl.itemSpacing = 8
        pageControl.setFillColor(.gray, for: .normal)
        pageControl.setFillColor(#colorLiteral(red: 0.7490000129, green: 0.3529999852, blue: 0.949000001, alpha: 1), for: .selected)
        pageControl.numberOfPages = 3
    }
}

extension ExampleViewController: FSPagerViewDataSource,FSPagerViewDelegate {
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return language?.examples?.count ?? 0
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        return cell
    }
    
    //FSPagerView Delegate
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        guard self.pageControl.currentPage != pagerView.currentIndex else {
            return
        }
        self.pageControl.currentPage = pagerView.currentIndex
    }
    
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
        cell.imageView?.layer.cornerRadius = 15
        cell.imageView?.clipsToBounds = true
        cell.imageView?.showImage(language?.examples?[index])
    }
}
