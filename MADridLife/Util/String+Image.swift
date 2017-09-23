//
//  String+Image.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 23/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import UIKit

extension String {
    func loadImage(into imageView: UIImageView){
        let queue = OperationQueue()
        queue.addOperation {
            if let url = URL(string: self),
                let data = NSData(contentsOf: url),
                let image = UIImage(data: data as Data){
                
                OperationQueue.main.addOperation {
                    imageView.image = image
                }
            }
        }
    }
}
