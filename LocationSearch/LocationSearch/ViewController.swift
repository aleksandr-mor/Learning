//
//  ViewController.swift
//  LocationSearch
//
//  Created by Aleksandr Morozov on 24.06.2022.
//

import UIKit
import MapKit
import FloatingPanel

class ViewController: UIViewController {

    let mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        
        let panel = FloatingPanelController()
        panel.set(contentViewController: SearchViewController())
        panel.addPanel(toParent: self)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = view.bounds
        title = "Uber"
    }

}

