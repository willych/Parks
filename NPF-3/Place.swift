//
//  Places.swift
//  NPF-3
//
//  Created by Will on 11/8/16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class Place: NSObject, MKAnnotation {
    var name  = ""
    var state = ""
    var location : CLLocation?
    //needed for the MKAnnotation protocol
    @objc var coordinate: CLLocationCoordinate2D {
        get {
            return location!.coordinate
        }
    }
    override var description : String {
        return "{\n\t Landmark Name: \(name)\n\t State: \(state)\n\t location: \(location)\n}"
    }
    
    init(name: String, state: String, location: CLLocation) {
        self.name = name
        self.state = state
        self.location = location
    }
    
    //optional - required with set callout true
    @objc var title : String? {
        get {
            return name
        }
    }
    
    @objc var subtitle : String? {
        get {
            return state
        }
    }
    
    
}
