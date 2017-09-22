//
//  Shoptivity.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 22/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import Foundation

public class Shoptivity {
    
    var name: String
    var description: String = ""
    var latitude: Float? = nil
    var longitude: Float? = nil
    var image: String = ""
    var logo: String = ""
    var openingHours: String = ""
    var address: String = ""
    
    init(name: String){
        self.name = name
    }
    
}
