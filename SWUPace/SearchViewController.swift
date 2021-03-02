//
//  SearchViewController.swift
//  SWUPace
//
//  Created by yujin son on 2021/02/15.
//  Copyright © 2021 yujin son. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let classList =
        ["program_1","program_2","program_3","program_4","program_5","program_6","program_7","program_8"]
    let nameLabelList =
        ["2주 완성: K-Pop 댄스", "인플루언서로 살아남는 법","빈티지 라운드 접시 만들기","오일파스텔 하루완성!","나만의 접시 디자인하기","[2:1] 맞춤형 댄스 정복","원데이 베이직 커피 클래스","[앵콜] 힐링 푸드트럭"]
    let timeList =
        ["2020년 8월 17일 17시 외 3일","2020년 8월 28일 15시","2020년 8월 29일 13시","2020년 9월 1일 12시 외 1일","2020년 9월 2일 18시","2020년 8월 18일 14시 외 2일","2020년 9월 9일 16시","2020년 9월 10일 13시"]
    let spaceList =
        ["제2 과학관 B104호","대강당","조형예술관","인물사회관 102호","바롬인성교육관 201호","제2 과학관 B104호","제1 과학관 103호","삼각숲"]
    let hostList =
        ["HYONI DANCE CLASS","서울여자대학교","빈티지모아","드로잉 스튜디오","올포유","웨이브몬스터","CAFE BOOM","또또아뜰리에"]
    
    var hotRecommendListViewController: RecommendListViewController!
    
    let db = Database.database().reference()
    
    @IBOutlet weak var searchBar2: UISearchBar!
    @IBOutlet weak var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLabel()
        
        let lineView = UIView(frame: CGRect(x: 0, y: 188, width: self.view.frame.size.width, height: 1))
        lineView.backgroundColor = #colorLiteral(red: 0.8510087132, green: 0.8508757949, blue: 0.8594985604, alpha: 1)
        self.view.addSubview(lineView)
    }
    
    public func searchBarSearchButton(_ searchBar2: UISearchBar){
        searchBar2.resignFirstResponder()
    }
    
    func updateLabel(){
           // Firebase에 있는 데이터 값 가져와서 최근 검색 목록으로 보여주기
        db.child("searchData").observeSingleEvent(of: .value) {snapshot in print("--> \(snapshot)")
               let value = snapshot.value as? String ?? ""
               DispatchQueue.main.async {
                   self.dataLabel.text = value
               }
           }
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
            
        let img = UIImage(named: "\(classList[indexPath.row]).jpg")
        cell.imgView.image = img
        cell.nameLabel.text = nameLabelList[indexPath.row]
        cell.spaceLabel.text = "\(spaceList[indexPath.row])"
        cell.timeLabel.text="\(timeList[indexPath.row])"
        cell.hostLabel.text="\(hostList[indexPath.row])"
        
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {

    private func dismissKeyboard() {
        searchBar2.resignFirstResponder()
        }
    
    func searchBarSearchButtonClicked(_ searchBar2: UISearchBar) {
        // 키보드가 올라와 있을때, 내려가도록 처리
        dismissKeyboard()
        
        let searchData=self.searchBar2.text!
        self.db.child("searchData").setValue(searchData)
        
        updateLabel()
    }
}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var spaceLabel: UILabel!
    @IBOutlet weak var hostLabel: UILabel!
}
