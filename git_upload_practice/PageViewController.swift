//
//  PageViewController.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 08/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

//PageViewController

import UIKit

class PageViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
 
    

    var myControllers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        myControllers.append(vc)
        
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .green
        myControllers.append(vc1)
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .brown
        myControllers.append(vc2)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.presentPageVC()
        
        //DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {self.presentPageVC()})
    }
    
    

func presentPageVC(){
    guard let first = myControllers.first else{
        return
    }
    
    let vc = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
    
    vc.delegate = self
    vc.dataSource = self
    vc.setViewControllers([first], direction: .forward, animated: true, completion: nil)
    vc.modalPresentationStyle = .fullScreen
    present(vc,animated: true)
    
    
    
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = myControllers.firstIndex(of: viewController),index > 0 else{
            return nil
        }
        let before = index-1
        print(before)
        return myControllers[before]
     }
     
     func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = myControllers.firstIndex(of: viewController),index < (myControllers.count - 1) else{
             return nil
         }
        let after = index + 1
        print(after)
        return myControllers[after]
     }

}
