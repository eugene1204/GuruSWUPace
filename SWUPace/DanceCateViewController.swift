//
//  DanceCateViewController.swift
//  SWUPace
//
//  Created by yujin son on 2021/02/15.
//  Copyright © 2021 yujin son. All rights reserved.
//


import Foundation
import UIKit

class DanceCateViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var hi: String = ""
    
    let model = DanceViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("--> \(hi)")
        model.hi = hi
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail1"{
            // vc에 DetailViewController 넣어줌
            let vc = segue.destination as? DetailDanceViewController
            if let index = sender as? Int{
                // BountyViewController의 viewModel
                let danceInfo = model.danceInfo(at: index)
                // DetailViewController의 viewmodel에 bountyInfo를 넣어줌
                vc?.model.update(model: danceInfo)

                
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail1", sender: indexPath.row)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.numOfDanceInfoList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "danceCell", for: indexPath) as? danceListCell else {
            return UITableViewCell()
        }
        let danceInfo = model.danceInfo(at: indexPath.row)
        
        
        
        cell.update(info: danceInfo)
        
        
        return cell
    }
}

class danceListCell: UITableViewCell {
    @IBOutlet weak var danceImgView: UIImageView!
    @IBOutlet weak var danceNameLabel: UILabel!
    @IBOutlet weak var danceTimeLabel: UILabel!
    @IBOutlet weak var danceSpaceLabel: UILabel!
    @IBOutlet weak var danceHostLabel: UILabel!
    
    @IBOutlet var danceCostLabel: UILabel!
    
    func update(info: DanceInfo){
        danceImgView.image = info.image
        danceNameLabel.text = info.nameLabel
        danceTimeLabel.text = info.time
        danceSpaceLabel.text = info.space
        danceHostLabel.text = info.host
        danceCostLabel.text = info.cost
        
    }
}

struct DanceInfo {
    let danceClass:String
    let nameLabel:String
    let time:String
    let space:String
    let host:String
    let cost:String
    
    var image: UIImage? {
           return UIImage(named: "\(danceClass).jpg")
       }
    
    init(danceClass: String, nameLabel: String, space:String, time:String, host:String, cost:String) {
        self.danceClass = danceClass
        self.nameLabel = nameLabel
        self.space = space
        self.time = time
        self.host = host
        self.cost = cost
    }
}

class DanceViewModel {
  
    var hi: String = ""
    var numOfDanceInfoList: Int{
        return DanceViewDataModel().count
    }
    func danceInfo(at index : Int) -> DanceInfo{
        return DanceViewDataModel()[index]
    }
    
    func DanceViewDataModel() -> [DanceInfo]{
        var danceInfoList:[DanceInfo] = []
        let danceViewDataModel = DanceDataModel()
        if hi == "학생누리관"{
            danceInfoList = danceViewDataModel.StudentData
        }else if hi == "바롬인성교육관"{
            danceInfoList = danceViewDataModel.BaromData
        }else if hi == "제1과학관"{
            danceInfoList = danceViewDataModel.Science1Data
        }else if hi == "제2과학관"{
            danceInfoList = danceViewDataModel.Science2Data
        }else if hi == "고명우기념관"{
            danceInfoList = danceViewDataModel.GomyungwooData
        }else if hi == "인문사회관"{
            danceInfoList = danceViewDataModel.SocialsciencesData
        }else if hi == "기독교교육관"{
            danceInfoList = danceViewDataModel.ChristianData
        }else {
            danceInfoList = danceViewDataModel.Anniversary50thData
        }
        
        return danceInfoList
    }
}



