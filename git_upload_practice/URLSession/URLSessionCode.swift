//
//  URLSession.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 19/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

//NOTE: URLSession code to fetch image & display it in the imageview.

import UIKit

class URLSessionCode: UIViewController {
    
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let sharedSession = URLSession.shared
        
        if let url = URL(string: "https://goo.gl/wV9G4I"){
        
        let request = URLRequest(url: url)
            
        
        let datatask = sharedSession.dataTask(with: request, completionHandler: {(data,response,error) -> Void in
            if let data = data, let image = UIImage(data: data){
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
            
    })
            datatask.resume()
        }
    
    }
    

}

