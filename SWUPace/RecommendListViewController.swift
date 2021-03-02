//
//  RecommendListViewController.swift
//  SWUPace
//
//  Created by yujin son on 2021/02/15.
//  Copyright © 2021 yujin son. All rights reserved.
//

import UIKit

class RecommendListViewController: UIViewController {

    @IBOutlet weak var sectionTitle: UILabel!
    let viewModel = RecommentListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    func updateUI() {
        sectionTitle.text = viewModel.type.title
    }
}

extension RecommendListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCell", for: indexPath) as? RecommendCell else {
            return UICollectionViewCell()
        }
        
        let movie = viewModel.item(at: indexPath.item)
        cell.updateUI(movie: movie)
        return cell
    }
}

extension RecommendListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 160)
    }
}

class RecommentListViewModel {
    enum RecommendingType {
        case hot
        
        var title: String {
            switch self {
            case .hot: return "✨ 슈니에게 추천하는 프로그램 ✨"
            }
        }
    }
    
    private (set) var type: RecommendingType = .hot
    private var items: [DummyItem] = []
    
    var numOfItems: Int {
        return items.count
    }
    
    func item(at index: Int) -> DummyItem {
        return items[index]
    }
    
    func updateType(_ type: RecommendingType) {
        self.type = type
    }
    
    func fetchItems() {
        self.items = ClassFetcher.fetch(type)
    }
}

class RecommendCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImage: UIImageView!
    
    func updateUI(movie: DummyItem) {
        thumbnailImage.image = movie.thumbnail
    }
}

class ClassFetcher {
    static func fetch(_ type: RecommentListViewModel.RecommendingType) -> [DummyItem] {
        switch type {
        // 네스티드 스크롤 뷰에 보여줄 이미지
        case .hot:
            let classes = (1..<9).map { DummyItem(thumbnail: UIImage(named: "program_\($0)")!) }
            return classes
        }
    }
}

struct DummyItem {
    let thumbnail: UIImage
}

