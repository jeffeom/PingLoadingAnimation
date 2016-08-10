//
//  LoadingView.swift
//  PingLoaderView
//
//  Created by Jeff Eom on 2016-08-09.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

import UIKit

protocol LoadingViewDelegate: class {
    func animateLabel()
}

class LoadingView: UIView {
    
    let dot1Layer = DotLayer(x:80, y: 160)  //user
    let dot2Layer = DotLayer(x: -50, y: 80) //2
    let dot3Layer = DotLayer(x: 80, y: 0)   //4
    let dot4Layer = DotLayer(x: 125, y: 80) //5
    let dot5Layer = DotLayer(x: -5, y: 0)   //3
    let dot6Layer = DotLayer(x: -5, y: 160) //1
    
    let bigDotLayer = BigDotLayer()
    
    let textLayer = TextLayer()
    
    let path1Layer = PathLayer(firstPoint: CGPointMake(87, 157), secondPoint: CGPointMake(-18, 105))//2
    let path2Layer = PathLayer(firstPoint: CGPointMake(87, 157), secondPoint: CGPointMake(93, 32))  //4
    let path3Layer = PathLayer(firstPoint: CGPointMake(87, 157), secondPoint: CGPointMake(130, 108))//5
    let path4Layer = PathLayer(firstPoint: CGPointMake(87, 157), secondPoint: CGPointMake(20, 30))  //3
    let path5Layer = PathLayer(firstPoint: CGPointMake(87, 157), secondPoint: CGPointMake(25, 170)) //1
    
    
    var parentFrame :CGRect = CGRectZero
    weak var delegate:LoadingViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clearColor()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    func addDot1() {
        layer.addSublayer(dot1Layer)
        dot1Layer.expand()
        
        NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(LoadingView.addDot2), userInfo: nil, repeats: false)
    }
    
    func addDot2() {
        layer.addSublayer(dot2Layer)
        dot2Layer.expand()
        
        NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(LoadingView.addDot3), userInfo: nil, repeats: false)
    }
    
    func addDot3() {
        layer.addSublayer(dot3Layer)
        dot3Layer.expand()
        
        NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(LoadingView.addDot4), userInfo: nil, repeats: false)
    }
    
    func addDot4() {
        layer.addSublayer(dot4Layer)
        dot4Layer.expand()
        
        NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(LoadingView.addDot5), userInfo: nil, repeats: false)
    }
    
    func addDot5() {
        layer.addSublayer(dot5Layer)
        dot5Layer.expand()
        
        NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(LoadingView.addDot6), userInfo: nil, repeats: false)
    }
    
    func addDot6() {
        layer.addSublayer(dot6Layer)
        dot6Layer.expand()
        
        NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(LoadingView.bigDotDrop), userInfo: nil, repeats: false)
    }
    
    func bigDotDrop() {
        layer.addSublayer(bigDotLayer)
        layer.addSublayer(textLayer)
        bigDotLayer.drop()
        NSTimer.scheduledTimerWithTimeInterval(0.8, target: self, selector: #selector(LoadingView.wobbleOval), userInfo: nil, repeats: false)
    }
    
    func wobbleOval() {
        bigDotLayer.wobble()
        NSTimer.scheduledTimerWithTimeInterval(0.8, target: self, selector: #selector(LoadingView.explode), userInfo: nil, repeats: false)
    }
    
    func explode() {
        bigDotLayer.explode()
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(LoadingView.fadeOut), userInfo: nil, repeats: false)
    }
    
    func fadeOut() {
        bigDotLayer.fadeOut()
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(LoadingView.drawLine5), userInfo: nil, repeats: false)
    }
    
    
    func drawLine1() {
        layer.addSublayer(path1Layer)
        path1Layer.drawLine()
        NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(LoadingView.drawLine4), userInfo: nil, repeats: false)
    }
    
    func drawLine2() {
        layer.addSublayer(path2Layer)
        path2Layer.drawLine()
        NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(LoadingView.drawLine3), userInfo: nil, repeats: false)
    }
    
    func drawLine3() {
        layer.addSublayer(path3Layer)
        path3Layer.drawLine()
        NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(LoadingView.makeBlue6), userInfo: nil, repeats: false)
    }
    
    func drawLine4() {
        layer.addSublayer(path4Layer)
        path4Layer.drawLine()
        NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(LoadingView.drawLine2), userInfo: nil, repeats: false)
    }
    
    func drawLine5() {
        layer.addSublayer(path5Layer)
        path5Layer.drawLine()
        NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(LoadingView.drawLine1), userInfo: nil, repeats: false)
    }
    
    func makeBlue6() {
        dot6Layer.blue()
        NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(LoadingView.makeBlue2), userInfo: nil, repeats: false)
    }
    
    func makeBlue2() {
        dot2Layer.blue()
        NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(LoadingView.makeBlue5), userInfo: nil, repeats: false)
    }
    
    func makeBlue5() {
        dot5Layer.blue()
        NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(LoadingView.makeBlue3), userInfo: nil, repeats: false)
    }
    
    func makeBlue3() {
        dot3Layer.blue()
        NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(LoadingView.makeBlue4), userInfo: nil, repeats: false)
    }
    
    func makeBlue4() {
        dot4Layer.blue()
        NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(LoadingView.makeBlueUser), userInfo: nil, repeats: false)
    }
    
    func makeBlueUser() {
        dot1Layer.blue()
        NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: #selector(LoadingView.expandView), userInfo: nil, repeats: false)
    }
    
    func expandView() {
        backgroundColor = UIColor.blueColor()
        
        frame = CGRectMake(frame.origin.x - dot1Layer.lineWidth,
                           frame.origin.y - dot1Layer.lineWidth,
                           frame.size.width + dot1Layer.lineWidth * 2,
                           frame.size.height + dot1Layer.lineWidth * 2)
        
        layer.sublayers = nil
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut,
                                   animations: {self.frame = self.parentFrame},
                                   completion: { finished in self.addLabel()})
    }
    
    func addLabel() {
        delegate?.animateLabel()
    }
}
