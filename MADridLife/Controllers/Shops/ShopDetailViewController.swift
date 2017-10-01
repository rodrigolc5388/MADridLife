//
//  ShopDetailViewController.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 23/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import UIKit
import MapKit
import SDWebImage


class ShopDetailViewController: UIViewController {

    var shop: ShoptivityCD!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionView: UITextView!
    @IBOutlet weak var openingHoursLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var shopMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = shop.name
        //self.shop.image?.loadImage(into: imageView)
        self.imageView.sd_setImage(with: URL(string:shop.image!))
        self.descriptionView.text = shop.description_es
        self.openingHoursLabel.text = shop.openingHours_es
        self.addressLabel.text = shop.address
        mapInitial()
        
    }

    func mapInitial(){
        let initialLocation = CLLocation(latitude: CLLocationDegrees(shop.latitude), longitude: CLLocationDegrees(shop.longitude))
        let regionRadius : CLLocationDistance = 200
        let region = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, regionRadius, regionRadius)

        let shopPin = ShopAnnotation(shopCD: shop, coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(shop.latitude), longitude: CLLocationDegrees(shop.longitude)))
        
        self.shopMapView.setRegion(region, animated: true)
        self.shopMapView.addAnnotation(shopPin)
    }
    
}
