//
//  ActivitiesViewController.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 23/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import UIKit
import MapKit

class ActivitiesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var activities: Shoptivities?
    
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
        
        let cell: ActivityCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCell", for: indexPath) as! ActivityCell
        let activity: Shoptivity = (self.activities?.get(index: indexPath.row))!
        cell.refresh(activity: activity)
        return cell
    }

}
