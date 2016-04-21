//
//  MapViewController.swift
//  Graceful
//
//  Created by momo on 16/4/20.
//  Copyright © 2016年 com.lvwenhan. All rights reserved.
//

import Foundation
import UIKit
let APIKey="34e403a5ea4b5a83e097a47c45f1d5d3"
class MapViewController:UIViewController,MAMapViewDelegate{
    var mapView:MAMapView!
    override func viewDidLoad() {
        self.initMapView()
    }
    // 初始化地图
    func initMapView(){
        MAMapServices.sharedServices().apiKey=APIKey
        mapView=MAMapView.init(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)))
        mapView.delegate=self
        mapView.compassOrigin=CGPointMake(mapView.compassOrigin.x, 22)
        mapView.scaleOrigin=CGPointMake(mapView.scaleOrigin.x, 22)
        self.view.addSubview(mapView)
        mapView.showsUserLocation=true
    }
}