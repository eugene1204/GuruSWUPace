//
//  HostViewController.swift
//  SWUPace
//
//  Created by yujin son on 2021/02/15.
//  Copyright © 2021 yujin son. All rights reserved.
//


import Foundation
import UIKit

class HostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lineView1 = UIView(frame: CGRect(x: 0, y: 270, width: self.view.frame.size.width, height: 1))
        let lineView2 = UIView(frame: CGRect(x: 0, y: 310, width: self.view.frame.size.width, height: 1))
        lineView1.backgroundColor = #colorLiteral(red: 0.8510087132, green: 0.8508757949, blue: 0.8594985604, alpha: 1)
        lineView2.backgroundColor = #colorLiteral(red: 0.8510087132, green: 0.8508757949, blue: 0.8594985604, alpha: 1)
        self.view.addSubview(lineView1)
        self.view.addSubview(lineView2)
    }
}

