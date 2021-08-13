//
//  PinchGesture.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 12/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

//NOTE: Pinch Gesture
// Use "Option" button from keyboard for pinch i.e., zoom in/out gesture.

import UIKit

class PinchGesture: UIViewController {

    let size: CGFloat = 200
    let myView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
       myView.backgroundColor = .systemPurple
       myView.center = view.center
       view.addSubview(myView)
        myView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        myView.center = view.center
        let gestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesturefired(_:)))
        
        myView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func pinchGesturefired(_ gesture: UIPinchGestureRecognizer){
        if gesture.state == .changed{
            let scale = gesture.scale
            myView.frame = CGRect(x: 0, y: 0, width: size * scale, height: size * scale)
        }
        myView.center = view.center
    }
    

    

}
