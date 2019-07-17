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
    
    var photosWorker = PhotosWorker(photoProvider: NasaProvider)
    var photos: [Photo]?
    
    
    // MARK - Fetch Photos
    
    func fetchPhotos(request: ListPhotos.FetchPhotos.Request) {
        photosWorker.fetchPhotos(rover: request.rover, date: request.date) { photos in
            self.photos = photos
            let response = ListPhotos.FetchPhotos.Response(photos: photos)
            self.presenter?.presentFetchedPhotos(response: response)
        }
    }
    
}
