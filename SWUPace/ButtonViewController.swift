//
//  ButtonViewController.swift
//  SWUPace
//
//  Created by yujin son on 2021/02/15.
//  Copyright © 2021 yujin son. All rights reserved.
//


import UIKit

class ButtonViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {

        let classList =
            ["program_1","hyoni1","hyoni2","hyoni3"]
        let nameLabelList =
            ["2주 완성: K-Pop 댄스", "원데이 걸스힙합 클래스","걸리쉬 3개월 정규과정","힙합정복 4주 프로젝트"]
        let timeList =
            ["2020년 8월 17일 17시 외 3일","2020년 8월 18일 15시","2020년 8월 19일 13시","2020년 8월 22일 12시 외 1일"]
        let spaceList =
            ["제2 과학관 B104호","제2 과학관 B106호","제2 과학관 B102호","제2 과학관 B106호"]
        let hostList =
            ["HYONI DANCE CLASS","HYONI DANCE CLASS","HYONI DANCE CLASS","HYONI DANCE CLASS"]

        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return classList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MapListCell", for: indexPath) as? MapListCell else {
                return UITableViewCell()
            }
                
            let img = UIImage(named: "\(classList[indexPath.row]).jpg")
            cell.mapImgView.image = img
            cell.mapNameLabel.text = nameLabelList[indexPath.row]
            cell.mapTimeLabel.text = "\(timeList[indexPath.row])"
            cell.mapSpaceLabel.text="\(timeList[indexPath.row])"
            cell.mapHostLabel.text="\(hostList[indexPath.row])"
            
            return cell
        }
    }

    class MapListCell: UITableViewCell {
        
        @IBOutlet var mapImgView: UIImageView!
        @IBOutlet var mapNameLabel: UILabel!
        @IBOutlet var mapTimeLabel: UILabel!
        
        @IBOutlet var mapSpaceLabel: UILabel!
        @IBOutlet var mapHostLabel: UILabel!
}

