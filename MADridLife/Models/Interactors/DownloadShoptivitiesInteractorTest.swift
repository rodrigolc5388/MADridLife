//
//  DownloadShoptivitiesInteractorTest.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 23/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import Foundation

class DownloadShoptivitiesInteractorTest: DownloadShoptivitiesInteractor {
    
    func execute(onSuccess: @escaping (Shoptivities) -> Void, onError: ((Error) -> Void)?) {
        
        let shoptivities = Shoptivities()
        for i in 0...10{
            let shoptivity =  Shoptivity(name: "Shoptivity \(i)")
            shoptivities.add(shoptivity: shoptivity)
        }
        
        OperationQueue.main.addOperation {
            onSuccess(shoptivities)
        }
    }
    
    func execute(onSuccess: @escaping (Shoptivities) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    
}
