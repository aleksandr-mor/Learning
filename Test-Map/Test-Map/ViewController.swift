//
//  ViewController.swift
//  Test-Map
//
//  Created by Aleksandr Morozov on 28.07.2022.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    let map = MKMapView()
    
    //Coordinates of Dresden, Germany
    let carCoordinate = CLLocationCoordinate2D(latitude: 51.04, longitude: 13.737524)
    let chargerCoordinate = CLLocationCoordinate2D(latitude: 51.05, longitude: 13.737520)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(map)
        map.frame = view.bounds
        map.setRegion(MKCoordinateRegion(center: carCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)), animated: false)
        
        map.delegate = self
        
        addFreeChargerPin()
        addChargerPin()
        
    }

    private func addFreeChargerPin() {
        let pin = MKPointAnnotation()
        pin.coordinate = carCoordinate
        pin.title = "Electric Charger"
        pin.subtitle = "Free!"
        map.addAnnotation(pin)
    }
    
    private func addChargerPin() {
        let pin = MKPointAnnotation()
        pin.coordinate = chargerCoordinate
        pin.title = "Electric Charger"
        pin.subtitle = "30% Sale"
        map.addAnnotation(pin)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        var annotationView = map.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        annotationView?.image = UIImage(named: "charger")
        return annotationView
    }
}

extension ViewController : MKMapViewDelegate {

       func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView){
          print("didSelectAnnotationTapped")
       }
}
