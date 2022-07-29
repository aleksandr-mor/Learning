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
    
    @IBOutlet weak var mapView: MKMapView!
    
    //Coordinates of Dresden, Germany
    let carCoordinate = CLLocationCoordinate2D(latitude: 51.04, longitude: 13.737524)
    let chargerCoordinate = CLLocationCoordinate2D(latitude: 51.05, longitude: 13.737520)
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.setRegion(MKCoordinateRegion(center: carCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)), animated: false)
        mapView.delegate = self
        addFreeChargerPin()
        addChargerPin()
        self.locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
               locationManager.desiredAccuracy = kCLLocationAccuracyBest
               locationManager.startUpdatingLocation()
           }
    }

    @IBAction func currentLocationButtonAction(_ sender: UIButton) {
        let locValue:CLLocationCoordinate2D = locationManager.location!.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
         let region = MKCoordinateRegion(center: locValue, span: span)
         mapView.setRegion(region, animated: true)
    }
    
    private func addFreeChargerPin() {
        let pin = MKPointAnnotation()
        pin.coordinate = carCoordinate
        mapView.addAnnotation(pin)
    }
    
    private func addChargerPin() {
        let pin = MKPointAnnotation()
        pin.coordinate = chargerCoordinate
        mapView.addAnnotation(pin)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }

        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
        
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

extension ViewController: MKMapViewDelegate {

       func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView){
           let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
           self.navigationController?.pushViewController(vc!, animated: true)
       }
}

