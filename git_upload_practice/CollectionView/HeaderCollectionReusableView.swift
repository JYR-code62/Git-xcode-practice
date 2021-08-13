//
//  HeaderCollectionReusableView.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 11/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//


//NOTE: Header & Footer definition for Collection View.
//See class CollectionViewController.swift & also NormalCollectionView.swift for usage of these cells.


import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
        static let identifier = "HeaderCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Header"
        label.textAlignment = .center
        label.textColor = .white
        return label
        
    }()
   
    public func configure(){
        backgroundColor = .systemGreen
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    
}


class FooterCollectionReusableView: UICollectionReusableView {
        static let identifier = "FooterCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Footer"
        label.textAlignment = .center
        label.textColor = .white
        return label
        
    }()
   
    public func configure(){
        backgroundColor = .systemRed
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    
}
