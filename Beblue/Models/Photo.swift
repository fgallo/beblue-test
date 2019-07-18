//
//  Photo.swift
//  Beblue
//
//  Created by Fernando Gallo on 17/07/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation

struct PhotoResponse: Decodable {
    let photos: [Photo]
}

struct Photo {
    let id: Int
    let camera: Camera
    let imageSource: String
}

extension Photo: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case camera
        case imageSource = "img_src"
    }
}
