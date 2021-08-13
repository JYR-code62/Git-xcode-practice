//
//  PanGesture.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 11/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

// NOTE: Pan Gesture - Drag & drop folder view to trash view.

import UIKit

class PanGesture: UIViewController {

    
  
    @IBOutlet weak var folderView: UIView!
    @IBOutlet weak var trashView: UIView!
    
    var folderViewOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGesturefired(sender:)))
        folderView.addGestureRecognizer(gestureRecognizer)
        folderViewOrigin = folderView.frame.origin
    }
    
    @objc func panGesturefired(sender: UIPanGestureRecognizer){
        let fileView = sender.view!
        let translation = sender.translation(in: view)
        
        switch sender.state {
        case .began, .changed:
            fileView.center = CGPoint(x: fileView.center.x + translation.x, y: fileView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
        case .ended:
            if fileView.frame.intersects(trashView.frame){
                UIView.animate(withDuration: 0.3, animations: { self.folderView.alpha = 0.0})
            }
            else{
                UIView.animate(withDuration: 0.3, animations: { self.folderView.frame.origin = self.folderViewOrigin})
            }
        default:
            break
        }
        
    }

   

}
