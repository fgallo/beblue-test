//
//  PhotoDetailsInteractorDetailsTests.swift
//  BeblueTests
//
//  Created by Fernando Gallo on 17/07/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

@testable import Beblue
import XCTest

class PhotoDetailsInteractorDetailsTests: XCTestCase {

    // MARK: - Subject under test
    
    var sut: PhotoDetailsInteractor!
    
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupPhotoDetailsInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    // MARK: - Test setup
    
    func setupPhotoDetailsInteractor() {
        sut = PhotoDetailsInteractor()
    }
    
    
    // MARK: - Spies
    
    class PhotoDetailsPresentationLogicSpy: PhotoDetailsPresentationLogic {
        var presentPhotoCalled = false
        
        func presentPhoto(response: PhotoDetails.GetPhoto.Response) {
            presentPhotoCalled = true
        }
    }

    
    // MARK: - Tests
    
    func testGetPhoto() {
        // Given
        let photoDetailsPresentationLogicSpy = PhotoDetailsPresentationLogicSpy()
        sut.presenter = photoDetailsPresentationLogicSpy
        sut.photo = Photo(id: 1, camera: Camera(id: 1, roverId: 1, name: "Test", fullName: "Testing"), imageSource: "")
        
        // When
        let request = PhotoDetails.GetPhoto.Request()
        sut.getPhoto(request: request)
        
        // Then
        XCTAssert(photoDetailsPresentationLogicSpy.presentPhotoCalled, "GetPhoto() should ask presenter to format the photo")
    }

}
