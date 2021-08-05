//
//  TB.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 04/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

// Note: Tab bar controller with initial controller as the tab bar.


import UIKit

class TB: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        
        let v1 = HomeVC()
        let v2 = FavoriteVC()
        let v3 = NotifyVC()
        
        v1.title = "Home"
        v2.title = "Favorite"
        v3.title = "Notify"
        
        self.setViewControllers([v1,v2,v3], animated: true)

        let images = ["house","star","bell"]
        
        guard let items = self.tabBar.items else{
            return
        }
        
        for i in 0..<items.count{
            items[i].image = UIImage(systemName: images[i])
        }
        
    }
    

}

class HomeVC: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        title = "Home"
}
}

class FavoriteVC: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        title = "Favorite"
}
}

class NotifyVC: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        title = "Notify"
}
}
