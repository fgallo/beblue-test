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
            var rover: String
            var date: String
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
    
}
