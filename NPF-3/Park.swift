//
//  Park.swift
//  NPF-2
//
//  Created by Student.
//  Copyright © 2016 Willy Choi. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class Park: NSObject, MKAnnotation {
    private var parkName:String = ""
    private var parkLocation:String = ""
    private var dateFormed:String = ""
    private var area:String = ""
    private var link:String = ""
    
    private var location:CLLocation?
    private var imageLink:String = ""
    private var parkDescription:String = ""
    
    private var imageName:String = ""
    private var imageSize:String = ""
    private var imageType:String = ""
    
    var myCoordinate: CLLocationCoordinate2D?
    
    @objc var title: String? {
        get {
            return "\(parkName)"
        }
    }
    
    @objc var subtitle: String? {
        get {
            return "\(area)"
        }
    }
    
    
    @objc var coordinate: CLLocationCoordinate2D {
        get {
            return location!.coordinate
        }
    }
    
    init(myCoordinate: CLLocationCoordinate2D) {
        self.myCoordinate = myCoordinate
    }
    
    override var description: String {return "parkName: \(parkName)\r\nparkLocation: \(parkLocation)\r\ndateFormed: \(dateFormed)\r\narea: \(area)\r\nlink: \(link)\r\nlocation: \(location)\r\nimageLink: \(imageLink)\r\nparkDescription: \(parkDescription)\r\nimageName: \(imageName)\r\nimageSize: \(imageSize)\r\nimageType: \(imageType)\r\n"}
    
    init(parkName:String, parkLocation:String, dateFormed:String, area:String, link:String, location:CLLocation?, imageLink:String, parkDescription:String, imageName:String, imageSize:String, imageType:String) {
        super.init()
        
        setParkName(value: parkName)
        setParkLocation(value: parkLocation)
        setDateFormed(value: dateFormed)
        setArea(value: area)
        setLink(value: link)
        setLocation(value: location)
        setImageLink(value: imageLink)
        setParkDescription(value: parkDescription)
        setImageName(value: imageName)
        setImageSize(value: imageSize)
        setImageType(value: imageType)
    }
    
    convenience override init() {
        self.init(parkName: "Unknown", parkLocation: "Unknown", dateFormed: "Unknown", area: "Unknown", link: "Unknown", location: nil, imageLink: "Unknown", parkDescription: "Unknown", imageName: "Unknown", imageSize: "Unknown", imageType: "Unknown")
    }
    
    func getParkName()->String {
        return parkName
    }
    func setParkName(value: String) {
        if(value.characters.count > 3 && value.characters.count < 75) {
            parkName = value
        } else {
            parkName = "TBD"
            print("Bad value of \(value) in setParkName: setting to TBD")
        }
    }
    
    func getParkLocation()->String {
        return parkLocation
    }
    func setParkLocation(value: String) {
        if(value.characters.count > 3 && value.characters.count < 75 && value.trimmingCharacters(in: .whitespacesAndNewlines) != "" && !value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
            parkLocation = value
        } else {
            parkLocation = "TBD"
            print("Bad value of \(value) in setParkLocation: setting to TBD")
        }
    }
    
    func getDateFormed()->String {
        return dateFormed
    }
    func setDateFormed(value: String) {
        dateFormed = value
    }
    
    func getArea()->String {
        return area
    }
    func setArea(value: String) {
        area = value
    }
    
    func getLink()->String {
        return link
    }
    func setLink(value: String) {
        link = value
    }
    
    func getLocation()->CLLocation {
        return location!
    }
    func setLocation(value: CLLocation!) {
        location = value
    }
    func getImageLink()->String {
        return imageLink
    }
    func setImageLink(value: String) {
        imageLink = value
    }
    func getParkDescription()->String {
        return parkDescription
    }
    func setParkDescription(value: String) {
        parkDescription = value
    }
    
    func getImageName()->String {
        return imageName
    }
    func setImageName(value: String) {
        imageName = value
    }
    func getImageSize()->String {
        return imageSize
    }
    func setImageSize(value: String) {
        imageSize = value
    }
    func getImageType()->String {
        return imageType
    }
    func setImageType(value: String) {
        imageType = value
    }
}
