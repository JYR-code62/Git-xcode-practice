//
//  LongPressGesture.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 12/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

//NOTE: LongPress Gesture

import UIKit

class LongPressGesture: UIViewController {
    
    let myView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        myView.backgroundColor = .systemPurple
        myView.center = view.center
        view.addSubview(myView)
        myView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        myView.center = view.center
        myView.layer.cornerRadius = myView.frame.size.width/2
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesturefired(_:)))
        gestureRecognizer.numberOfTouchesRequired = 1
        gestureRecognizer.minimumPressDuration = 0.5
        
         myView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func longPressGesturefired(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began{
            print("LongPress fired")
            if let viewThatFiredGesture = gesture.view{
           
                    
                    DispatchQueue.main.asyncAfter(deadline: .now(), execute: {viewThatFiredGesture.backgroundColor = .orange
                
                    self.myView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
                    self.myView.layer.cornerRadius = self.myView.frame.size.width/2
                        self.myView.center = self.view.center})
                
                    DispatchQueue.main.asyncAfter(deadline: .now()+1.1, execute: {viewThatFiredGesture.backgroundColor = .systemPurple})
                
                    DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
                    self.myView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
                    self.myView.layer.cornerRadius = self.myView.frame.size.width/2
                        self.myView.center = self.view.center})
                }
        
                
            }
        }
        
   

}


