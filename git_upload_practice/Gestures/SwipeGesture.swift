//
//  SwipeGesture.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 11/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

//NOTE: Swipe Gesture Recognizer - Swipe Right 

import UIKit

class SwipeGesture: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        myView.backgroundColor = .red
        myView.center = view.center
        view.addSubview(myView)
         
           
             
         let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesturefired(_:)))
         gestureRecognizer.numberOfTouchesRequired = 1
        
         //gestureRecognizer.direction = .down // Used to control swipe direction
        
         myView.addGestureRecognizer(gestureRecognizer)
         myView.isUserInteractionEnabled = true
    
    }
    
    @objc func swipeGesturefired(_ gesture: UISwipeGestureRecognizer){
        
        if let viewThatFiredGesture = gesture.view{
            viewThatFiredGesture.backgroundColor = .blue
            
        }
        
        print("Swipe Gesture fired")
    }

    

}

class VC: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
}
