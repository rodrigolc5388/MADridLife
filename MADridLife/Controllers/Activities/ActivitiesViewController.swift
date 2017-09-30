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
import CoreLocation

class ActivitiesViewController: UIViewController {

    var context: NSManagedObjectContext!
    let locationManager = CLLocationManager()
    var activitiesList: [ActivityAnnotation]?
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var activitiesCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.activitiesCV.delegate = self
        self.activitiesCV.dataSource = self
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ActivityDetailSegue" {
            let vc = segue.destination as! ActivityDetailViewController
            let activityCD = sender as! ShoptivityCD
            vc.activity = mapShoptivityCDIntoShoptivity(shoptivityCD: activityCD)
        }
    }
    
    
    // MARK: - Fetched results controller
    
    var _fetchedResultsController: NSFetchedResultsController<ShoptivityCD>? = nil
    
    var fetchedResultsController: NSFetchedResultsController<ShoptivityCD> {
        if (_fetchedResultsController != nil) {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<ShoptivityCD> = ShoptivityCD.fetchRequest()
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        fetchRequest.predicate = NSPredicate(format: "typeEntity == %@", "activity")
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        _fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.context!, sectionNameKeyPath: nil, cacheName: "ActivitiesCacheFile")
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }

}
