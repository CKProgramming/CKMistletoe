//
//  MistletoeMarks.swift
//  Mistletoe
//
//  Created by Ryan Clark on 11/3/16.
//  Copyright © 2016 Zach. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

struct MistletoeMarkerKey {
    static let identifier = "identifier"
    static let latitude = "latitude"
    static let longitude = "longitude"
    static let radius = "radius"
    static let eventType = "eventType"
}

enum EventType: String {
    case onEntry = "On Entry"
    case onExit = "On Exit"
}

class MistloeMarker: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var radius: CLLocationDistance
    var identifier: String
    var eventType: EventType
    
    var subtitle: String? {
        let eventTypeString = eventType.rawValue
        return "Radius: \(radius)m - \(eventTypeString)"
    }
    
    init(coordinate: CLLocationCoordinate2D, radius: CLLocationDistance, identifier: String, eventType: EventType) {
        self.coordinate = coordinate
        self.radius = radius
        self.identifier = identifier
        self.eventType = eventType
    }
    
    // MARK: NSCoding
    required init?(coder decoder: NSCoder) {
        let latitude = decoder.decodeDouble(forKey: MistletoeMarkerKey.latitude)
        let longitude = decoder.decodeDouble(forKey: MistletoeMarkerKey.longitude)
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        radius = decoder.decodeDouble(forKey: MistletoeMarkerKey.radius)
        identifier = decoder.decodeObject(forKey: MistletoeMarkerKey.identifier) as! String
        eventType = EventType(rawValue: decoder.decodeObject(forKey: MistletoeMarkerKey.eventType) as! String)!
    }
    
//    func encode(with coder: NSCoder) {
//        coder.encode(coordinate.latitude, forKey: MistletoeMarkerKey.latitude)
//        coder.encode(coordinate.longitude, forKey: MistletoeMarkerKey.longitude)
//        coder.encode(radius, forKey: MistletoeMarkerKey.radius)
//        coder.encode(identifier, forKey: MistletoeMarkerKey.identifier)
//        coder.encode(eventType.rawValue, forKey: MistletoeMarkerKey.eventType)
//    }
    
}
