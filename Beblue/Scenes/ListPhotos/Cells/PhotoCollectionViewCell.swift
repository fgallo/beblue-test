//
//  PhotoCollectionViewCell.swift
//  Beblue
//
//  Created by Fernando Gallo on 17/07/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        photoImageView.layer.cornerRadius = 4.0
        photoImageView.clipsToBounds = true
    }
    
    func configure(item: ListPhotos.FetchPhotos.ViewModel.DisplayedPhoto) {
        photoImageView.kf.indicatorType = .activity
        photoImageView.kf.setImage(with: item.imageURL,
                                   options: [.transition(.fade(1))])
    }

}
