//
//  ActivitiesVCExtension.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 28/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import UIKit

extension ActivitiesViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell: ActivityCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActivityCell", for: indexPath) as! ActivityCell
        let activityCD: ShoptivityCD = fetchedResultsController.object(at: indexPath)
        cell.refresh(activity: mapShoptivityCDIntoShoptivity(shoptivityCD: activityCD))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let activity: ShoptivityCD = self.fetchedResultsController.object(at: indexPath)
        self.performSegue(withIdentifier: "ActivityDetailSegue", sender: activity)
        
    }
}
