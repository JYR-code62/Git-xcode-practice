//
//  TapGesture.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 11/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

//NOTE: Tap Gesture Recognizer - Single Tap & Double Tap

import UIKit

class TapGesture: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        myView.backgroundColor = .red
        myView.center = view.center
        view.addSubview(myView)
        
      
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesturefired(_:)))
        gestureRecognizer.numberOfTapsRequired = 1 // Single Tap
        //gestureRecognizer.numberOfTapsRequired = 2  // Double Tap
        gestureRecognizer.numberOfTouchesRequired = 1
        
        myView.addGestureRecognizer(gestureRecognizer)
        myView.isUserInteractionEnabled = true
   
    }
    
    @objc func tapGesturefired(_ gesture: UITapGestureRecognizer){
        print("Tap Gesture fired")
    }
   

}
