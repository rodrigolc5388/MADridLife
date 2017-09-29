//
//  ExecuteOnceInteractorImpl.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 29/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import Foundation

class ExecuteOnceInteractorImpl: ExecuteOnceInteractor{
    func execute(closure: () -> Void) {
        let defaults = UserDefaults.standard
        
        if let _ = defaults.string(forKey: "once"){
            // Already saved
        } else { // First time
            closure()
        }
    }
}
