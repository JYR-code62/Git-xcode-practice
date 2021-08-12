//
//  CustomTableViewCell.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 10/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

//NOTE: Custom Cell Definition
//See class TableViewWithCustomCells.swift for usage of this custom cells.


import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
    private let uiswitch: UISwitch = {
        let uiswitch = UISwitch()
        uiswitch.onTintColor = .blue
        uiswitch.isOn = true
        return uiswitch
    }()
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.text = "Custom Cell"
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
        contentView.addSubview(uiswitch)
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String){
        myLabel.text = text
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.height-6
        
        let switchSize = uiswitch.sizeThatFits(contentView.frame.size)
        
        //uiswitch.frame = CGRect(x: 5, y: 5, width: 100, height: contentView.frame.size.height-10)
        
        uiswitch.frame = CGRect(x: 5,
                                y: (contentView.frame.size.height-switchSize.height)/2,
                                width: switchSize.width,
                                height: switchSize.height)
        
        myLabel.frame = CGRect(x: 10+uiswitch.frame.size.width,
                               y: 0,
                               width: contentView.frame.size.width - 10 - uiswitch.frame.size.width - imageSize,
                               height: contentView.frame.size.height)
        
        myImageView.frame = CGRect(x: contentView.frame.size.width-imageSize-5,
                                   y: 3,
                                   width: imageSize,
                                   height: imageSize)
    }
  

}
