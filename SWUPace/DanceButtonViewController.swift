//
//  DanceButtonViewController.swift
//  SWUPace
//
//  Created by yujin son on 2021/02/15.
//  Copyright © 2021 yujin son. All rights reserved.
//

import Foundation
import UIKit

class DanceButtonController:UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func danceButtonClicked(_ sender: Any) {
        // 검색씬으로 전환
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "danceVC") else{ return }
        
        // 화면 전환 애니메이션 설정
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        // 인자값으로 다음 뷰 컨트롤러를 넣고 present 메소드 호출
        self.present(uvc, animated: true)
    }
}

