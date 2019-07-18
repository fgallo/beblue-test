//
//  ListPhotosModels.swift
//  Beblue
//
//  Created by Fernando Gallo on 17/07/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

enum ListPhotos {
    
    enum FetchPhotos {
        struct Request {
            var rover: Rovers
        }
        
        struct Response {
            var photos: [Photo]
        }
        
        struct ViewModel {
            struct DisplayedPhoto {
                var imageURL: URL
            }
            var displayedPhotos: [DisplayedPhoto]
        }
    }
    
    enum Rovers: String {
        case curiosity
        case opportunity
        case spirit
        
        func name() -> String {
            switch self {
            case .curiosity:
                return "curiosity"
            case .opportunity:
                return "opportunity"
            case .spirit:
                return "spirit"
            }
        }
    }
    
}
