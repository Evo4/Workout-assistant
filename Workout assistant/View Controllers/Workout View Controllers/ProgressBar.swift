//
//  ProgressBar.swift
//  Workout assistant
//
//  Created by Vyacheslav on 20.11.2019.
//  Copyright © 2019 jonyvee. All rights reserved.
//

import UIKit


class ProgressBar: UIView, CAAnimationDelegate {
    
    fileprivate var animation = CABasicAnimation()
    fileprivate var animationDidStart = false
    fileprivate var timerDuration = 0
    
    lazy var fgProgressLayer: CAShapeLayer = {
        let fgProgressLayer = CAShapeLayer()
        return fgProgressLayer
    }()
    
    lazy var bgProgressLayer: CAShapeLayer = {
        let bgProgressLayer = CAShapeLayer()
        return bgProgressLayer
    }()
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadBgProgressBar()
        loadFgProgressBar()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadBgProgressBar()
        loadFgProgressBar()
    }
    
    
    fileprivate func loadFgProgressBar() {
        
        let startAngle = CGFloat(-Double.pi / 2)
        let endAngle = CGFloat(3 * Double.pi / 2)
        let centerPoint = CGPoint(x: frame.width/2 , y: frame.height/2)
        let gradientMaskLayer = gradientMask()
        fgProgressLayer.path = UIBezierPath(arcCenter:centerPoint, radius: frame.width/2 - 30.0, startAngle:startAngle, endAngle:endAngle, clockwise: true).cgPath
        fgProgressLayer.backgroundColor = UIColor.clear.cgColor
        fgProgressLayer.fillColor = nil
        fgProgressLayer.strokeColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) 
        fgProgressLayer.lineWidth = 15.0
        fgProgressLayer.strokeStart = 0.0
        fgProgressLayer.strokeEnd = 0.0
        fgProgressLayer.lineCap = .round
        
        gradientMaskLayer.mask = fgProgressLayer
        layer.addSublayer(gradientMaskLayer)
    }
    
    
    
    fileprivate func gradientMask() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.locations = [0.0, 1.0]
        let colorTop: AnyObject = #colorLiteral(red: 0.3725490196, green: 0.6748930933, blue: 0.368627451, alpha: 1).cgColor
        let colorBottom: AnyObject = #colorLiteral(red: 0.3725490196, green: 0.8078431373, blue: 0.368627451, alpha: 1).cgColor
        let arrayOfColors: [AnyObject] = [colorTop, colorBottom]
        gradientLayer.colors = arrayOfColors
        
        return gradientLayer
    }
    
    
    fileprivate func loadBgProgressBar() {
        
        let startAngle = CGFloat(-Double.pi / 2)
        let endAngle = CGFloat(3 * Double.pi / 2)
        let centerPoint = CGPoint(x: frame.width/2 , y: frame.height/2)
        let gradientMaskLayer = gradientMaskBg()
        bgProgressLayer.path = UIBezierPath(arcCenter:centerPoint, radius: frame.width/2 - 30.0, startAngle:startAngle, endAngle:endAngle, clockwise: true).cgPath
        bgProgressLayer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        bgProgressLayer.fillColor = nil
        bgProgressLayer.strokeColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        bgProgressLayer.lineWidth = 4.0
        bgProgressLayer.strokeStart = 0.0
        bgProgressLayer.strokeEnd = 1.0
        
        gradientMaskLayer.mask = bgProgressLayer
        layer.addSublayer(gradientMaskLayer)
    }
    
    
    fileprivate func gradientMaskBg() -> CAGradientLayer {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.locations = [0.0, 1.0]
        let colorTop: AnyObject = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).cgColor
        let colorBottom = colorTop
        let arrayOfColors: [AnyObject] = [colorTop, colorBottom]
        gradientLayer.colors = arrayOfColors
        
        return gradientLayer
    }
    
    
    public func setProgressBar(hours:Int, minutes:Int, seconds:Int) {
        let hoursToSeconds = hours * 3600
        let minutesToSeconds = minutes * 60
        let totalSeconds = seconds + minutesToSeconds + hoursToSeconds
        timerDuration = totalSeconds
    }
    
    public func start() {
        if !animationDidStart {
            startAnimation()
        }else{
            resumeAnimation()
        }
    }
    
    public func pause() {
        pauseAnimation()
    }
    
    public func stop() {
        stopAnimation()
    }
    
    
    fileprivate func startAnimation() {
        
        resetAnimation()
        
        fgProgressLayer.strokeEnd = 0.0
        animation.keyPath = "strokeEnd"
        animation.fromValue = CGFloat(0.0)
        animation.toValue = CGFloat(1.0)
        animation.duration = CFTimeInterval(timerDuration)
        animation.delegate = self
        animation.isRemovedOnCompletion = false
        animation.isAdditive = true
        animation.fillMode = CAMediaTimingFillMode.forwards
        fgProgressLayer.add(animation, forKey: "strokeEnd")
        animationDidStart = true
        
    }
    
    
    fileprivate func resetAnimation() {
        fgProgressLayer.speed = 1.0
        fgProgressLayer.timeOffset = 0.0
        fgProgressLayer.beginTime = 0.0
        fgProgressLayer.strokeEnd = 0.0
        animationDidStart = false
    }
    
    
    fileprivate func stopAnimation() {
        fgProgressLayer.speed = 1.0
        fgProgressLayer.timeOffset = 0.0
        fgProgressLayer.beginTime = 0.0
        fgProgressLayer.strokeEnd = 0.0
        fgProgressLayer.removeAllAnimations()
        animationDidStart = false
    }
    
    
    fileprivate func pauseAnimation(){
        let pausedTime = fgProgressLayer.convertTime(CACurrentMediaTime(), from: nil)
        fgProgressLayer.speed = 0.0
        fgProgressLayer.timeOffset = pausedTime
        
    }
    
    
    fileprivate func resumeAnimation(){
        let pausedTime = fgProgressLayer.timeOffset
        fgProgressLayer.speed = 1.0
        fgProgressLayer.timeOffset = 0.0
        fgProgressLayer.beginTime = 0.0
        let timeSincePause = fgProgressLayer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        fgProgressLayer.beginTime = timeSincePause
    }
    
    internal func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        stopAnimation()
    }
    
    
}




