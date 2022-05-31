//
//  UIFont+Extension.swift
//  Project
//
//  Created by Afnan MacBook Pro on 31/05/2022.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit

extension UIFont {
    class func appFont(ofSize size: CGFloat) -> UIFont {
        let fontName = "Cairo-Light"
        if UIDevice.current.userInterfaceIdiom == .pad {
            return UIFont(name: fontName, size: size * 1.8)!
        } else if UIScreen.main.bounds.height > 667 {
            return UIFont(name: fontName, size: size * 1.3)!
        }
        return UIFont(name: fontName, size: size)!
    }
    
    class func appFontBold(ofSize size: CGFloat) -> UIFont {
        let fontName = "Cairo-Bold"
        if UIDevice.current.userInterfaceIdiom == .pad {
            return UIFont(name: fontName, size: size * 1.8)!
        } else if UIScreen.main.bounds.height > 667 {
            return UIFont(name: fontName, size: size * 1.3)!
        }
        return UIFont(name: fontName, size: size)!
    }
    
    class func appFontRegular(ofSize size: CGFloat) -> UIFont {
        let fontName = "Cairo-Regular"
        if UIDevice.current.userInterfaceIdiom == .pad {
            return UIFont(name: fontName, size: size * 1.8)!
        } else if UIScreen.main.bounds.height > 667 {
            return UIFont(name: fontName, size: size * 1.3)!
        }
        return UIFont(name: fontName, size: size)!
    }
}
