//
//  ActivityDetailViewController.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 23/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import UIKit
import MapKit


class ActivityDetailViewController: UIViewController {

    var activity: ShoptivityCD!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionView: UITextView!
    @IBOutlet weak var openingHoursLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var activityMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = activity.name
        self.activity.image?.loadImage(into: imageView)
        self.descriptionView.text = activity.description_es
        self.openingHoursLabel.text = activity.openingHours_es
        self.addressLabel.text = activity.address
        mapInitial()
        
    }
    
    func mapInitial(){
        let initialLocation = CLLocation(latitude: CLLocationDegrees(activity.latitude), longitude: CLLocationDegrees(activity.longitude))
        let regionRadius : CLLocationDistance = 200
        let region = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, regionRadius, regionRadius)
        
        let activityPin = ActivityAnnotation(activityCD: activity, coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(activity.latitude), longitude: CLLocationDegrees(activity.longitude)))
        
        self.activityMapView.setRegion(region, animated: true)
        self.activityMapView.addAnnotation(activityPin)
    }

}
