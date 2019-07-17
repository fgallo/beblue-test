//
//  PhotoDetailsViewController.swift
//  Beblue
//
//  Created by Fernando Gallo on 17/07/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

protocol PhotoDetailsDisplayLogic: class {
    func displayPhoto(viewModel: PhotoDetails.GetPhoto.ViewModel)
}

class PhotoDetailsViewController: UIViewController, PhotoDetailsDisplayLogic {
    
    var interactor: PhotoDetailsBusinessLogic?
    var router: (NSObjectProtocol & PhotoDetailsRoutingLogic & PhotoDetailsDataPassing)?
    
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = PhotoDetailsInteractor()
        let presenter = PhotoDetailsPresenter()
        let router = PhotoDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private func setupView() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(nameLabelTapped))
        nameLabel.addGestureRecognizer(tapGestureRecognizer)
        nameLabel.isUserInteractionEnabled = true
    }
    
    
    // MARK: Actions
    
    @objc func nameLabelTapped() {
        getPhoto()
    }
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPhoto()
    }
    
    
    // MARK: - Get photo
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    func getPhoto() {
        let request = PhotoDetails.GetPhoto.Request()
        interactor?.getPhoto(request: request)
    }
    
    func displayPhoto(viewModel: PhotoDetails.GetPhoto.ViewModel) {
        let displayedPhoto = viewModel.displayedPhoto
        nameLabel.text = displayedPhoto.name
        
        if photoImageView.image == nil {
            photoImageView.kf.indicatorType = .activity
            photoImageView.kf.setImage(with: displayedPhoto.imageURL,
                                       options: [.transition(.fade(1)), .cacheOriginalImage])
        }
    }
    
}
