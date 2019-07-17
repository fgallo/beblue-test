//
//  ListPhotosPresenter.swift
//  Beblue
//
//  Created by Fernando Gallo on 17/07/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

protocol ListPhotosPresentationLogic {
    func presentFetchedPhotos(response: ListPhotos.FetchPhotos.Response)
}

class ListPhotosPresenter: ListPhotosPresentationLogic {
    
    weak var viewController: ListPhotosDisplayLogic?
    
    // MARK: - Fetch photos
    
    func presentFetchedPhotos(response: ListPhotos.FetchPhotos.Response) {
        
    }
    
}
