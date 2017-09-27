//
//  ShopsViewController.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 23/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class ShopsViewController: UIViewController {
 
    var shops: Shoptivities?
    var context: NSManagedObjectContext!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var shopsCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeData()
        
    }
    
    func initializeData(){
        let downloadShoptivitiesInteractor: DownloadShoptivitiesInteractor = DonwloadShoptivitiesInteractorImpl()
        
        downloadShoptivitiesInteractor.execute{ (shops: Shoptivities, activities: Shoptivities) in
            
            self.shops = shops
            self.shopsCV.delegate = self
            self.shopsCV.dataSource = self
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let shop: Shoptivity = (self.shops?.get(index: indexPath.row))!
        self.performSegue(withIdentifier: "ShopDetailSegue", sender: shop)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShopDetailSegue" {
            let vc = segue.destination as! ShopDetailViewController
            vc.shop = sender as! Shoptivity
        }
    }
    
}
