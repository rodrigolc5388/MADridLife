//
//  ShopCell.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 23/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import UIKit
import SDWebImage

class ShopCell: UICollectionViewCell {
    
    var shop: Shoptivity?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func refresh(shop: Shoptivity){
        self.shop = shop
        self.label.text = shop.name
        self.imageView.sd_setImage(with: URL(string: shop.logo))
        //self.shop?.logo.loadImage(into: imageView)
    }
}
