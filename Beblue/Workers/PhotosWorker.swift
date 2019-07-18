//
//  PhotosWorker.swift
//  Beblue
//
//  Created by Fernando Gallo on 17/07/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation
import Moya

class PhotosWorker {
    
    let photoProvider: MoyaProvider<NasaAPI>
    
    init(photoProvider: MoyaProvider<NasaAPI>) {
        self.photoProvider = photoProvider
    }
    
    func fetchPhotos(rover: String, date: String, completionHandler: @escaping ([Photo]) -> Void) {
        photoProvider.request(.getPhotos(rover: rover, date: date)) { result in
            switch result {
            case .success(let response):
                do {
                    let photosResponse = try JSONDecoder().decode(PhotoResponse.self, from: response.data)
                    DispatchQueue.main.async {
                        completionHandler(photosResponse.photos)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completionHandler([])
                    }
                }
                
            case .failure:
                DispatchQueue.main.async {
                    completionHandler([])
                }
            }
        }
    }
    
}
