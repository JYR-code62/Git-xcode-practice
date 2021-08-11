//
//  Slider.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 09/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//


//Slider

import UIKit

class Slider: UIViewController {
    
    let slider = UISlider()
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        label.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: 150)
        label.text = "Waiting for the Slider..."
        label.textColor = .white
        label.backgroundColor = .blue
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Copperplate-Bold", size: 32)
        view.addSubview(label)
        
        slider.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 20)
        slider.center = view.center
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.tintColor = .cyan
        slider.thumbTintColor = .red
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(sliderInAction(sender:)), for: .valueChanged)
        view.addSubview(slider)
        
    }
    

    @objc func sliderInAction(sender: UISlider){
        label.text = "Value of Slider:\n" + String(Int(sender.value))
    }
    
    
}
