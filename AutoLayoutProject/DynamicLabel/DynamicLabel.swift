//
//  DynamicLabel.swift
//  AutoLayoutProject
//
//  Created by Jyoti1 Yadav on 24/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

import UIKit

class DynamicLabel: UIViewController {
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.text = "Label 1. this is my dynamic label. Enter the amount of text you want......"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        view.addSubview(label)
        addConstraints()

        
    }
    
    func addConstraints(){
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 90))
        //print(constraints)
        constraints.append(label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -90))
        //print(constraints)
        constraints.append(label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 160))
        //print(constraints)
        
        constraints.append(label.heightAnchor.constraint(greaterThanOrEqualToConstant: 45))
        NSLayoutConstraint.activate(constraints)
        
        
        
        
        
        
    }
    

    

}
