//
//  ActivityIndicator.swift
//  Project
//
//  Created by Afnan MacBook Pro on 21/05/2022.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit
import SnapKit

class ActivityIndicator {
    
    
    static let instance = ActivityIndicator()
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func show(_ view: UIView) {
        ActivityIndicator.instance.container.frame = view.frame
        ActivityIndicator.instance.container.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        ActivityIndicator.instance.container.translatesAutoresizingMaskIntoConstraints = false
        ActivityIndicator.instance.activityIndicator.color = .systemGray
        view.addSubview(ActivityIndicator.instance.container)
        ActivityIndicator.instance.container.snp.makeConstraints() {
            make in
            make.center.equalTo(view.snp.center)
            make.width.equalTo(view.snp.width)
            make.height.equalTo(view.snp.height)
        }
        
        
        ActivityIndicator.instance.loadingView.frame = CGRect(x:0, y:0, width:80, height:80)
        ActivityIndicator.instance.loadingView.backgroundColor = UIColor.clear
        ActivityIndicator.instance.loadingView.clipsToBounds = true
        ActivityIndicator.instance.loadingView.layer.cornerRadius = 10
        ActivityIndicator.instance.container.addSubview(ActivityIndicator.instance.loadingView)
        ActivityIndicator.instance.loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        ActivityIndicator.instance.loadingView.snp.makeConstraints() {
            make in
            make.center.equalTo(ActivityIndicator.instance.container.snp.center)
            make.width.height.equalTo(80)
        }
        
        ActivityIndicator.instance.activityIndicator.frame = CGRect(x:0.0, y:0.0, width:40.0, height:40.0);
        if #available(iOS 13.0, *) {
            ActivityIndicator.instance.activityIndicator.style = UIActivityIndicatorView.Style.large
        } else {
            ActivityIndicator.instance.activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        }
        ActivityIndicator.instance.activityIndicator.center = CGPoint(x:ActivityIndicator.instance.loadingView.frame.size.width / 2, y:ActivityIndicator.instance.loadingView.frame.size.height / 2);
        
        ActivityIndicator.instance.loadingView.addSubview(activityIndicator)
        ActivityIndicator.instance.activityIndicator.startAnimating()
    }
    
    func showAtRight(_ view: UIView)  {
        activityIndicator.backgroundColor = .systemGray
        activityIndicator.style = .medium
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        activityIndicator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40.0).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.startAnimating()
    }
    
    /*
     *Hide activity indicator
     *remove activity indicator from its super view
     */
    
    func hide() {
        activityIndicator.backgroundColor = .clear
        ActivityIndicator.instance.activityIndicator.stopAnimating()
        ActivityIndicator.instance.container.removeFromSuperview()
    }
}
