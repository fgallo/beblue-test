//
//  PhotoDetailsModels.swift
//  Beblue
//
//  Created by Fernando Gallo on 17/07/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

enum PhotoDetails {
    
    enum GetPhoto {
        struct Request {
        }
        
        struct Response {
            var photo: Photo
        }
        
        struct ViewModel {
            struct DisplayedPhoto {
                var name: String
                var imageURL: URL?
            }
            var displayedPhoto: DisplayedPhoto
        }
    }
    
}
