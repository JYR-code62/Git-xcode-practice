//
//  CustomCollectionViewCell.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 10/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

//NOTE: Custom Cell Definition For Collection View
//See class CollectionViewController.swift for usage of this custom cells.

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        let images = [
            UIImage(systemName: "house"),
            UIImage(systemName: "star"),
            UIImage(systemName: "bell"),
            UIImage(systemName: "person.circle"),
            UIImage(systemName: "gear"),
            UIImage(systemName: "favorites"),
        
        ].compactMap({$0})
        
        imageView.image = images.randomElement()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //imageView.image = nil
    }
}
