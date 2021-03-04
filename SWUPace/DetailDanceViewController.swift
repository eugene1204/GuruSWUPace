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
    
    
    @IBOutlet var danceTitle: UILabel!
    @IBOutlet var danceSub1: UILabel!
    @IBOutlet var danceSub2: UILabel!
    @IBOutlet var danceSub3: UILabel!
    @IBOutlet var danceMain: UILabel!
    @IBOutlet var danceTeacher: UIButton!
    
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
            
            let danceDetailInfo =  model.DanceViewDataModel(info: model.danceInfo?.danceClass ?? "no")
            
            danceTitle.text = danceDetailInfo.danceTitle
            danceSub1.text = danceDetailInfo.danceSub1
            danceSub2.text = danceDetailInfo.danceSub2
            danceSub3.text = danceDetailInfo.danceSub3
            danceMain.text = danceDetailInfo.danceMain
            

        }

        

    }
struct DanceDetailInfo {
    let danceClass:String
    let danceTitle:String
    let danceSub1:String
    let danceSub2:String
    let danceSub3:String
    let danceMain:String
    let danceTeacher:String
    
    var image: UIImage? {
           return UIImage(named: "\(danceTeacher).jpg")
       }
    
    init(danceClass:String, danceTitle: String, danceSub1: String, danceSub2:String, danceSub3:String, danceMain:String, danceTeacher:String) {
        self.danceClass = danceClass
        self.danceTitle = danceTitle
        self.danceSub1 = danceSub1
        self.danceSub2 = danceSub2
        self.danceSub3 = danceSub3
        self.danceMain = danceMain
        self.danceTeacher = danceTeacher
    }
}

class DetailDanceViewModel{
        var danceInfo: DanceInfo?
        var danceDetail: DanceDetailInfo?
    func DanceViewDataModel(info: String) -> (DanceDetailInfo){
        var danceInfoList:DanceDetailInfo = DanceDetailInfo(danceClass: "", danceTitle: "", danceSub1: "", danceSub2: "", danceSub3: "", danceMain: "", danceTeacher: "")
        
        let danceViewDataModel = DanceDetailData()
        print("-->\(info)")
        print("-->\(String(describing: danceViewDataModel.danceDetailData.first?.danceClass))")
        if let i = danceViewDataModel.danceDetailData.firstIndex(where: { $0.danceClass == info }) {
           danceInfoList = danceViewDataModel.danceDetailData[i]
        }
    
                   return danceInfoList
               }
    
        func update(model: DanceInfo?){
            danceInfo = model
        }
    
}

struct DanceDetailData {
    let danceDetailData = [
        DanceDetailInfo(danceClass: "program_1", danceTitle: "처음접한 kpop댄스 정복하기", danceSub1: "kpop마스터", danceSub2: "초보자환영", danceSub3: "kpop완전정복", danceMain: "메인화면", danceTeacher: "dance"),
        DanceDetailInfo(danceClass: "hyoni1", danceTitle: "처음접한 걸스힙합 정복하기", danceSub1: "걸스힙합마스터", danceSub2: "초보자환영", danceSub3: "걸스힙합완전정복", danceMain: "메인화면", danceTeacher: "dance"),
        DanceDetailInfo(danceClass: "hyoni2", danceTitle: "걸리쉬 정복하기", danceSub1: "걸리쉬마스터", danceSub2: "초보자환영", danceSub3: "걸리쉬완전정복", danceMain: "메인화면", danceTeacher: "dance"),
        DanceDetailInfo(danceClass: "hyoni3", danceTitle: "처음접한 힙합 정복하기", danceSub1: "힙합마스터", danceSub2: "초보자환영", danceSub3: "힙합완전정복", danceMain: "메인화면", danceTeacher: "dance")
    ]
}

