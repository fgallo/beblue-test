//
//  ListPhotosInteractor.swift
//  Beblue
//
//  Created by Fernando Gallo on 17/07/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

protocol ListPhotosBusinessLogic {
    func fetchPhotos(request: ListPhotos.FetchPhotos.Request)
}

protocol ListPhotosDataStore {
    var photos: [Photo]? { get }
}

class ListPhotosInteractor: ListPhotosBusinessLogic, ListPhotosDataStore {
    
    var presenter: ListPhotosPresentationLogic?
    
    var photosWorker = PhotosWorker(photoProvider: NasaProvider)
    var photos: [Photo]?
    
    var lastCuriosityDate = Date()
    var lastOpportunityDate = Date()
    var lastSpiritDate = Date()
    
    
    // MARK - Fetch photos
    
    func fetchPhotos(request: ListPhotos.FetchPhotos.Request) {
        let date = getDate(rover: request.rover)
        
        photosWorker.fetchPhotos(rover: request.rover.name(), date: date) { photos in
            if photos.count == 0 {
                self.decreaseDate(rover: request.rover)
            }
            
            self.photos = photos
            let response = ListPhotos.FetchPhotos.Response(photos: photos)
            self.presenter?.presentFetchedPhotos(response: response)
        }
    }
    
    
    // MARK: - Helper
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter
    }()
    
    private func getDate(rover: ListPhotos.Rovers) -> String {
        switch rover {
        case .curiosity:
            return dateFormatter.string(from: lastCuriosityDate)
        case .opportunity:
            return dateFormatter.string(from: lastOpportunityDate)
        case .spirit:
            return dateFormatter.string(from: lastSpiritDate)
        }
    }
    
    private func decreaseDate(rover: ListPhotos.Rovers) {
        switch rover {
        case .curiosity:
            lastCuriosityDate = Calendar.current.date(byAdding: .day, value: -1, to: lastCuriosityDate) ?? lastCuriosityDate
        case .opportunity:
            lastOpportunityDate = Calendar.current.date(byAdding: .day, value: -1, to: lastOpportunityDate) ?? lastOpportunityDate
        case .spirit:
            lastSpiritDate = Calendar.current.date(byAdding: .day, value: -1, to: lastSpiritDate) ?? lastSpiritDate
        }
    }
    
}
