//
//  ScreenEdgePanGesture.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 13/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

import UIKit

class ScreenEdgePanGesture: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
    
        
        let gestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(ScreenEdgePanfired(_:)))
        gestureRecognizer.edges = .left
        view.addGestureRecognizer(gestureRecognizer)
        view.isUserInteractionEnabled = true
    }
    
    @objc func ScreenEdgePanfired(_ sender: UIScreenEdgePanGestureRecognizer) {
        
        print("Handle Screen Edge Pan")
        
        let rootVC = ScreenEdge()
        let navigationVC = UINavigationController(rootViewController: rootVC)
        navigationVC.modalPresentationStyle = .fullScreen
        present(navigationVC,animated: true)

}
}

class ScreenEdge: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        
        

}
}
