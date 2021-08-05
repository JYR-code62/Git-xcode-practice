//
//  NavItemController.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 04/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

// Note: Navigation Controller -- Navigation Bar customization

// Navigation bar -- color,title,bar button items, hide on tap, check life cycle methods

import UIKit

class NavItemController: UIViewController {

let btntoNavigation = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        btntoNavigation.setTitle("Go to Nav Controller", for: .normal)
        btntoNavigation.backgroundColor = .white
        btntoNavigation.setTitleColor(.black, for: .normal)
        btntoNavigation.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        view.addSubview(btntoNavigation)
        btntoNavigation.addTarget(self, action: #selector(btntoNavigationClicked), for: .touchUpInside)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("View will appear - Go to Nav")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("View did appear - Go to Nav")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
         print("View will DisAppear - Go to Nav")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
         print("View Did DisAppear - Go to Nav")
    }
    
    @objc func btntoNavigationClicked(){
        let rootVC = View1()
        let navController = UINavigationController(rootViewController: rootVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController,animated: true)
        
    }

 

}

class View1: UIViewController{
    
let btntoView2 = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
         self.navigationController?.navigationBar.barStyle = .black
         self.navigationController?.navigationBar.barTintColor = UIColor.brown
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
         self.navigationItem.title = "Home"
        
        
        let rightBarButton1 = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(clickedCamera))
        let rightBarButton2 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(clickedAdd))
                 
        navigationItem.rightBarButtonItems = [rightBarButton1,rightBarButton2]
                
        rightBarButton1.tintColor = UIColor.white
        rightBarButton2.tintColor = UIColor.white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
        btntoView2.setTitle("Go to Next", for: .normal)
        btntoView2.backgroundColor = .white
        btntoView2.setTitleColor(.black, for: .normal)
        btntoView2.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        btntoView2.center = view.center
        view.addSubview(btntoView2)
        btntoView2.addTarget(self, action: #selector(btntoView2Clicked), for: .touchUpInside)
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("View will appear - View1")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("View did appear - View1")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
         print("View will DisAppear - View1")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
         print("View Did DisAppear - View1")
    }
    
    @objc func clickedCamera(){
        print("Camera clicked")
    }
    @objc func clickedAdd(){
        print("Add clicked")
    }
    
    @objc func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func btntoView2Clicked(){
        let v2 = View2()
        navigationController?.pushViewController(v2, animated: true)
    }
    
    
}

class View2: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        let rightItem1 = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: nil)
        let rightItem2 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(clickedCancel))
        let leftItem1 = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: nil)
        let leftItem2 = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: nil)
        
        
        rightItem2.tintColor = UIColor.white
        rightItem1.tintColor = UIColor.white
          
        leftItem1.tintColor = UIColor.white
        leftItem2.tintColor = UIColor.white
          
        navigationItem.title = "Photos"
          
        navigationItem.leftBarButtonItems = [leftItem1, leftItem2]
        navigationItem.rightBarButtonItems = [rightItem1, rightItem2]
        
        navigationController?.hidesBarsOnTap = true
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("View will appear - View2")
        navigationController?.setNavigationBarHidden(false, animated: animated)
        //navigationController?.hidesBarsOnTap = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("View did appear - View2")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
         print("View will DisAppear - View2")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
         print("View Did DisAppear - View2")
    }
     
    @objc func clickedCancel(){
        self.navigationController?.popViewController(animated: true)
    }
}
