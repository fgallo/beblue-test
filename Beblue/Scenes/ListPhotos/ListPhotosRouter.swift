//
//  ListPhotosRouter.swift
//  Beblue
//
//  Created by Fernando Gallo on 17/07/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

@objc protocol ListPhotosRoutingLogic {
    func routeToPhotoDetails(segue: UIStoryboardSegue?)
}

protocol ListPhotosDataPassing {
    var dataStore: ListPhotosDataStore? { get }
}

class ListPhotosRouter: NSObject, ListPhotosRoutingLogic, ListPhotosDataPassing {

    weak var viewController: ListPhotosViewController?
    var dataStore: ListPhotosDataStore?
    
    // MARK: Routing
    
    func routeToPhotoDetails(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! PhotoDetailsViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToPhotoDetails(source: dataStore!, destination: &destinationDS)
        } else {
            let destinationVC = viewController?.storyboard?.instantiateViewController(withIdentifier: "PhotoDetailsViewController") as! PhotoDetailsViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToPhotoDetails(source: dataStore!, destination: &destinationDS)
            navigateToPhotoDetails(source: viewController!, destination: destinationVC)
        }
    }
    
    
    // MARK: Navigation
    
    func navigateToPhotoDetails(source: ListPhotosViewController, destination: PhotoDetailsViewController) {
        source.show(destination, sender: nil)
    }
 
    
    // MARK: Data
    
    func passDataToPhotoDetails(source: ListPhotosDataStore, destination: inout PhotoDetailsDataStore) {
        let selectedRow = viewController?.collectionView.indexPathsForSelectedItems?.first?.row
        destination.photo = source.photos?[selectedRow!]
    }

}

