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
    var description_en: String = ""
    var description_es: String = ""
    var latitude: Float? = nil
    var longitude: Float? = nil
    var image: String = ""
    var logo: String = ""
    var openingHours_en: String = ""
    var openingHours_es: String = ""
    var address: String = ""
    var type: String = ""
    
    init(name: String){
        self.name = name
    }
    
}
