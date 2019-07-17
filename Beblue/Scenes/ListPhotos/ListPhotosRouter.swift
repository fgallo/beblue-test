//
//  ListPhotosRouter.swift
//  Beblue
//
//  Created by Fernando Gallo on 17/07/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

protocol ListPhotosRoutingLogic {
    func routeToPhotoDetails(segue: UIStoryboardSegue?)
}

class ListPhotosRouter: ListPhotosRoutingLogic {

    weak var viewController: ListPhotosViewController?
    
    // MARK: Routing
    
    func routeToPhotoDetails(segue: UIStoryboardSegue?) {
        
    }
    
}

