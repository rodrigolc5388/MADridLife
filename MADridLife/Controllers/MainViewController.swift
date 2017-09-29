//
//  MainViewController.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 23/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {

    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeData()

    }
    
    func initializeData(){
        let downloadShoptivitiesInteractor: DownloadShoptivitiesInteractor = DonwloadShoptivitiesInteractorImpl()
        
        downloadShoptivitiesInteractor.execute{ (shops: Shoptivities, activities: Shoptivities) in
            
            let cacheInteractor = SaveShoptivitiesInteractorImpl()
            cacheInteractor.execute(shops: shops, activities: activities, context: self.context, onSuccess: { (shops: Shoptivities, activities: Shoptivities) in
            })
            
        }
    }

    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopsSegue"{
            let svc = segue.destination as! ShopsViewController
            svc.context = self.context
        }
        
        if segue.identifier == "ShowActivitiesSegue"{
            let avc = segue.destination as! ActivitiesViewController
            avc.context = self.context
        }
    }
}
