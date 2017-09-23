//
//  DownloadShoptivitiesInteractor.swift
//  MADridLife
//
//  Created by Rodrigo Limpias Cossio on 23/9/17.
//  Copyright © 2017 Rodrigo Limpias Cossio. All rights reserved.
//

import Foundation

protocol DownloadShoptivitiesInteractor {
    func execute(onSuccess: @escaping (Shoptivities) -> Void, onError: ((Error) -> Void)?)
    func execute(onSuccess: @escaping (Shoptivities) -> Void)
}
