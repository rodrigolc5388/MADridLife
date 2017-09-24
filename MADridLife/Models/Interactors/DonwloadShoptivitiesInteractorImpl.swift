//
//  DonwloadShoptivitiesInteractorImpl.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 23/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import Foundation

class DonwloadShoptivitiesInteractorImpl: DownloadShoptivitiesInteractor{
    
    func execute(onSuccess: @escaping (Shoptivities, Shoptivities) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Shoptivities, Shoptivities) -> Void, onError: ((Error) -> Void)?) {
        
        let shopsUrlString = "https://madrid-shops.com/json_new/getShops.php"
        let activitiesUrlString = "http://madrid-shops.com/json_new/getActivities.php"
        
        let queue = OperationQueue()
        queue.addOperation {
            if let urlShops = URL(string: shopsUrlString), let dataShops = NSData(contentsOf: urlShops) as Data?,
                let urlActivities = URL(string: activitiesUrlString), let dataActivities = NSData(contentsOf: urlActivities) as Data? {
                
                let shops = parseShops(data: dataShops)
                let activities = parseActivities(data: dataActivities)
                
                OperationQueue.main.addOperation {
                    onSuccess(shops, activities)
                }
            }
        }
    }
}
