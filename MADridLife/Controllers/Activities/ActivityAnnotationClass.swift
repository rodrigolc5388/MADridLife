//
//  ActivityAnnotationClass.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 30/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ActivityAnnotation: NSObject, MKAnnotation {
    let title: String?
    let address: String?
    let logo: String?
    let coordinate: CLLocationCoordinate2D
    let activityCD: ShoptivityCD
    
    init(activityCD: ShoptivityCD, coordinate: CLLocationCoordinate2D){
        self.title = activityCD.name
        self.address = activityCD.address
        self.logo = activityCD.logo
        self.coordinate = coordinate
        self.activityCD = activityCD
    }
    
    var subtitle: String? {
        return address
    }
    
    var imageName: String? {
        return logo
    }
}



class ActivityAnnotationMarkerView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            
            guard let activityAnnotation = newValue as? ActivityAnnotation else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            
            let logoButton = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width:30, height: 30)))
            logoButton.setBackgroundImage(activityAnnotation.logo?.getImage(), for: UIControlState())
            rightCalloutAccessoryView = logoButton
            
            //glyphImage = shopAnnotation.logo?.getImage()
        }
    }
}























