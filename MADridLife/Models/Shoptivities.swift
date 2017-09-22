//
//  Shoptivities.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 22/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import Foundation


protocol ShoptivitiesProtocol {
    func count() -> Int
    func add(shoptivity: Shoptivity)
    func get(index: Int) -> Shoptivity
}


class Shoptivities: ShoptivitiesProtocol {
    private var shoptivitiesList: [Shoptivity]?
    
    init(){
        self.shoptivitiesList = []
    }
    
    func count() -> Int {
        return (self.shoptivitiesList?.count)!
    }
    
    func add(shoptivity: Shoptivity) {
        shoptivitiesList?.append(shoptivity)
    }
    
    func get(index: Int) -> Shoptivity {
        return shoptivitiesList![index]
    }
    
    
    
}
