//
//  Dot1Layer.swift
//  PingLoaderView
//
//  Created by Jeff Eom on 2016-08-09.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

import UIKit

class DotLayer: CAShapeLayer {
    let animationDuration: CFTimeInterval = 0.1
    
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    
    convenience init(x: CGFloat, y: CGFloat) {
        self.init()
        
        self.x = x
        self.y = y
        
        fillColor = UIColor.blackColor().CGColor
        path = dotPathSmall.CGPath
    }
    
    required override init() {
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dotPathSmall:UIBezierPath{
        return UIBezierPath(ovalInRect: CGRect(x: 50.0, y: 50.0, width: 0.0, height: 0.0))
    }
    
    var dotPathLarge:UIBezierPath{// 80 160
        return UIBezierPath(ovalInRect: CGRect(x: x, y: y, width: 30.0, height: 30.0))
    }
    
    func expand() {
        let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        expandAnimation.fromValue = dotPathSmall.CGPath
        expandAnimation.toValue = dotPathLarge.CGPath
        expandAnimation.duration = animationDuration
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.removedOnCompletion = false
        addAnimation(expandAnimation, forKey: nil)
    }
    
    func blue() {
        let blueFill: CABasicAnimation = CABasicAnimation(keyPath: "fillColor")
        blueFill.fromValue = UIColor.blackColor().CGColor
        blueFill.toValue = UIColor.blueColor().CGColor
        blueFill.duration = animationDuration
        blueFill.fillMode = kCAFillModeForwards
        blueFill.removedOnCompletion = false
        addAnimation(blueFill, forKey: nil)
    }
}
