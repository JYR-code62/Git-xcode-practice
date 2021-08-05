//
//  NavigationControllerclass.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 03/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

// Note : Nav Bar Controller with first view controller having buttons and each button
// navigating to individual nav controller of 2 screens each

import UIKit

class NavigationControllerclass: UIViewController {

    let button = UIButton()
    let btnApp = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        button.setTitle("Go to Home", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 52)
        //button.center = view.center
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        btnApp.setTitle("Go to Apps", for: .normal)
        btnApp.backgroundColor = .white
        btnApp.setTitleColor(.black, for: .normal)
        btnApp.frame = CGRect(x: 100, y: 400, width: 200, height: 52)
        //btnApp.center = view.center
        view.addSubview(btnApp)
        btnApp.addTarget(self, action: #selector(btnAppsClicked), for: .touchUpInside)
        
    }
    
    @objc func buttonClicked(){
        let rootVC = ViewController1()
        let navigationVC = UINavigationController(rootViewController: rootVC)
        navigationVC.modalPresentationStyle = .fullScreen
        present(navigationVC,animated: true)
        
    }
    
    @objc func btnAppsClicked(){
        let rootVCApps = ViewControllerApps1()
        let navigationVCApps = UINavigationController(rootViewController: rootVCApps)
        navigationVCApps.modalPresentationStyle = .fullScreen
        present(navigationVCApps,animated: true)
    }

}

// MARK: ViewControllers for Home


class ViewController1: UIViewController{
    
    let button = UIButton()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Welcome to Home"
        view.backgroundColor = .systemPurple
        
        button.setTitle("Push to Another VC", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 52)
        button.center = view.center
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
        
        
    }
    
    @objc func buttonClicked(){
        let vc2 = ViewController2()
        navigationController?.pushViewController(vc2, animated: true)
    }
        
    @objc func dismissSelf(){
        dismiss(animated: true, completion: nil)
        }

    
    
    
    
}

class ViewController2: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        title = "Home"
    }
    
}

// MARK: ViewControllers for Apps


class ViewControllerApps1: UIViewController{
    
    let btnApp = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        title = "Welcome to Apps"
        
        
        
    
    
    btnApp.setTitle("AppStore", for: .normal)
    btnApp.backgroundColor = .white
    btnApp.setTitleColor(.black, for: .normal)
    btnApp.frame = CGRect(x: 100, y: 400, width: 200, height: 52)
    btnApp.center = view.center
    view.addSubview(btnApp)
    btnApp.addTarget(self, action: #selector(btnAppsClicked), for: .touchUpInside)
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
        
        
    }
    @objc func btnAppsClicked(){
        let vcapps2 = ViewControllerApps2()
        navigationController?.pushViewController(vcapps2, animated: true)
    }
    
    @objc func dismissSelf(){
           dismiss(animated: true, completion: nil)
           }
    
}

class ViewControllerApps2: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
    }
    
    
    
}
