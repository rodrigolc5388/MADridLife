//
//  ActivityCell.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 23/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import UIKit
import SDWebImage

class ActivityCell: UICollectionViewCell {
 
    var activity: Shoptivity?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func refresh(activity: Shoptivity){
        self.activity = activity
        self.label.text = activity.name
        self.imageView.sd_setImage(with: URL(string: activity.logo))
    }
    
}
