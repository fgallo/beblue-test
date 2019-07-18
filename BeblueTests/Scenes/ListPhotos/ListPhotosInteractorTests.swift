//
//  ListPhotosInteractorTests.swift
//  BeblueTests
//
//  Created by Fernando Gallo on 17/07/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

@testable import Beblue
import XCTest

class ListPhotosInteractorTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: ListPhotosInteractor!
    
    
    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()
        setupListPhotosInteractor()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    
    // MARK: - Test setup
    
    func setupListPhotosInteractor() {
        sut = ListPhotosInteractor()
    }
    
    
    // MARK: - Spies
    
    class ListPhotosPresentationLogicSpy: ListPhotosPresentationLogic {
        var presentFetchedPhotosCalled = false
        
        func presentFetchedPhotos(response: ListPhotos.FetchPhotos.Response) {
            presentFetchedPhotosCalled = true
        }
    }
    
    class PhotosWorkerSpy: PhotosWorker {
        var fetchPhotosCalled = false
        
        override func fetchPhotos(rover: String, date: String, completionHandler: @escaping ([Photo]) -> Void) {
            fetchPhotosCalled = true
            completionHandler([])
        }
    }
    
    
    // MARK: - Tests
    
    func testFetchPhotos() {
        // Given
        let listPhotosPresentationLogicSpy = ListPhotosPresentationLogicSpy()
        sut.presenter = listPhotosPresentationLogicSpy
        let photosWorkerSpy = PhotosWorkerSpy(photoProvider: NasaProvider)
        sut.photosWorker = photosWorkerSpy
        
        // When
        let request = ListPhotos.FetchPhotos.Request(rover: ListPhotos.Rovers.curiosity)
        sut.fetchPhotos(request: request)
        
        // Then
        XCTAssert(photosWorkerSpy.fetchPhotosCalled, "FetchPhotos() should ask PhotosWorker to fetch photos")
        XCTAssert(listPhotosPresentationLogicSpy.presentFetchedPhotosCalled, "FetchPhotos() should ask presenter to format photos result")
    }

}
