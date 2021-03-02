//
//  MyPageTabController.swift
//  SWUPace
//
//  Created by yujin son on 2021/02/15.
//  Copyright © 2021 yujin son. All rights reserved.
//

import Foundation
import UIKit

class MyPageTabController: UIViewController{
    
    @IBOutlet weak var box1: UIImageView!
    @IBOutlet weak var box2: UIImageView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    let selectedColor = #colorLiteral(red: 0.1836222708, green: 0.361164093, blue: 0.5480998158, alpha: 1)
    let unselectedColor = #colorLiteral(red: 0.6301719546, green: 0.7032473683, blue: 0.7629404068, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lineView1 = UIView(frame: CGRect(x: 0, y: 483, width: self.view.frame.size.width, height: 1))
        let lineView2 = UIView(frame: CGRect(x: 0, y: 543, width: self.view.frame.size.width, height: 1))
        lineView1.backgroundColor = #colorLiteral(red: 0.8510087132, green: 0.8508757949, blue: 0.8594985604, alpha: 1)
        lineView2.backgroundColor = #colorLiteral(red: 0.8510087132, green: 0.8508757949, blue: 0.8594985604, alpha: 1)
        self.view.addSubview(lineView1)
        self.view.addSubview(lineView2)
        
        button1.tintColor = selectedColor
        button2.tintColor = unselectedColor
    }
    
    @IBAction func button1Clicked(_ sender: Any) {
        box1.image=UIImage(named: "box1.jpeg")
        box2.image=UIImage(named: "box2.jpeg")
        button1.tintColor = selectedColor
        button2.tintColor = unselectedColor
    }
    
    @IBAction func button2Clicked(_ sender: Any){
        box1.image=UIImage(named: "box1_.jpeg")
        box2.image=UIImage(named: "box2_.jpeg")
        button1.tintColor = unselectedColor
        button2.tintColor = selectedColor
    }
    
}

