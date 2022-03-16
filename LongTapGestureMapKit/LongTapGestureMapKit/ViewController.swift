//
//  ViewController.swift
//  LongTapGestureMapKit
//
//  Created by Aleksandr Morozov on 16.03.2022.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate, MKMapViewDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var myMap: MKMapView!
    
    @IBOutlet weak var textField_Address: UITextField!
    
    var myGeoCoder = CLGeocoder()
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        if (CLLocationManager.locationServicesEnabled()) {
            
            locationManager.requestLocation()
            locationManager.startUpdatingLocation()
        }
        
        textField_Address.delegate = self
        myMap.delegate = self
        
        let oLongTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.handleLongTapGesture(gestureRecognizer:)))
        
        self.myMap.addGestureRecognizer(oLongTapGesture)
    }
    
    @objc func handleLongTapGesture(gestureRecognizer: UILongPressGestureRecognizer) {
        
        if gestureRecognizer.state != UIGestureRecognizer.State.ended {
            
            let touchLocation = gestureRecognizer.location(in: myMap)
            let locationCoordinate = myMap.convert(touchLocation, toCoordinateFrom: myMap)
            
            print("Tapped at Latitude: \(locationCoordinate.latitude), Longitude: \(locationCoordinate.longitude)")
            
            let myPin = MKPointAnnotation()
            myPin.coordinate = locationCoordinate
            
            myPin.title = "Latitude: \(locationCoordinate.latitude), Longitude: \(locationCoordinate.longitude)"
            
            myMap.addAnnotation(myPin)
        }
        
        if gestureRecognizer.state != UIGestureRecognizer.State.began {
            
            return
        }
    }
    
    @IBAction func button_DirectionAction(_ sender: Any) {
        myGeoCoder.geocodeAddressString(textField_Address.text ?? ""){(placemark, error) in
            self.processResponse(withPlacemarks: placemark, error: error)
        }
    }
    
    func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
        if let error = error {
            print("Error fetching coordinates (\(error)")
        } else {
            
            var location: CLLocation?
            
            if let placemarks = placemarks, placemarks.count > 0 {
                location = placemarks.first?.location
            }
            
            if let location = location {
                
                let coordinate = location.coordinate
                
                let request = MKDirections.Request()
                request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0)))
                request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude), addressDictionary: nil))
                request.transportType = .any
                request.requestsAlternateRoutes = true
                
                let directions = MKDirections(request: request)
                
                directions.calculate{response, error in
                    guard let directionsResponse = response else {return}
                    
                    for route in directionsResponse.routes {
                        self.myMap.addOverlay(route.polyline)
                        self.myMap.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                    }
                }
                
                let myPin = MKPointAnnotation()
                myPin.coordinate = coordinate
                
                myPin.title = textField_Address.text
                
                myMap.addAnnotation(myPin)
            }
        }
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor = .blue
        renderer.lineWidth = 4.0
        renderer.alpha = 1.0
        return renderer
    }
    
   
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let userLocation = locations.first {
            
            manager.stopUpdatingLocation()
            
            let coordinates = CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0)
            let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
            let region = MKCoordinateRegion(center: coordinates, span: span)
            
            myMap.setRegion(region, animated: true)
            
            let myPin = MKPointAnnotation()
            myPin.coordinate = coordinates
            myPin.title = "Hello There!"
            myPin.subtitle = "I'm Here!"
            
            myMap.addAnnotation(myPin)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("error:: \(error.localizedDescription)")
       }
}
