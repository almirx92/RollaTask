//
//  GPSTrackerManager.swift
//  RollaTask
//
//  Created by AlmirGaric on 16. 9. 2023..
//

import Foundation
import CoreLocation

class GPSTrackerManager : NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager: CLLocationManager = CLLocationManager()
    
    @Published var currentLocation: CLLocation?
    @Published var currentSpeed: CLLocationSpeed = 0.0
    @Published var traveledDistance: CLLocationDistance = 0.0
    
    override init(){
        super.init()
        setupLocationManager()
    }
    
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func startTracking(){
        locationManager.startUpdatingLocation()
    }
    func stopTracking(){
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            currentLocation = location
            
            //Calculate the speed and distance from previous location
            if let previousLocation = currentLocation {
                let distance = location.distance(from: previousLocation)
                let timeInterval = location.timestamp.timeIntervalSince(previousLocation.timestamp)
                currentSpeed = location.speed
                //Speed in meters per seconds
                traveledDistance += distance
                }
            }
        }
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        print(error)
    }
}

