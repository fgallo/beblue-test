//
//  PhotoDetailsRouter.swift
//  Beblue
//
//  Created by Fernando Gallo on 17/07/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

protocol PhotoDetailsRoutingLogic {
}

protocol PhotoDetailsDataPassing {
    var dataStore: PhotoDetailsDataStore? { get }
}

class PhotoDetailsRouter: NSObject, PhotoDetailsRoutingLogic, PhotoDetailsDataPassing {
    
    weak var viewController: PhotoDetailsViewController?
    var dataStore: PhotoDetailsDataStore?
    
}
