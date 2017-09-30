//
//  ShopAnnotationClass.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 30/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ShopAnnotation: NSObject, MKAnnotation {
    let title: String?
    let address: String?
    let logo: String?
    let coordinate: CLLocationCoordinate2D
    let shopCD: ShoptivityCD
    
    init(shopCD: ShoptivityCD, coordinate: CLLocationCoordinate2D){
        self.title = shopCD.name
        self.address = shopCD.address
        self.logo = shopCD.logo
        self.coordinate = coordinate
        self.shopCD = shopCD
    }
    
    var subtitle: String? {
        return address
    }
    
    var imageName: String? {
        return logo
    }
}



class AnnotationMarkerView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            
            guard let shopAnnotation = newValue as? ShopAnnotation else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            
            let logoButton = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width:30, height: 30)))
            logoButton.setBackgroundImage(shopAnnotation.logo?.getImage(), for: UIControlState())
            rightCalloutAccessoryView = logoButton
            
            //glyphImage = shopAnnotation.logo?.getImage()
        }
    }
}








