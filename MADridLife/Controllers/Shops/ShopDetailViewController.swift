//
//  ShopDetailViewController.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 23/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import UIKit
import MapKit

class ShopDetailViewController: UIViewController {

    var shop: Shoptivity!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionView: UITextView!
    @IBOutlet weak var openingHoursLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var shopMapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = shop.name
        self.shop.image.loadImage(into: imageView)
        self.descriptionView.text = shop.description_es
        self.openingHoursLabel.text = shop.openingHours_es
        self.addressLabel.text = shop.address
        
    }

}
