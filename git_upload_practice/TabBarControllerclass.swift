//
//  TabBarControllerclass.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 03/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

// Note: Tab Bar Controller with first view controller having a button to take to tab bar controller.
// tab bar has 5 different tabs

import UIKit

class TabBarControllerclass: UIViewController {
    
    let btnVC = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        btnVC.backgroundColor = .white
        btnVC.setTitleColor(.black, for: .normal)
        btnVC.setTitle("Go to Tab Bar", for: .normal)
        btnVC.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        btnVC.center = view.center
        view.addSubview(btnVC)
        btnVC.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        
        
        
        
    }
    
    @objc func btnClicked(){
        let tabbarVC = UITabBarController()
        
        let vc1 = UINavigationController(rootViewController: Tab1())
        let vc2 = UINavigationController(rootViewController: Tab2())
        let vc3 = UINavigationController(rootViewController: Tab3())
        let vc4 = UINavigationController(rootViewController: Tab4())
        let vc5 = UINavigationController(rootViewController: Tab5())
        
        vc1.title = "Home"
        vc2.title = "About"
        vc3.title = "Help"
        vc4.title = "Contact"
        vc5.title = "Settings"
        
   
        
        
        tabbarVC.setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: true)
        tabbarVC.modalPresentationStyle = .fullScreen
        
        guard let items = tabbarVC.tabBar.items else{
               return
           }
           
           let images = ["house","bell","person.circle","star","gear"]
           
           for x in 0..<items.count{
               items[x].image = UIImage(systemName: images[x])
           }
        present(tabbarVC,animated: true)
    }
    



}

class Tab1: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        title = "Home"
    }
}

class Tab2: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        title = "About"
    }
}

class Tab3: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        title = "Help"
    }
}

class Tab4: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        title = "Contact"
    }
}

class Tab5: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        title = "Settings"
    }
}
