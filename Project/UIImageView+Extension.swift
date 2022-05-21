//
//  UIImageView+Extension.swift
//  Project
//
//  Created by Afnan MacBook Pro on 21/05/2022.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import Kingfisher

extension UIImageView {
    
    func tinted(with color: UIColor) {
        self.image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
    
    func showImage(_ url: String?, _ contentMode: UIView.ContentMode = .scaleToFill, _ contentForFailureOnly: Bool = false) {
        guard let url = url else {
            self.contentMode = .scaleAspectFit
            self.image = #imageLiteral(resourceName: "Logo")
            return
        }
        var main: URL!
        main = URL(string: url)
        self.kf.indicator?.startAnimatingView()
        self.kf.indicatorType = .activity
        self.kf.setImage(with: main, completionHandler:   { [weak self] result in
            self?.kf.indicator?.stopAnimatingView()
            switch result {
            case .success:
                self?.contentMode = .scaleToFill
                break
            case .failure:
                self?.contentMode = contentForFailureOnly ? contentMode : .scaleAspectFit
                self?.image = #imageLiteral(resourceName: "Logo")
            }
        })
    }
    
}
