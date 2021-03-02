//
//  AppTabbarController.swift
//  SWUPace
//
//  Created by yujin son on 2021/02/15.
//  Copyright © 2021 yujin son. All rights reserved.
//

import UIKit

class AppTabbarController: UITabBarController {
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
