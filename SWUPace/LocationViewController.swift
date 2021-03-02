
//  LocationViewController.swift
//  SWUPace
//
//  Created by yujin son on 2021/02/15.
//  Copyright © 2021 yujin son. All rights reserved.
//


import UIKit
// 지도에서 해야할일
class LocationViewController: UIViewController, MTMapViewDelegate {

    var mapView: MTMapView?
    var item : MTMapLocationMarkerItem?
    //let viewmodel = LocationViewModel()
    var className: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MTMapView(frame: self.view.bounds)
        // 서브뷰 화면 줄이기
        mapView = MTMapView(frame: CGRect(x:0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height ))
      
        if let mapView = mapView {
            mapView.delegate = self
            mapView.baseMapType = .standard
            self.view.addSubview(mapView)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segue = segue.destination as? DanceCateViewController else {return}
        
        segue.hi = self.className
        
    }
   
    override func viewDidAppear(_ animated: Bool) {

        var items = [MTMapPOIItem]()

        items.append(redPin(name: "제1과학관", latitude: 37.62911500767666, longitude: 127.0896285993677))
        items.append(redPin(name: "기독교교육관", latitude: 37.626915951953634, longitude: 127.09258417810612))
        items.append(redPin(name: "50주년기념관", latitude: 37.62609234679618, longitude: 127.0931163788395))
        items.append(redPin(name: "인문사회관", latitude: 37.62825377914086, longitude: 127.0925341266113))
        items.append(redPin(name: "학생누리관", latitude: 37.628764709745695, longitude: 127.09058079885517))
        items.append(redPin(name: "제2과학관", latitude: 37.62936389897382, longitude: 127.09053715600139))
        items.append(redPin(name: "고명우기념관", latitude: 37.629094075032214, longitude: 127.09089994973182))
        items.append(redPin(name: "바롬인성교육관", latitude: 37.62737598525001, longitude: 127.0884382060209))
      
        //mapView?.showCurrentLocationMarker = true
        //mapView?.updateCurrentLocationMarker(item)

        mapView?.addPOIItems(items)
        mapView?.fitAreaToShowAllPOIItems()  // 모든 마커가 보이게 카메라 위치/줌 조정
    }
    
    func redPin(name:String, latitude: Double, longitude: Double) -> MTMapPOIItem {
        //MapView(frame: self.view.frame)let i = MapView()
        let item = MTMapPOIItem()
        item.itemName = name
        item.customImageName = "location"
        item.customSelectedImageName = "point"
        item.markerType = .customImage
        item.markerSelectedType = .customImage
        item.mapPoint = MTMapPoint(geoCoord: .init(latitude: latitude, longitude: longitude))
        item.showAnimationType = .dropFromHeaven
        item.showDisclosureButtonOnCalloutBalloon = true
        item.customImageAnchorPointOffset = .init(offsetX: 30, offsetY: 0) // 마커 위치 조정

        return item
    }
    
    func mapView(_ mapView: MTMapView!, touchedCalloutBalloonOf poiItem: MTMapPOIItem!) {
        
        className = poiItem.itemName!
        print("hihi \(className)")
        performSegue(withIdentifier: "detail", sender: className)
        
    }
    
}

struct  LocationInfo {
    let name:String
    let latitude: Double
    let longitude: Double
    
    
    init(name: String, latitude: Double, longitude:Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
}

class LocationViewModel{
    let mapInfoList:[LocationInfo] = [
        LocationInfo(name: "제1과학관", latitude: 37.62911500767666, longitude: 127.0896285993677),
        LocationInfo(name: "기독교교육관", latitude: 37.626915951953634, longitude: 127.09258417810612),
        LocationInfo(name: "50주년기념관", latitude: 37.62609234679618, longitude: 127.0931163788395),
        LocationInfo(name: "인문사회관", latitude: 37.62825377914086, longitude: 127.0925341266113),
        LocationInfo(name: "학생누리관", latitude: 37.628764709745695, longitude: 127.09058079885517),
        LocationInfo(name: "제2과학관", latitude: 37.62936389897382, longitude: 127.09053715600139),
        LocationInfo(name: "고명우기념관", latitude: 37.629094075032214, longitude: 127.09089994973182),
        LocationInfo(name: "바롬인성교육관", latitude: 37.62737598525001, longitude: 127.0884382060209)
        
    ]
    
    
    func locationInfo(at index: Int) -> LocationInfo{
        return mapInfoList[index]
    }

}
func redPin(locationInfo: LocationInfo) -> MTMapPOIItem {
    //MapView(frame: self.view.frame)let i = MapView()
    let item = MTMapPOIItem()
    item.itemName = locationInfo.name
    item.customImageName = "location"
    item.customSelectedImageName = "point"
    item.markerType = .customImage
    item.markerSelectedType = .customImage
    item.mapPoint = MTMapPoint(geoCoord: .init(latitude: locationInfo.latitude, longitude: locationInfo.longitude))
    item.showAnimationType = .dropFromHeaven
    item.showDisclosureButtonOnCalloutBalloon = true
    item.customImageAnchorPointOffset = .init(offsetX: 30, offsetY: 0) // 마커 위치 조정

    return item
}

