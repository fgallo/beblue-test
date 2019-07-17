//
//  ListPhotosViewController.swift
//  Beblue
//
//  Created by Fernando Gallo on 17/07/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

protocol ListPhotosDisplayLogic: class {
    func displayFetchedPhotos(viewModel: ListPhotos.FetchPhotos.ViewModel)
}

class ListPhotosViewController: UIViewController, ListPhotosDisplayLogic {
    
    var interactor: ListPhotosBusinessLogic?
    var router: ListPhotosRoutingLogic?
    
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
        let interactor = ListPhotosInteractor()
        let presenter = ListPhotosPresenter()
        let router = ListPhotosRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchPhotos()
    }
    
    
    // MARK: - Fetch photos
    
    var displayedPhotos: [ListPhotos.FetchPhotos.ViewModel.DisplayedPhoto] = []
    
    func fetchPhotos() {
        let request = ListPhotos.FetchPhotos.Request()
        interactor?.fetchPhotos(request: request)
    }
    
    func displayFetchedPhotos(viewModel: ListPhotos.FetchPhotos.ViewModel) {
        displayedPhotos = viewModel.displayedPhotos
        collectionView.reloadData()
    }
    
    
    // MARK: - UICollectionView setup

    @IBOutlet weak var collectionView: UICollectionView!
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}


// MARK: - UICollectionView DataSource and Delegate

extension ListPhotosViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}

extension ListPhotosViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}
