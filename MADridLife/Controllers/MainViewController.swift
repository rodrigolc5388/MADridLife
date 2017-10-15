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
    @IBOutlet weak var shopsButton: UIButton!
    @IBOutlet weak var activitiesButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*ExecuteOnceInteractorImpl().execute{
            initializeData()
        }*/
        launchApp()
    }
    
    func launchApp() {
        if reachability() {
            ExecuteOnceInteractorImpl().execute {
                cachingDataUI()
                initializeData()
            }
        } else {
            cachingDataUI()
            notConnectedAlert()
        }
    }
    
    
    func initializeData(){
        let downloadShoptivitiesInteractor: DownloadShoptivitiesInteractor = DonwloadShoptivitiesInteractorImpl()
        
        downloadShoptivitiesInteractor.execute{ (shops: Shoptivities, activities: Shoptivities) in
            
            let cacheInteractor = SaveShoptivitiesInteractorImpl()
            cacheInteractor.execute(shops: shops, activities: activities, context: self.context, onSuccess: { (shops: Shoptivities, activities: Shoptivities) in
                SetExecutedOnceInteractorImpl().execute()
                self.dataReadyUI()
            })
            
        }
    }
    
    func cachingDataUI() {
        self.shopsButton.isHidden = true
        self.activitiesButton.isHidden = true
        self.activityIndicator.startAnimating()
    }
    
    func dataReadyUI(){
        self.shopsButton.isHidden = false
        self.activitiesButton.isHidden = false
        self.activityIndicator.stopAnimating()
        //self.activityIndicator.isHidden = true
    }

    
    func notConnectedAlert() {
        let alert = UIAlertController(title: "There is no internet connection",
                                      message: "Please, close the app, solve the issue and try again.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Understood", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
