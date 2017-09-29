//
//  SetExecutedOnceInteractorImpl.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 29/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import Foundation

class SetExecutedOnceInteractorImpl: SetExecutedOnceInteractor{
    func execute() {
        let defaults = UserDefaults.standard
        
        defaults.set("SAVED", forKey: "once")
        
        defaults.synchronize()
    }
}
