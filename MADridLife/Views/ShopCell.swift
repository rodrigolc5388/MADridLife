//
//  ShopCell.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 23/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import UIKit

class ShopCell: UICollectionViewCell {
    
    var shop: Shoptivity?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func refresh(shop: Shoptivity){
        self.shop = shop
        
        self.label.text = shop.name
        /*self.shop?.logo.loadImage(into: imageView)
        UIView.animate(withDuration: 1.0) {
            self.imageView.layer.cornerRadius = 30
        }*/
    }
    
}
