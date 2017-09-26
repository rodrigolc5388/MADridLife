//
//  SaveShoptivitiesInteractor.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 26/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import Foundation
import CoreData

protocol SaveShoptivitiesInteractor {
    
    func execute(shops: Shoptivities, activities: Shoptivities, context: NSManagedObjectContext, onSuccess: @escaping (Shoptivities, Shoptivities) -> Void, onError: ((Error) -> Void)?)
    
    func execute(shops: Shoptivities, activities: Shoptivities, context: NSManagedObjectContext, onSuccess: @escaping (Shoptivities, Shoptivities) -> Void)
}
