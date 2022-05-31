//
//  CustomLabel.swift
//  Project
//
//  Created by Afnan MacBook Pro on 31/05/2022.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit

@IBDesignable class CustomLabel: UILabel {
    
//    @IBInspectable var shadowColor: UIColor? {
//        get {
//            if let color = layer.shadowColor {
//                return UIColor(cgColor: color)
//            }
//            return nil
//        }
//        set {
//            if let color = newValue {
//                layer.shadowColor = color.cgColor
//            } else {
//                layer.shadowColor = nil
//            }
//        }
//    }
    
    @IBInspectable var isRounded: Bool = false {
        didSet {
            self.layer.cornerRadius = self.bounds.height / 2
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    @IBInspectable var cornerRadius: Float {
        get {
            return Float(layer.cornerRadius)
        }
        set {
            layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowBlur: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue / 2.0
        }
    }
    
    @IBInspectable var shadowSpread: CGFloat = 0 {
        didSet {
            if shadowSpread == 0 {
                layer.shadowPath = nil
            } else {
                let dx = -shadowSpread
                let rect = bounds.insetBy(dx: dx, dy: dx)
                layer.shadowPath = UIBezierPath(rect: rect).cgPath
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.isRounded {
            self.layer.cornerRadius = self.bounds.height / 2
        }
    }
    
    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 7.0
    @IBInspectable var rightInset: CGFloat = 7.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
    
    @IBInspectable var lightFont: CGFloat {
        get {
            return self.font.capHeight
        }
        set {
            self.adjustsFontSizeToFitWidth = true
            self.font = UIFont.appFont(ofSize: newValue)
        }
    }
    
    @IBInspectable var boldFont: CGFloat {
        get {
            return self.font.capHeight
        }
        set {
            self.adjustsFontSizeToFitWidth = true
            self.font = UIFont.appFontBold(ofSize: newValue)
        }
    }
    
    @IBInspectable var regularFont: CGFloat {
        get {
            return self.font.capHeight
        }
        set {
            self.adjustsFontSizeToFitWidth = true
            self.font = UIFont.appFontRegular(ofSize: newValue)
        }
    }
    
    @IBInspectable var textColorDarkMode: UIColor? {
        didSet {
            self.textColor = textColorDarkMode
        }
    }
    
}

@IBDesignable class CustomTextField: UITextField {
    
    @IBInspectable var paddingLeftCustom: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    
    @IBInspectable var paddingRightCustom: CGFloat {
        get {
            return rightView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
    @IBInspectable var cornerRadius: Float {
        get {
            return Float(layer.cornerRadius)
        }
        set {
            layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    @IBInspectable var shadowOffset: CGPoint {
        get {
            return CGPoint(x: layer.shadowOffset.width, y:layer.shadowOffset.height)
        }
        set {
            layer.shadowOffset = CGSize(width: newValue.x, height: newValue.y)
        }
        
    }
    
    @IBInspectable var shadowBlur: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue / 2.0
        }
    }
    
    @IBInspectable var shadowSpread: CGFloat = 0 {
        didSet {
            if shadowSpread == 0 {
                layer.shadowPath = nil
            } else {
                let dx = -shadowSpread
                let rect = bounds.insetBy(dx: dx, dy: dx)
                layer.shadowPath = UIBezierPath(rect: rect).cgPath
            }
        }
    }
    
    @IBInspectable var lightFont: CGFloat {
        get {
            return self.font?.capHeight ?? 13
        }
        set {
            self.adjustsFontSizeToFitWidth = true
            self.font = UIFont.appFont(ofSize: newValue)
        }
    }
    
    @IBInspectable var boldFont: CGFloat {
        get {
            return self.font?.capHeight ?? 13
        }
        set {
            self.adjustsFontSizeToFitWidth = true
            self.font = UIFont.appFontBold(ofSize: newValue)
        }
    }
    
    @IBInspectable var regularFont: CGFloat {
        get {
            return self.font?.capHeight ?? 13
        }
        set {
            self.adjustsFontSizeToFitWidth = true
            self.font = UIFont.appFontRegular(ofSize: newValue)
        }
    }
    
    @IBInspectable var textColorDarkMode: UIColor? {
        didSet {
            self.textColor = textColorDarkMode
        }
    }
}

@IBDesignable class CustomButton: UIButton{
    
    @IBInspectable var isCircle: Bool = false

    @IBInspectable var cornerRadius: Float {
        get {
            return Float(layer.cornerRadius)
        }
        set {
            layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    @IBInspectable var isRounded: Bool = false {
        didSet {
            self.layer.cornerRadius = self.bounds.height / 2
        }
    }
    
    //-----------------------GRADIENT COLOR----------------------------
    // the gradient start colour
    @IBInspectable var startColor: UIColor? {
        didSet {
            updateGradient()
        }
    }
    
    @IBInspectable var centerColor: UIColor? {
        didSet {
            updateGradient()
        }
    }
    
    // the gradient end colour
    @IBInspectable var endColor: UIColor? {
        didSet {
            updateGradient()
        }
    }
    

    // the gradient angle, in degrees anticlockwise from 0 (east/right)
    @IBInspectable var angle: CGFloat = 270 {
        didSet {
            updateGradient()
        }
    }
    
    // the gradient layer
    private var gradient: CAGradientLayer?
    
    // initializers
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        installGradient()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        installGradient()
    }
    
    // Create a gradient and install it on the layer
    private func installGradient() {
        // if there's already a gradient installed on the layer, remove it
        if let gradient = self.gradient {
            gradient.removeFromSuperlayer()
        }
        let gradient = createGradient()
        self.layer.addSublayer(gradient)
        self.gradient = gradient
    }
    
    // Update an existing gradient
    private func updateGradient() {
        if let gradient = self.gradient {
            let startColor = self.startColor ?? UIColor.clear
            let centerColor = self.centerColor ?? UIColor.clear
            let endColor = self.endColor ?? UIColor.clear
            gradient.colors = [startColor.cgColor, centerColor.cgColor, endColor.cgColor]
            let (start, center ,end) = gradientPointsForAngle(self.angle)
            gradient.startPoint = start
            gradient.startPoint = center
            gradient.endPoint = end
        }
    }
    
    // create gradient layer
    private func createGradient() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        return gradient
    }
    
    // create vector pointing in direction of angle
    private func gradientPointsForAngle(_ angle: CGFloat) -> (CGPoint, CGPoint, CGPoint) {
        // get vector start and end points
        let end = pointForAngle(angle)
        //let start = pointForAngle(angle+180.0)
        let center = oppositePoint(end)
        let start = oppositePoint(end)
        // convert to gradient space
        let p0 = transformToGradientSpace(start)
        let p1 = transformToGradientSpace(end)
        let p2 = transformToGradientSpace(center)

        return (p0, p1, p2)
    }
    
    // get a point corresponding to the angle
    private func pointForAngle(_ angle: CGFloat) -> CGPoint {
        // convert degrees to radians
        let radians = angle * .pi / 180.0
        var x = cos(radians)
        var y = sin(radians)
        // (x,y) is in terms unit circle. Extrapolate to unit square to get full vector length
        if (abs(x) > abs(y)) {
            // extrapolate x to unit length
            x = x > 0 ? 1 : -1
            y = x * tan(radians)
        } else {
            // extrapolate y to unit length
            y = y > 0 ? 1 : -1
            x = y / tan(radians)
        }
        return CGPoint(x: x, y: y)
    }
    
    // transform point in unit space to gradient space
    private func transformToGradientSpace(_ point: CGPoint) -> CGPoint {
        // input point is in signed unit space: (-1,-1) to (1,1)
        // convert to gradient space: (0,0) to (1,1), with flipped Y axis
        return CGPoint(x: (point.x + 1) * 0.5, y: 1.0 - (point.y + 1) * 0.5)
    }
    
    // return the opposite point in the signed unit square
    private func oppositePoint(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: -point.x, y: -point.y)
    }
    
    // ensure the gradient gets initialized when the view is created in IB
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        installGradient()
        updateGradient()
    }
    //-------------------------------------------
    
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if self.isRounded {
            self.layer.cornerRadius = self.bounds.height / 2
        }
        if startColor != nil {
            installGradient()
            updateGradient()
        }
        self.contentEdgeInsets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
    }
    
    @IBInspectable var lightFont: CGFloat {
        get {
            return self.titleLabel?.font.capHeight ?? 13
        }
        set {
            self.titleLabel?.adjustsFontSizeToFitWidth = true
            self.titleLabel?.font = UIFont.appFont(ofSize: newValue)
        }
    }
    
    @IBInspectable var boldFont: CGFloat {
        get {
            return self.titleLabel?.font.capHeight ?? 13
        }
        set {
            self.titleLabel?.adjustsFontSizeToFitWidth = true
            self.titleLabel?.font = UIFont.appFontBold(ofSize: newValue)
        }
    }
    
    @IBInspectable var regularFont: CGFloat {
        get {
            return self.titleLabel?.font.capHeight ?? 13
        }
        set {
            self.titleLabel?.adjustsFontSizeToFitWidth = true
            self.titleLabel?.font = UIFont.appFontRegular(ofSize: newValue)
        }
    }
    
    @IBInspectable var topInset: CGFloat = 0.0
    @IBInspectable var bottomInset: CGFloat = 0.0
    @IBInspectable var leftInset: CGFloat = 7.0
    @IBInspectable var rightInset: CGFloat = 7.0

    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            if isCircle {
                layer.shadowRadius = self.bounds.width / 2
            } else {
                layer.shadowRadius = newValue
            }
        }
    }
    
    
    @IBInspectable
    var shadowPath: CGPath? {
        get {
            return layer.shadowPath
        }
        set {
            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var customShadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
}
