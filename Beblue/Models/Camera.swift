//
//  Camera.swift
//  Beblue
//
//  Created by Fernando Gallo on 17/07/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation

struct Camera {
    let id: Int
    let roverId: Int
    let name: String
    let fullName: String
}

extension Camera: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case roverId = "rover_id"
        case name
        case fullName = "full_name"
    }
}
