//
//  ViewController.swift
//  NPF-3
//
//  Created by Will on 11/8/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var MapView: MKMapView!
    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!
    
    @IBAction func refresh(_ sender: AnyObject) {
        startUpdating()
    }
    
    @IBOutlet weak var MapControl: UISegmentedControl!
    
    @IBAction func MapControlAction(_ sender: AnyObject) {
        if(MapControl.selectedSegmentIndex == 0) {
            MapView.mapType = MKMapType.standard
        }
        else if(MapControl.selectedSegmentIndex == 1) {
            MapView.mapType = MKMapType.satellite
        }
        else if(MapControl.selectedSegmentIndex == 2) {
            MapView.mapType = MKMapType.hybrid
        }
    }
    var locationManager: CLLocationManager! = nil
    
    var placeList = Places()
    var places : [Park] {
        get {
            return self.placeList.placeList
        }
        set(val) {
            self.placeList.placeList = val
        }
    }
    
    func startUpdating() {
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdating() {
        locationManager.stopUpdatingLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for place: Park in places {
            MapView.addAnnotation(place)
        }
        //let np = NorthPole()
        //mapView.addAnnotation(np)
        //mapView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - MKMapViewDelegate Methods
    
    // This delegate method is called once for every annotation that is created.
    // If no view is returned by this method, then only the default pin is seen by the user
    func mapView(_ mv: MKMapView, viewFor  annotation: MKAnnotation!) -> MKAnnotationView? {
        var view: MKPinAnnotationView
        let identifier = "Pin"
        
        if annotation is MKUserLocation {
            //if annotation is not an MKPointAnnotation (eg. MKUserLocation),
            //return nil so map draws default view for it (eg. blue dot)...
            return nil
        }
        if annotation !== mv.userLocation   {
            //look for an existing view to reuse
            if let dequeuedView = mv.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.pinTintColor = MKPinAnnotationView.purplePinColor()
                view.animatesDrop = true
                view.canShowCallout = true
                //view.calloutOffset = CGPoint(x: -5, y: 5)
                let leftButton = UIButton(type: .infoLight)
                let rightButton = UIButton(type: .detailDisclosure)
                leftButton.tag = 0
                rightButton.tag = 1
                view.leftCalloutAccessoryView = leftButton
                view.rightCalloutAccessoryView = rightButton
            }
            return view
        }
        
        return nil
    }
    
    func mapView(_ mv: MKMapView, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        
        let parkAnnotation = view.annotation as! Park
        switch control.tag {
        case 0: //left button
            if let url = URL(string: parkAnnotation.getLink()){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)                }
        case 1: //right button
            let coordinate = locationManager.location?.coordinate //make sure location manager has updated before trying to use
            let url = String(format: "http://maps.apple.com/maps?saddr=%f,%f&daddr=%f,%f", (coordinate?.latitude)!,(coordinate?.longitude)!,parkAnnotation.getLocation().coordinate.latitude,parkAnnotation.getLocation().coordinate.longitude)
            UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
        default:
            break
        }
    }

}

