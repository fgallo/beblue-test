//
//  PhotoDetailsPresenter.swift
//  Beblue
//
//  Created by Fernando Gallo on 17/07/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

protocol PhotoDetailsPresentationLogic {
    func presentPhoto(response: PhotoDetails.GetPhoto.Response)
}

class PhotoDetailsPresenter: PhotoDetailsPresentationLogic {
    
    weak var viewController: PhotoDetailsDisplayLogic?
    
    private var fullName: Bool = false
    
    // MARK: - Get photo
    
    func presentPhoto(response: PhotoDetails.GetPhoto.Response) {
        let photo = response.photo
        
        let name = fullName ? photo.camera.fullName : photo.camera.name
        fullName = !fullName
        
        let imageURL = URL(string: photo.imageSource)
        
        let displayedPhoto = PhotoDetails.GetPhoto.ViewModel.DisplayedPhoto(name: name, imageURL: imageURL)
        
        let viewModel = PhotoDetails.GetPhoto.ViewModel(displayedPhoto: displayedPhoto)
        viewController?.displayPhoto(viewModel: viewModel)
    }

}
