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
    var reachability: Reachability!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        /*NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged), name: .reachabilityChanged, object: reachability)
        do{
            try reachability.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }*/
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ExecuteOnceInteractorImpl().execute{
            initializeData()
        }

    }
    
    
    func initializeData(){
        let downloadShoptivitiesInteractor: DownloadShoptivitiesInteractor = DonwloadShoptivitiesInteractorImpl()
        
        downloadShoptivitiesInteractor.execute{ (shops: Shoptivities, activities: Shoptivities) in
            
            let cacheInteractor = SaveShoptivitiesInteractorImpl()
            cacheInteractor.execute(shops: shops, activities: activities, context: self.context, onSuccess: { (shops: Shoptivities, activities: Shoptivities) in
                SetExecutedOnceInteractorImpl().execute()
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
    
    
    @objc func reachabilityChanged(note: Notification) {
        
        let reachability = note.object as! Reachability
        
        switch reachability.connection {
        case .wifi:
            print("Reachable via WiFi")
        case .cellular:
            print("Reachable via Cellular")
        case .none:
            print("Network not reachable")
        }
    }
}
