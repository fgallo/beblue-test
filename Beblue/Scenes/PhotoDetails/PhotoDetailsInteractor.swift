//
//  PhotoDetailsInteractor.swift
//  Beblue
//
//  Created by Fernando Gallo on 17/07/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

protocol PhotoDetailsBusinessLogic {
    func getPhoto(request: PhotoDetails.GetPhoto.Request)
}

protocol PhotoDetailsDataStore {
    var photo: Photo! { get set }
}

class PhotoDetailsInteractor: PhotoDetailsBusinessLogic, PhotoDetailsDataStore {
    
    var presenter: PhotoDetailsPresentationLogic?
    
    var photo: Photo!
    
    
    // MARK: - Get photo
    
    func getPhoto(request: PhotoDetails.GetPhoto.Request) {
        let response = PhotoDetails.GetPhoto.Response(photo: photo)
        presenter?.presentPhoto(response: response)
    }
    
}
