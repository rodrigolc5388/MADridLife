//
//  MapShoptivity.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 26/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import Foundation
import CoreData

func mapShoptivityIntoShoptivityCD(context: NSManagedObjectContext, shoptivity: Shoptivity) -> ShoptivityCD{
    
    let shoptivityCD = ShoptivityCD(context: context)
    shoptivityCD.name = shoptivity.name
    shoptivityCD.address = shoptivity.address
    shoptivityCD.description_en = shoptivity.description_en
    shoptivityCD.description_es = shoptivity.description_es
    shoptivityCD.logo = shoptivity.logo
    shoptivityCD.image = shoptivity.image
    shoptivityCD.latitude = shoptivity.latitude ?? 0
    shoptivityCD.longitude = shoptivity.longitude ?? 0
    
    return shoptivityCD
}


func mapShoptivityCDIntoShoptivity(shoptivityCD: ShoptivityCD) -> Shoptivity{
    
    let shoptivity = Shoptivity(name: shoptivityCD.name ?? "Empty")
    shoptivity.address = shoptivityCD.address ?? ""
    shoptivity.description_en = shoptivityCD.description_en ?? ""
    shoptivity.description_es = shoptivityCD.description_es ?? ""
    shoptivity.logo = shoptivityCD.logo ?? ""
    shoptivity.image = shoptivityCD.image ?? ""
    shoptivity.latitude = shoptivityCD.latitude
    shoptivity.longitude = shoptivityCD.longitude
    
    return shoptivity
    
}
