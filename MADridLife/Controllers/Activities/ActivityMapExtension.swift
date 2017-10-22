//
//  ActivityMapExtension.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 30/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

extension ActivitiesViewController: CLLocationManagerDelegate, MKMapViewDelegate{
    
    func mapInitial(){
        let initialLocation = CLLocation(latitude: 40.437920, longitude: -3.691040)
        let regionRadius: CLLocationDistance = 7500
        let region = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, regionRadius, regionRadius)
        self.mapView.setRegion(region, animated: true)
    }
    
    
    func createPins(){
        self.activitiesList = [ActivityAnnotation]()
        if let activities = fetchedResultsController.fetchedObjects{
            for activity in activities {
                let mapPin: ActivityAnnotation = ActivityAnnotation(activityCD: activity, coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(activity.latitude), longitude: CLLocationDegrees(activity.longitude)))
                self.activitiesList?.append(mapPin)
            }
        }
        self.mapView.addAnnotations(activitiesList!)
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
        performSegue(withIdentifier: "ActivityDetailSegue", sender: (view.annotation as! ActivityAnnotation).activityCD)
    }
    
}