struct DanceDataModel{
    let StudentData = [
    DanceInfo(danceClass: "program_1", nameLabel: "2주 완성: K-Pop 댄스", space: "학생누리관 B104호", time: "2020년 8월 17일 17시 외 3일", host: "HYONI DANCE CLASS", cost: "80,000"),
    
    DanceInfo(danceClass: "hyoni1", nameLabel: "원데이 걸스힙합 클래스", space: "학생누리관 104호", time: "2020년 8월 18일 15시", host: "HYONI DANCE CLASS", cost: "25,000"),
    
    DanceInfo(danceClass: "hyoni2", nameLabel: "걸리쉬 3개월 정규과정", space: "학생누리관 203호", time: "2020년 8월 19일 13시", host: "HYONI DANCE CLASS", cost: "270,000"),
    
    DanceInfo(danceClass: "hyoni3", nameLabel: "힙합정복 4주 프로젝트", space: "학생누리관 405호", time: "2020년 8월 22일 12시 외 1일", host: "HYONI DANCE CLASS", cost: "130,000")
    ]
    
    let BaromData = [
    DanceInfo(danceClass: "program_1", nameLabel: "2주 완성: K-Pop 댄스", space: "바롬인성교육관 B104호", time: "2020년 8월 17일 17시 외 3일", host: "HYONI DANCE CLASS", cost: "80,000"),
    
    DanceInfo(danceClass: "hyoni1", nameLabel: "원데이 걸스힙합 클래스", space: "바롬인성교육관 104호", time: "2020년 8월 18일 15시", host: "HYONI DANCE CLASS", cost: "25,000"),
    
    DanceInfo(danceClass: "hyoni2", nameLabel: "걸리쉬 3개월 정규과정", space: "바롬인성교육관 203호", time: "2020년 8월 19일 13시", host: "HYONI DANCE CLASS", cost: "270,000"),
    
    DanceInfo(danceClass: "hyoni3", nameLabel: "힙합정복 4주 프로젝트", space: "바롬인성교육관 405호", time: "2020년 8월 22일 12시 외 1일", host: "HYONI DANCE CLASS", cost: "130,000")
    ]
    
    let Science2Data = [
    DanceInfo(danceClass: "program_1", nameLabel: "2주 완성: K-Pop 댄스", space: "제2과학관 B104호", time: "2020년 8월 17일 17시 외 3일", host: "HYONI DANCE CLASS", cost: "80,000"),
    
    DanceInfo(danceClass: "hyoni1", nameLabel: "원데이 걸스힙합 클래스", space: "제2과학관 104호", time: "2020년 8월 18일 15시", host: "HYONI DANCE CLASS", cost: "25,000"),
    
    DanceInfo(danceClass: "hyoni2", nameLabel: "걸리쉬 3개월 정규과정", space: "제2과학관 203호", time: "2020년 8월 19일 13시", host: "HYONI DANCE CLASS", cost: "270,000"),
    
    DanceInfo(danceClass: "hyoni3", nameLabel: "힙합정복 4주 프로젝트", space: "제2과학관 405호", time: "2020년 8월 22일 12시 외 1일", host: "HYONI DANCE CLASS", cost: "130,000")
    ]
    let Science1Data = [
    DanceInfo(danceClass: "program_1", nameLabel: "2주 완성: K-Pop 댄스", space: "제1과학관 B104호", time: "2020년 8월 17일 17시 외 3일", host: "HYONI DANCE CLASS", cost: "80,000"),
    
    DanceInfo(danceClass: "hyoni1", nameLabel: "원데이 걸스힙합 클래스", space: "제1과학관 104호", time: "2020년 8월 18일 15시", host: "HYONI DANCE CLASS", cost: "25,000"),
    
    DanceInfo(danceClass: "hyoni2", nameLabel: "걸리쉬 3개월 정규과정", space: "제1과학관 203호", time: "2020년 8월 19일 13시", host: "HYONI DANCE CLASS", cost: "270,000"),
    
    DanceInfo(danceClass: "hyoni3", nameLabel: "힙합정복 4주 프로젝트", space: "제1과학관 405호", time: "2020년 8월 22일 12시 외 1일", host: "HYONI DANCE CLASS", cost: "130,000")
    ]
    let GomyungwooData = [
    DanceInfo(danceClass: "program_1", nameLabel: "2주 완성: K-Pop 댄스", space: "고명우기념관 B104호", time: "2020년 8월 17일 17시 외 3일", host: "HYONI DANCE CLASS", cost: "80,000"),
    
    DanceInfo(danceClass: "hyoni1", nameLabel: "원데이 걸스힙합 클래스", space: "고명우기념관 104호", time: "2020년 8월 18일 15시", host: "HYONI DANCE CLASS", cost: "25,000"),
    
    DanceInfo(danceClass: "hyoni2", nameLabel: "걸리쉬 3개월 정규과정", space: "고명우기념관 203호", time: "2020년 8월 19일 13시", host: "HYONI DANCE CLASS", cost: "270,000"),
    
    DanceInfo(danceClass: "hyoni3", nameLabel: "힙합정복 4주 프로젝트", space: "고명우기념관 405호", time: "2020년 8월 22일 12시 외 1일", host: "HYONI DANCE CLASS", cost: "130,000")
    ]
    
