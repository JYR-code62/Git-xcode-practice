//
//  SwipeGestureNavController.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 13/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

//NOTE: Swipe Gesture to go to Navigation Controller
// Swiping up on initial screen/view controller takes to the root VC of Navigation Controller.

import UIKit

class SwipeGestureNavController: UIViewController {
    let lbl = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        
        
        lbl.frame = CGRect(x: 50, y: 300, width: 300, height: 50)
        lbl.text = "Swipe up.."
        lbl.textColor = .systemBlue
        lbl.font = lbl.font.withSize(40)
        lbl.font = UIFont.boldSystemFont(ofSize: 40)
        lbl.textAlignment = .center
        view.addSubview(lbl)
        
        let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesturefired(_:)))
        gestureRecognizer.numberOfTouchesRequired = 1
        
        gestureRecognizer.direction = .up // Used to control swipe direction
        
        view.addGestureRecognizer(gestureRecognizer)
        view.isUserInteractionEnabled = true
        

    }
    @objc func swipeGesturefired(_ gesture: UISwipeGestureRecognizer){
        print("swiped")
        let rootVC = SwipeUp()
        let navigationVC = UINavigationController(rootViewController: rootVC)
        navigationVC.modalPresentationStyle = .fullScreen
        present(navigationVC,animated: true)
    }

   

}


class SwipeUp: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        

}
}
