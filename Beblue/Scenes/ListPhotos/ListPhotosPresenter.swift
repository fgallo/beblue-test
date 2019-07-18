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
        var displayedPhotos: [ListPhotos.FetchPhotos.ViewModel.DisplayedPhoto] = []
        for photo in response.photos {
            if let url = URL(string: photo.imageSource) {
                let displayedPhoto = ListPhotos.FetchPhotos.ViewModel.DisplayedPhoto(imageURL: url)
                displayedPhotos.append(displayedPhoto)
            }
        }
        let viewModel = ListPhotos.FetchPhotos.ViewModel(displayedPhotos: displayedPhotos)
        viewController?.displayFetchedPhotos(viewModel: viewModel)
    }
    
}
