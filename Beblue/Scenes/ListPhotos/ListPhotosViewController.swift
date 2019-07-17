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
    
    private func setupView() {
        title = "Mars Rovers Photos"
    }
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchPhotos()
    }
    
    
    // MARK: - Fetch photos
    
    var displayedPhotos: [ListPhotos.FetchPhotos.ViewModel.DisplayedPhoto] = []
    
    func fetchPhotos() {
        let request = ListPhotos.FetchPhotos.Request(rover: "curiosity", date: "2019-6-3")
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
        collectionView.register(UINib(nibName: String(describing: PhotoCollectionViewCell.self),
                                      bundle: nil), forCellWithReuseIdentifier: "PhotoCell")
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
        let displayedPhoto = displayedPhotos[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCollectionViewCell
        cell.configure(item: displayedPhoto)
        return cell
    }
    
}

extension ListPhotosViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

extension ListPhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 3.0 * 8.0
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize / 2, height: collectionViewSize * 2 / 3)
    }
    
}
