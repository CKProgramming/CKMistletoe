//
//  MistletoeMapViewController.swift
//  Mistletoe
//
//  Created by Ryan Clark on 11/3/16.
//  Copyright © 2016 Zach. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

struct PreferencesKeys {
    static let savedItems = "savedItems"
}

class MistletoeMapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var mistletoeMarkers = [MistletoeMarker]()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        locationManager.delegate = self
        // 2
        locationManager.requestAlwaysAuthorization()
        // 3
        loadAllMistletoeMarker()
    }
    
    // MARK: Loading and saving functions
    func loadAllMistletoeMarker() {
        mistletoeMarkers = []
        guard let savedItems = UserDefaults.standard.array(forKey: PreferencesKeys.savedItems) else { return }
        for savedItem in savedItems {
            guard let mistletoemarker = NSKeyedUnarchiver.unarchiveObject(with: savedItem as! Data) as? MistletoeMarker else { continue }
            add(mistletoemarker: mistletoemarker)
        }
    }
    
    func addGeotification(didAddCoordinate coordinate: CLLocationCoordinate2D, radius: Double, identifier: String, eventType: EventType) {
        
        // 1
        let clampedRadius = min(radius, locationManager.maximumRegionMonitoringDistance)
        let mistletoemarker = MistletoeMarker(coordinate: coordinate, radius: clampedRadius, identifier: identifier, eventType: eventType)
        add(mistletoemarker: mistletoemarker)
        // 2
        startMonitoring(mistletoemarker: mistletoemarker)
        saveAllMistletoeMarker()
    }
    
    func region(withGeotification geotification: MistletoeMarker) -> CLCircularRegion {
        // 1
        let region = CLCircularRegion(center: geotification.coordinate, radius: geotification.radius, identifier: geotification.identifier)
        // 2
        region.notifyOnEntry = (geotification.eventType == .onEntry)
        region.notifyOnExit = !region.notifyOnEntry
        return region
    }
    
    func startMonitoring(mistletoemarker: MistletoeMarker) {
        // 1
        if !CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            showAlert(withTitle:"Error", message: "Geofencing is not supported on this device!")
            return
        }
        // 2
        if CLLocationManager.authorizationStatus() != .authorizedAlways {
            showAlert(withTitle:"Warning", message: "Your geotification is saved but will only be activated once you grant Geotify permission to access the device location.")
        }
        // 3
        let region = self.region(withGeotification: mistletoemarker)
        // 4
        locationManager.startMonitoring(for: region)
    }
    
    func saveAllMistletoeMarker() {
        var items: [Data] = []
        for geotification in mistletoeMarkers {
            let item = NSKeyedArchiver.archivedData(withRootObject: geotification)
            items.append(item)
        }
        UserDefaults.standard.set(items, forKey: PreferencesKeys.savedItems)
    }
    
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        print("Monitoring failed for region with identifier: \(region!.identifier)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location Manager failed with the following error: \(error)")
    }
    
    // MARK: Functions that update the model/associated views with geotification changes
    func add(mistletoemarker: MistletoeMarker) {
        mistletoeMarkers.append(mistletoemarker)
        mapView.addAnnotation(mistletoemarker)
        addRadiusOverlay(forGeotification: mistletoemarker)
    }
    
    // MARK: Map overlay functions
    func addRadiusOverlay(forGeotification geotification: MistletoeMarker) {
        mapView?.add(MKCircle(center: geotification.coordinate, radius: geotification.radius))
    }
}

extension MistletoeMapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        mapView.showsUserLocation = (status == .authorizedAlways)
    }
}