    let Anniversary50thData = [
    DanceInfo(danceClass: "program_1", nameLabel: "2주 완성: K-Pop 댄스", space: "50주년기념관 B104호", time: "2020년 8월 17일 17시 외 3일", host: "HYONI DANCE CLASS", cost: "80,000"),
    
    DanceInfo(danceClass: "hyoni1", nameLabel: "원데이 걸스힙합 클래스", space: "50주년기념관 104호", time: "2020년 8월 18일 15시", host: "HYONI DANCE CLASS", cost: "25,000"),
    
    DanceInfo(danceClass: "hyoni2", nameLabel: "걸리쉬 3개월 정규과정", space: "50주년기념관 203호", time: "2020년 8월 19일 13시", host: "HYONI DANCE CLASS", cost: "270,000"),
    
    DanceInfo(danceClass: "hyoni3", nameLabel: "힙합정복 4주 프로젝트", space: "50주년기념관 405호", time: "2020년 8월 22일 12시 외 1일", host: "HYONI DANCE CLASS", cost: "130,000")
    ]
    
    let ChristianData = [
    DanceInfo(danceClass: "program_1", nameLabel: "2주 완성: K-Pop 댄스", space: "기독교교육관 B104호", time: "2020년 8월 17일 17시 외 3일", host: "HYONI DANCE CLASS", cost: "80,000"),
    
    DanceInfo(danceClass: "hyoni1", nameLabel: "원데이 걸스힙합 클래스", space: "기독교교육관 104호", time: "2020년 8월 18일 15시", host: "HYONI DANCE CLASS", cost: "25,000"),
    
    DanceInfo(danceClass: "hyoni2", nameLabel: "걸리쉬 3개월 정규과정", space: "기독교교육관 203호", time: "2020년 8월 19일 13시", host: "HYONI DANCE CLASS", cost: "270,000"),
    
    DanceInfo(danceClass: "hyoni3", nameLabel: "힙합정복 4주 프로젝트", space: "기독교교육관 405호", time: "2020년 8월 22일 12시 외 1일", host: "HYONI DANCE CLASS", cost: "130,000")
    ]
    
    let SocialsciencesData = [
    DanceInfo(danceClass: "program_1", nameLabel: "2주 완성: K-Pop 댄스", space: "인문사회관 B104호", time: "2020년 8월 17일 17시 외 3일", host: "HYONI DANCE CLASS", cost: "80,000"),
    
    DanceInfo(danceClass: "hyoni1", nameLabel: "원데이 걸스힙합 클래스", space: "인문사회관 104호", time: "2020년 8월 18일 15시", host: "HYONI DANCE CLASS", cost: "25,000"),
    
    DanceInfo(danceClass: "hyoni2", nameLabel: "걸리쉬 3개월 정규과정", space: "인문사회관 203호", time: "2020년 8월 19일 13시", host: "HYONI DANCE CLASS", cost: "270,000"),
    
    DanceInfo(danceClass: "hyoni3", nameLabel: "힙합정복 4주 프로젝트", space: "인문사회관 405호", time: "2020년 8월 22일 12시 외 1일", host: "HYONI DANCE CLASS", cost: "130,000")
    ]
}
