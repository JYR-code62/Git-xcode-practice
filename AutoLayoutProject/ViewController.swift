//
//  ViewController.swift
//  AutoLayoutProject
//
//  Created by Jyoti1 Yadav on 16/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let myView = UIView()
    let myView2 = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        myView.backgroundColor = .link
        myView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myView)
        
        myView2.backgroundColor = .systemRed
        myView2.translatesAutoresizingMaskIntoConstraints = false
        myView.addSubview(myView2)
        
        addConstraints()
    }

    private func addConstraints(){
        var constraints = [NSLayoutConstraint]()
        
        //Add
        constraints.append(myView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(myView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(myView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        
        constraints.append(myView2.widthAnchor.constraint(equalTo: myView.widthAnchor, multiplier: 0.5))
        constraints.append(myView2.heightAnchor.constraint(equalTo: myView.heightAnchor, multiplier: 0.5))
        
        constraints.append(myView2.centerYAnchor.constraint(equalTo: myView.centerYAnchor))
        constraints.append(myView2.centerXAnchor.constraint(equalTo: myView.centerXAnchor))
        //print(constraints)
        //Activate (Applying)
        NSLayoutConstraint.activate(constraints)
    }
}

