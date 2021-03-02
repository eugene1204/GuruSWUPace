//
//  DetailDanceViewController.swift
//  SWUPace
//
//  Created by yujin son on 2021/03/03.
//  Copyright © 2021 yujin son. All rights reserved.
//

import UIKit

class  DetailDanceViewController: UIViewController {
    @IBOutlet weak var danceImgView: UIImageView!
    @IBOutlet weak var danceNameLabel: UILabel!
    @IBOutlet weak var danceTimeLabel: UILabel!
    @IBOutlet weak var danceSpaceLabel: UILabel!
    @IBOutlet weak var danceHostLabel: UILabel!
    @IBOutlet var danceCostLabel: UILabel!
    
   let model = DetailDanceViewModel()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            updateUI()
            // Do any additional setup after loading the view.
        }

        func updateUI(){
            // segue로 받아온 데이터를 View로 보여주는 코드
            if let danceInfo = model.danceInfo {
                danceImgView.image = danceInfo.image
                danceNameLabel.text = danceInfo.nameLabel
                danceTimeLabel.text = danceInfo.time
                danceSpaceLabel.text = danceInfo.space
                danceHostLabel.text = danceInfo.host
                danceCostLabel.text = danceInfo.cost
                
                
            }

        }

        

    }
    class DetailDanceViewModel{
        var danceInfo: DanceInfo?
        
        func update(model: DanceInfo?){
            danceInfo = model
        }
    
}
