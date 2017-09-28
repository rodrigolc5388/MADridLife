//
//  SaveShoptivitiesInteractorImpl.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 27/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import Foundation
import CoreData

class SaveShoptivitiesInteractorImpl: SaveShoptivitiesInteractor {
    func execute(shops: Shoptivities, activities: Shoptivities, context: NSManagedObjectContext, onSuccess: @escaping (Shoptivities, Shoptivities) -> Void, onError: ((Error) -> Void)?) {
        
        for i in 0..<shops.count(){
            let shop = shops.get(index: i)
            let _ = mapShoptivityIntoShoptivityCD(context: context, shoptivity: shop)
        }
        
        for i in 0..<activities.count(){
            let activity = activities.get(index: i)
            let _ = mapShoptivityIntoShoptivityCD(context: context, shoptivity: activity)
        }
        
        do{
            try context.save()
            onSuccess(shops, activities)
        } catch {
            // onError(nil)
        }
        
    }
        
    
    func execute(shops: Shoptivities, activities: Shoptivities, context: NSManagedObjectContext, onSuccess: @escaping (Shoptivities, Shoptivities) -> Void) {
        execute(shops: shops, activities: activities, context: context, onSuccess: onSuccess, onError: nil)
    }
}
    


