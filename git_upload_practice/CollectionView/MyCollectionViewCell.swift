//
//  MyCollectionViewCell.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 11/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

//NOTE: Cell Definition For Collection View using Nib.
//See class NormalCollectionView.swift for usage of this custom cells.


import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MyCollectionViewCell"
    
    static func nib()-> UINib{
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .link
    }

}
