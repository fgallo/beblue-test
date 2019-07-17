//
//  ListPhotosInteractor.swift
//  Beblue
//
//  Created by Fernando Gallo on 17/07/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

protocol ListPhotosBusinessLogic {
    func fetchPhotos(request: ListPhotos.FetchPhotos.Request)
}

class ListPhotosInteractor: ListPhotosBusinessLogic {
    var presenter: ListPhotosPresentationLogic?
    
    // MARK - Fetch Photos
    
    func fetchPhotos(request: ListPhotos.FetchPhotos.Request) {
        
    }
    
}
