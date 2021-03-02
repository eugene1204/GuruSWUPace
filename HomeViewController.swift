//
//  HomeViewController.swift
//  
//
//  Created by yujin son on 2021/02/15.
//


import UIKit
import FSCalendar
import Firebase
import FirebaseDatabase

class HomeViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate{
    var hotRecommendListViewController: RecommendListViewController!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var todayClassLabel: UILabel!
    
    let dateFormatter = DateFormatter()
    let db = Database.database().reference()
    var dates = ["2020-08-17","2020-08-28"]
    let eventColor = #colorLiteral(red: 0.835075438, green: 0.3756210208, blue: 0.176584363, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.allowsMultipleSelection = true
        calendar.delegate = self
        calendar.dataSource = self
        
        let lineView1 = UIView(frame: CGRect(x: 0, y: 505, width: self.view.frame.size.width, height: 1))
        let lineView2 = UIView(frame: CGRect(x: 0, y: 555, width: self.view.frame.size.width, height: 1))
        lineView1.backgroundColor = #colorLiteral(red: 0.8510087132, green: 0.8508757949, blue: 0.8594985604, alpha: 1)
        lineView2.backgroundColor = #colorLiteral(red: 0.8510087132, green: 0.8508757949, blue: 0.8594985604, alpha: 1)
        self.view.addSubview(lineView1)
        self.view.addSubview(lineView2)
    }

    public func searchBarSearchButton(_ searchBar: UISearchBar){
        searchBar.resignFirstResponder()
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"

        for dateStr in dates{
         if(dateFormatter.string(from: date) == dateStr){
            return 1
            }
        }
        return 0
    }
    
    // 날짜 선택 시 콜백 메소드
    public func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            dateFormatter.dateFormat = "YYYY-MM-dd"
            print(dateFormatter.string(from: date))
        
            if (dateFormatter.string(from: date) == "2020-08-17"){
                todayClassLabel.text = "2주 완성: K-Pop 댄스 클래스"
            }else if(dateFormatter.string(from: date) == "2020-08-28"){
                todayClassLabel.text = "인플루언서로 살아남는 법"
            }else{
                todayClassLabel.text = "등록된 일정이 없습니다."
            }
    }
     
    // 날짜 선택 해제 시 콜백 메소드
    public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
            dateFormatter.dateFormat = "YYYY-MM-dd"
            print(dateFormatter.string(from: date))
            todayClassLabel.text = "등록된 일정이 없습니다."
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "hot" {
            let destinationVC = segue.destination as? RecommendListViewController
            hotRecommendListViewController = destinationVC
            hotRecommendListViewController.viewModel.updateType(.hot)
            hotRecommendListViewController.viewModel.fetchItems()
        }
    }
}

extension HomeViewController: UISearchBarDelegate {

    private func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // 키보드가 올라와 있을때, 내려가도록 처리
        dismissKeyboard()
    
        let searchData=self.searchBar.text!
        self.db.child("searchData").setValue(searchData)
    
        // 검색씬으로 전환
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else{ return }
    
        // 화면 전환 애니메이션 설정
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
    
        // 인자값으로 다음 뷰 컨트롤러를 넣고 present 메소드 호출
        self.present(uvc, animated: true)
    }
}

