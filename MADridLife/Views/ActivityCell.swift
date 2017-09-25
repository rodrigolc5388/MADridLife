//
//  ActivityCell.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 23/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import UIKit

class ActivityCell: UICollectionViewCell {
 
    var activity: Shoptivity?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func refresh(activity: Shoptivity){
        self.activity = activity
        
        self.label.text = activity.name
        self.activity?.logo.loadImage(into: imageView)
        UIView.animate(withDuration: 1.0) {
            self.imageView.layer.cornerRadius = 30
        }
    }
    
}
