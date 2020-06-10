//
//  DroppingBall.swift
//  Ball
//
//  Created by Taof on 6/1/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class DroppingBall: UIViewController {
    
    deinit {
        print("Deinit DroppingBall")
    }
    
    var ball: CircleLayerView!
    var timer: Timer!
    
    let ball_y_origin: CGFloat = 100.0
    // gia tốc
    let a: CGFloat = 1.0
    // v vận tốc ban đầu
    var v: CGFloat = 0.0
    var y: CGFloat!
    let radius:CGFloat = 20.0
    var height: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        y = ball_y_origin
        height = view.bounds.height
        print("height: ", height)
        ball = CircleLayerView(center: CGPoint(x: view.bounds.midX, y: y),
                               radius: radius,
                               fillColor:  UIColor.red)
        view.addSubview(ball)
        
        timer = Timer.scheduledTimer(timeInterval: 0.03, target: self, selector: #selector(timerLoop), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func timerLoop() {
        v = v + a
        y = y + v
        if y > height - 12 - radius{
            y = height - 12 - radius
            v = -v * 0.8
            print("-v * 0.8: \(v)")
            if v >= -0.5 {
                timer.invalidate()
            }
        }
        ball.center = CGPoint(x: ball.center.x, y: y)
    }
}
