//
//  ActivitiesViewController.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 23/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class ActivitiesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var activities: Shoptivities?
    var context: NSManagedObjectContext!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var activitiesCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeData()
    }
    
    func initializeData(){
        let downloadShoptivitiesInteractor: DownloadShoptivitiesInteractor = DonwloadShoptivitiesInteractorImpl()
        
        downloadShoptivitiesInteractor.execute{ (shops: Shoptivities, activities: Shoptivities) in
            
            self.activities = activities
            self.activitiesCV.delegate = self
            self.activitiesCV.dataSource = self
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.activities?.count())!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: ActivityCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActivityCell", for: indexPath) as! ActivityCell
        let activity: Shoptivity = (self.activities?.get(index: indexPath.row))!
        cell.refresh(activity: activity)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let activity: Shoptivity = (self.activities?.get(index: indexPath.row))!
        self.performSegue(withIdentifier: "ActivityDetailSegue", sender: activity)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ActivityDetailSegue" {
            let vc = segue.destination as! ActivityDetailViewController
            vc.activity = sender as! Shoptivity
        }
    }

}
