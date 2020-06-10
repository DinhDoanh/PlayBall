//
//  DrawOViewController.swift
//  Ball
//
//  Created by Quynh on 2/13/20.
//  Copyright © 2020 Taof. All rights reserved.
//

import UIKit

enum Direction {
    case right
    case left
}

class DrawZViewController: UIViewController {
    
    deinit {
        print("Deinit DrawZViewController")
    }
    
    let ballImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bong")
        return imageView
    }()
    
    var radius: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        ballImageView.frame = CGRect(x: 0, y: 100, width: radius, height: radius)
        ballImageView.contentMode = .scaleAspectFit
        view.addSubview(ballImageView)
        zigzag(direction: .right)
    }
    
    func zigzag(direction: Direction) {
        if self.ballImageView.frame.origin.y > self.view.frame.maxY - 100 {
            return
        }
        switch direction {
        case .right:
            // kiểm tra: nếu toạ độ y của quả bóng lớn hơn chiều cao của view (thiết bị) thì gọi đến transform identity, CGAffineTransform.indentity sẽ xoá mọi ràng buộc thay đổi của quả bóng và đặt về mặc định
            if self.ballImageView.frame.origin.y > self.view.frame.size.height  {
                self.ballImageView.transform = CGAffineTransform.identity
            }
            
            // dịch chuyển từ điểm bắt đầu sang phải,
            UIView.animate(withDuration: 2, animations: {
                self.ballImageView.transform = CGAffineTransform(translationX: self.view.frame.size.width - self.ballImageView.frame.width, y: self.ballImageView.frame.origin.y)
            }) { (_) in
                self.zigzag(direction: .left)
            }
            break
        case .left:
            // dịch chuyển từ phải sang trái
            UIView.animate(withDuration: 2, animations: {
                self.ballImageView.transform = CGAffineTransform(translationX: 0, y: self.ballImageView.frame.origin.y)
            }) { (_) in
                self.zigzag(direction: .right)
            }
            break
        }
    }
    
}
