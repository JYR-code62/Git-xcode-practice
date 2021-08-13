//
//  RotationGesture.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 12/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

//NOTE: Rotation Gesture
// Use "Option" button from keyboard for rotation gesture, i.e for rotating the view.


import UIKit

class RotationGesture: UIViewController {
    
    let myView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        myView.backgroundColor = .systemPurple
        myView.center = view.center
        view.addSubview(myView)
        myView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        myView.center = view.center
        let gestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(rotationGesturefired(_:)))
       
        myView.addGestureRecognizer(gestureRecognizer)
    }
    

    @objc func rotationGesturefired(_ gesture: UIRotationGestureRecognizer){
        
        //print(gesture.rotation)
        myView.transform = myView.transform.rotated(by: gesture.rotation)
        gesture.rotation = 0
    }

}
