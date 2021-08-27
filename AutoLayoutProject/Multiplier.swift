//
//  Multiplier.swift
//  AutoLayoutProject
//
//  Created by Jyoti1 Yadav on 24/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

import UIKit

class Multiplier: UIViewController {
    
    let view1 = UIView()
    
    let view2 = UIView()
    let view3 = UIView()
    let view4 = UIView()
    let view5 = UIView()
    let view6 = UIView()
    
    let view7 = UIView()
    let view8 = UIView()
    
    let view9 = UIView()
    let view10 = UIView()
    
    let view11 = UIView()
    let view12 = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1.backgroundColor = .gray
        view1.translatesAutoresizingMaskIntoConstraints = false
        
        
        view2.backgroundColor = .systemTeal
        view2.translatesAutoresizingMaskIntoConstraints = false
        
        
        view3.backgroundColor = .systemRed
        view3.translatesAutoresizingMaskIntoConstraints = false
        
        view4.backgroundColor = .systemPurple
        view4.translatesAutoresizingMaskIntoConstraints = false
        
        view5.backgroundColor = .systemGray6
        view5.translatesAutoresizingMaskIntoConstraints = false
        
        view6.backgroundColor = .systemIndigo
        view6.translatesAutoresizingMaskIntoConstraints = false
        
        view7.backgroundColor = .cyan
        view7.translatesAutoresizingMaskIntoConstraints = false
        
        view8.backgroundColor = .yellow
        view8.translatesAutoresizingMaskIntoConstraints = false
        
        view9.backgroundColor = .brown
        view9.translatesAutoresizingMaskIntoConstraints = false
        
        view10.backgroundColor = .orange
        view10.translatesAutoresizingMaskIntoConstraints = false
        
        view11.backgroundColor = .systemGreen
        view11.translatesAutoresizingMaskIntoConstraints = false
        
        view12.backgroundColor = .systemPink
        view12.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(view1)
        view1.addSubview(view2)
        view1.addSubview(view3)
        view1.addSubview(view4)
        view1.addSubview(view5)
        view1.addSubview(view6)
        
        view2.addSubview(view7)
        view2.addSubview(view8)
        view8.addSubview(view9)
        view8.addSubview(view10)
        
        view3.addSubview(view11)
        view3.addSubview(view12)
        
        addConstraints()
        

       
    }
    
    func addConstraints(){
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(view1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(view1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(view1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        
        
        constraints.append(view2.topAnchor.constraint(equalTo: view1.safeAreaLayoutGuide.topAnchor))
        constraints.append(view2.leadingAnchor.constraint(equalTo: view1.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(view2.trailingAnchor.constraint(equalTo: view1.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(view2.heightAnchor.constraint(equalTo: view1.heightAnchor, multiplier: 0.2))
        
        constraints.append(view3.topAnchor.constraint(equalTo: view2.bottomAnchor))
        constraints.append(view3.leadingAnchor.constraint(equalTo: view2.leadingAnchor))
        constraints.append(view3.trailingAnchor.constraint(equalTo: view2.trailingAnchor))
        constraints.append(view3.heightAnchor.constraint(equalTo: view1.heightAnchor, multiplier: 0.2))
        
        constraints.append(view4.topAnchor.constraint(equalTo: view3.bottomAnchor))
        constraints.append(view4.leadingAnchor.constraint(equalTo: view3.leadingAnchor))
        constraints.append(view4.trailingAnchor.constraint(equalTo: view3.trailingAnchor))
        constraints.append(view4.heightAnchor.constraint(equalTo: view1.heightAnchor, multiplier: 0.2))
        
        constraints.append(view5.topAnchor.constraint(equalTo: view4.bottomAnchor))
        constraints.append(view5.leadingAnchor.constraint(equalTo: view4.leadingAnchor))
        constraints.append(view5.trailingAnchor.constraint(equalTo: view4.trailingAnchor))
        constraints.append(view5.heightAnchor.constraint(equalTo: view1.heightAnchor, multiplier: 0.2))
        
        constraints.append(view6.bottomAnchor.constraint(equalTo: view1.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(view6.leadingAnchor.constraint(equalTo: view5.leadingAnchor))
        constraints.append(view6.trailingAnchor.constraint(equalTo: view5.trailingAnchor))
        constraints.append(view6.heightAnchor.constraint(equalTo: view1.heightAnchor, multiplier: 0.2))
        
        constraints.append(view7.topAnchor.constraint(equalTo: view2.topAnchor))
        constraints.append(view7.bottomAnchor.constraint(equalTo: view2.bottomAnchor))
        constraints.append(view7.leadingAnchor.constraint(equalTo: view2.leadingAnchor))
        constraints.append(view7.widthAnchor.constraint(equalTo: view2.widthAnchor, multiplier: 0.5))
        
        constraints.append(view8.topAnchor.constraint(equalTo: view2.topAnchor))
        constraints.append(view8.bottomAnchor.constraint(equalTo: view2.bottomAnchor))
        constraints.append(view8.trailingAnchor.constraint(equalTo: view2.trailingAnchor))
        constraints.append(view8.widthAnchor.constraint(equalTo: view2.widthAnchor, multiplier: 0.5))
        
        constraints.append(view9.topAnchor.constraint(equalTo: view8.topAnchor))
        constraints.append(view9.leadingAnchor.constraint(equalTo: view8.leadingAnchor))
        constraints.append(view9.trailingAnchor.constraint(equalTo: view8.trailingAnchor))
        constraints.append(view9.heightAnchor.constraint(equalTo: view8.heightAnchor, multiplier: 0.5))
        
        constraints.append(view10.bottomAnchor.constraint(equalTo: view8.bottomAnchor))
        constraints.append(view10.leadingAnchor.constraint(equalTo: view8.leadingAnchor))
        constraints.append(view10.trailingAnchor.constraint(equalTo: view8.trailingAnchor))
        constraints.append(view10.heightAnchor.constraint(equalTo: view8.heightAnchor, multiplier: 0.5))
        
        constraints.append(view11.topAnchor.constraint(equalTo: view3.topAnchor))
        constraints.append(view11.bottomAnchor.constraint(equalTo: view3.bottomAnchor))
        constraints.append(view11.leadingAnchor.constraint(equalTo: view3.leadingAnchor))
        constraints.append(view11.widthAnchor.constraint(equalTo: view3.widthAnchor, multiplier: 0.5))
        
        constraints.append(view12.topAnchor.constraint(equalTo: view3.topAnchor))
        constraints.append(view12.bottomAnchor.constraint(equalTo: view3.bottomAnchor))
        constraints.append(view12.trailingAnchor.constraint(equalTo: view3.trailingAnchor))
        constraints.append(view12.widthAnchor.constraint(equalTo: view3.widthAnchor, multiplier: 0.5))
        
        NSLayoutConstraint.activate(constraints)
        
    }
    

}
