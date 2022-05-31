//
//  CustomView.swift
//  Project
//
//  Created by Afnan MacBook Pro on 31/05/2022.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit

@IBDesignable class CustomView: UIView {
    
    @IBInspectable var isCircle: Bool = false
    @IBInspectable var isRounded: Bool = false
    @IBInspectable var isBottomCustomCorner: Bool = false
    @IBInspectable var isTopCustomCorner: Bool = false

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
//    @IBInspectable var topLeftCorner: Bool = false
//    @IBInspectable var topRightCorner: Bool = false
//    @IBInspectable var bottomLeftCorner: Bool = false
//    @IBInspectable var bottomRightCorner: Bool = false
//
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // ------- add dashed border
        if hasDashBorder {
            dashBorder?.removeFromSuperlayer()
            let dashBorder = CAShapeLayer()
            dashBorder.lineWidth = dashWidth
            dashBorder.strokeColor = dashColor.cgColor
            dashBorder.lineDashPattern = [dashLength, betweenDashesSpace] as [NSNumber]
            dashBorder.frame = bounds
            dashBorder.fillColor = nil
            if cornerRadius > 0 {
                dashBorder.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadiusDashed).cgPath
            } else {
                dashBorder.path = UIBezierPath(rect: bounds).cgPath
            }
            layer.addSublayer(dashBorder)
            self.dashBorder = dashBorder
        }
        ///////////////////////////////////////////
        
        if self.isCircle {
            self.layer.cornerRadius = self.bounds.width / 2
        }
        if self.isRounded {
            self.layer.cornerRadius = self.bounds.height / 2
        }
        if self.isBottomCustomCorner {
            self.layer.cornerRadius = cornerRadius
            self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        if self.isTopCustomCorner {
            self.layer.cornerRadius = cornerRadius
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        if startColor != nil {
            installGradient()
            updateGradient()
        }
        layer.shadowRadius = self.shadowRadius
    }

    //
    //    //-----------------------GRADIENT COLOR----------------------------
    
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
    @IBInspectable var angle: CGFloat = 270
    //
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
    
    @IBInspectable var hasDashBorder: Bool = false
    @IBInspectable var dashWidth: CGFloat = 0
    @IBInspectable var dashColor: UIColor = .clear
    @IBInspectable var dashLength: CGFloat = 0
    @IBInspectable var betweenDashesSpace: CGFloat = 0
    var dashBorder: CAShapeLayer?
    @IBInspectable var cornerRadiusDashed: CGFloat = 0 {
          didSet {
              layer.cornerRadius = cornerRadiusDashed
              layer.masksToBounds = cornerRadius > 0
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
