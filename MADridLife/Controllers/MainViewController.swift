//
//  MainViewController.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 23/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import UIKit
import CoreData
import ALLoadingView


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
        
        self.activityIndicator.isHidden = true
        self.launchApp()
    }
    
    func launchApp(){
        ExecuteOnceInteractorImpl().execute(closure: {
            if reachability() == true {
                ALLoadingView.manager.showLoadingView(ofType: .messageWithIndicator, windowMode: .fullscreen)
                //self.activityIndicator.isHidden = false
                //self.activityIndicator.startAnimating()
                self.shopsButton.isHidden = true
                self.activitiesButton.isHidden = true
                self.initializeData()
            } else {
                //self.activityIndicator.isHidden = true
                self.shopsButton.isHidden = true
                self.activitiesButton.isHidden = true
                self.notConnectedAlert()
            }
        })
    }
    
    
    func initializeData(){
        let downloadShoptivitiesInteractor: DownloadShoptivitiesInteractor = DonwloadShoptivitiesInteractorImpl()
        
        downloadShoptivitiesInteractor.execute{ (shops: Shoptivities, activities: Shoptivities) in
            
            let cacheInteractor = SaveShoptivitiesInteractorImpl()
            cacheInteractor.execute(shops: shops, activities: activities, context: self.context, onSuccess: { (shops: Shoptivities, activities: Shoptivities) in
                SetExecutedOnceInteractorImpl().execute()
                //self.activityIndicator.isHidden = true
               // self.activityIndicator.stopAnimating()
                self.shopsButton.isHidden = false
                self.activitiesButton.isHidden = false
                ALLoadingView.manager.hideLoadingView(withDelay: 3.0)
            })
            
        }
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
