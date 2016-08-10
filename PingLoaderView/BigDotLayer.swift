//
//  BigDotLayer.swift
//  PingLoaderView
//
//  Created by Jeff Eom on 2016-08-09.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

import UIKit

class BigDotLayer: CAShapeLayer {
    let animationDuration: CFTimeInterval = 0.3
    
    override init() {
        super.init()
        
        fillColor = UIColor.redColor().CGColor
        path = dotPathSmall.CGPath
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dotPathSmall:UIBezierPath{
        return UIBezierPath(ovalInRect: CGRect(x: 50.0, y: -300.0, width: 30.0, height: 30.0))
    }
    
    var dotPathLarge:UIBezierPath{
        return UIBezierPath(ovalInRect: CGRect(x: 5, y: 45, width: 100.0, height: 100.0))
        
    }
    
    var dotPathSquishVertical: UIBezierPath {
        return UIBezierPath(ovalInRect: CGRect(x: 5, y: 47, width: 100.0, height: 95.0))
    }
    
    var dotPathSquishHorizontal: UIBezierPath {
        return UIBezierPath(ovalInRect: CGRect(x: 8, y: 47, width: 95.0, height: 95.0))
    }
    
    var dotPathExplode: UIBezierPath{
        return UIBezierPath(ovalInRect: CGRect(x: -430, y: -400, width: 1000, height: 1000))
    }
    
    var dotPathGone: UIBezierPath{
        return UIBezierPath(ovalInRect: CGRect(x: 50, y: 100, width: 0, height: 0))
    }
    
    
    func drop() {
        let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        expandAnimation.fromValue = dotPathSmall.CGPath
        expandAnimation.toValue = dotPathLarge.CGPath
        expandAnimation.duration = 0.8
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.removedOnCompletion = false
        addAnimation(expandAnimation, forKey: nil)
    }
    
    func wobble() {
        
        // 1
        let wobbleAnimation1: CABasicAnimation = CABasicAnimation(keyPath: "path")
        wobbleAnimation1.fromValue = dotPathLarge.CGPath
        wobbleAnimation1.toValue = dotPathSquishVertical.CGPath
        wobbleAnimation1.beginTime = 0.0
        wobbleAnimation1.duration = animationDuration
        
        // 2
        let wobbleAnimation2: CABasicAnimation = CABasicAnimation(keyPath: "path")
        wobbleAnimation2.fromValue = dotPathSquishVertical.CGPath
        wobbleAnimation2.toValue = dotPathSquishHorizontal.CGPath
        wobbleAnimation2.beginTime = wobbleAnimation1.beginTime + wobbleAnimation1.duration
        wobbleAnimation2.duration = animationDuration
        
        // 3
        let wobbleAnimation3: CABasicAnimation = CABasicAnimation(keyPath: "path")
        wobbleAnimation3.fromValue = dotPathSquishHorizontal.CGPath
        wobbleAnimation3.toValue = dotPathSquishVertical.CGPath
        wobbleAnimation3.beginTime = wobbleAnimation2.beginTime + wobbleAnimation2.duration
        wobbleAnimation3.duration = animationDuration
        
        // 4
        let wobbleAnimation4: CABasicAnimation = CABasicAnimation(keyPath: "path")
        wobbleAnimation4.fromValue = dotPathSquishVertical.CGPath
        wobbleAnimation4.toValue = dotPathLarge.CGPath
        wobbleAnimation4.beginTime = wobbleAnimation3.beginTime + wobbleAnimation3.duration
        wobbleAnimation4.duration = animationDuration
        
        // 5
        let wobbleAnimationGroup: CAAnimationGroup = CAAnimationGroup()
        wobbleAnimationGroup.animations = [wobbleAnimation1, wobbleAnimation2, wobbleAnimation3,
                                           wobbleAnimation4]
        wobbleAnimationGroup.duration = wobbleAnimation4.beginTime + wobbleAnimation4.duration
        wobbleAnimationGroup.repeatCount = 2
        addAnimation(wobbleAnimationGroup, forKey: nil)
        
    }
    
    func explode() {
        let explodeAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        explodeAnimation.fromValue = dotPathLarge.CGPath
        explodeAnimation.toValue = dotPathExplode.CGPath
        explodeAnimation.duration = 0.5
        explodeAnimation.fillMode = kCAFillModeForwards
        explodeAnimation.removedOnCompletion = true
        addAnimation(explodeAnimation, forKey: nil)
    }
    
    func fadeOut() {
        let fadeOutAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        fadeOutAnimation.fromValue = dotPathExplode.CGPath
        fadeOutAnimation.toValue = dotPathGone.CGPath
        fadeOutAnimation.duration = animationDuration
        fadeOutAnimation.fillMode = kCAFillModeForwards
        fadeOutAnimation.removedOnCompletion = false
        addAnimation(fadeOutAnimation, forKey: nil)
    }
}
