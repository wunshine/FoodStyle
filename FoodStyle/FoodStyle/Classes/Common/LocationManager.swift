//
//  LocationManager.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/12.
//  Copyright © 2016年 code4Fun. All rights reserved.
//
//
import UIKit
import CoreLocation
class LocationManager:CLLocationManager{
    static let sharedLocationManager:CLLocationManager = {
        let manager = CLLocationManager()
        manager.allowsBackgroundLocationUpdates = true
        manager.distanceFilter = kCLDistanceFilterNone
        manager.desiredAccuracy = kCLLocationAccuracyBest
        return manager
    }()
}
