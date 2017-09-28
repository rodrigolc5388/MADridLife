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
        return 1
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
}
