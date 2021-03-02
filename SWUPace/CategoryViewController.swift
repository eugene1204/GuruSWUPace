//
//  CategoryViewController.swift
//  SWUPace
//
//  Created by yujin son on 2021/02/15.
//  Copyright © 2021 yujin son. All rights reserved.
//


import UIKit
import Firebase
import FirebaseDatabase

class CategoryViewController: UIViewController{

    @IBOutlet weak var searchBar_: UISearchBar!
    
    let dateFormatter = DateFormatter()
    let db = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    public func searchBarSearchButton(_ searchBar_: UISearchBar){
        searchBar_.resignFirstResponder()
    }
}

extension CategoryViewController: UISearchBarDelegate {

    private func dismissKeyboard() {
        searchBar_.resignFirstResponder()
    }

    func searchBarSearchButtonClicked(_ searchBar_: UISearchBar) {
        // 키보드가 올라와 있을때, 내려가도록 처리
        dismissKeyboard()
    
        let searchData = self.searchBar_.text!
        self.db.child("searchData").setValue(searchData)
    
        // 검색씬으로 전환
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else{ return }
    
        // 화면 전환 애니메이션 설정
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
    
        // 인자값으로 다음 뷰 컨트롤러를 넣고 present 메소드 호출
        self.present(uvc, animated: true)
    }
}

