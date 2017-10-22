//
//  ShopsMapExtension.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 30/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

extension ShopsViewController: CLLocationManagerDelegate, MKMapViewDelegate{
    
    func mapInitial(){
        let initialLocation = CLLocation(latitude: 40.437920, longitude: -3.691040)
        let regionRadius: CLLocationDistance = 7500
        let region = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, regionRadius, regionRadius)
        self.mapView.setRegion(region, animated: true)
    }
    
    
    func createPins(){
        self.shopsList = [ShopAnnotation]()
        if let shops = fetchedResultsController.fetchedObjects{
            for shop in shops {
                    let mapPin: ShopAnnotation = ShopAnnotation(shopCD: shop, coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(shop.latitude), longitude: CLLocationDegrees(shop.longitude)))
                    self.shopsList?.append(mapPin)
            }
        }
        self.mapView.addAnnotations(shopsList!)
    }
    

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKPinAnnotationView? {
        // Don't want to show a custom image if the annotation is the user's location.
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        // Better to make this class property
        let annotationIdentifier = "AnnotationIdentifier"
        
        var annotationView: MKPinAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = (dequeuedAnnotationView as! MKPinAnnotationView)
            annotationView?.annotation = annotation
        }
        else {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        if let annotationView = annotationView {
            // Configure your annotation view here
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "marker")
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        performSegue(withIdentifier: "ShopDetailSegue", sender: (view.annotation as! ShopAnnotation).shopCD)
    }
    
}
