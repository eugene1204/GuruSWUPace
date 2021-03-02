//
//  DetailViewController.swift
//  SWUPace
//
//  Created by yujin son on 2021/02/15.
//  Copyright © 2021 yujin son. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController{
    
    var scrollView: UIScrollView!
    var stackView: UIStackView!
     
    func swipeRecognizer() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.right:
                // 스와이프 시, 원하는 기능 구현.
                self.dismiss(animated: true, completion: nil)
                default: break
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
func setup() {
    self.scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(scrollView)

    scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true

    self.stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 23.0
    scrollView.addSubview(stackView)

    scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[stackView]|", options: NSLayoutConstraint.FormatOptions.alignAllCenterX, metrics: nil, views: ["stackView": stackView!]))
    scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[stackView]|", options: NSLayoutConstraint.FormatOptions.alignAllCenterX, metrics: nil, views: ["stackView": stackView!]))

    stackView.addArrangedSubview(image(filename: "상세페이지"))
    stackView.addArrangedSubview(image(filename: "상세페이지"))
 }
    
func image(filename: String) -> UIImageView {
    let img = UIImage(named: "상세페이지")
    let imgView = UIImageView(image: img)
    
    let width = view.frame.width
    var height = view.frame.width
        
    let imgWidth = img!.size.width
    let imgHeight = img!.size.height
    height = height*(imgHeight/imgWidth)
        
    imgView.widthAnchor.constraint(equalToConstant: width).isActive = true
    imgView.heightAnchor.constraint(equalToConstant: height).isActive = true
    
    return imgView
    }
}
