//
//  URLSessionGETandPOST.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 20/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

//NOTE: Implemented GET & POST requests.
// GET - Get JSON data (posts) from the JSONPLACEHOLDER api.
// POST - Post data (post) to the api.

import UIKit

class URLSessionGETandPOST: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let params = [
        
            "title" : "This is the title of my post.",
            "body" : "This is the body of my post."
        
        ]
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request, completionHandler: {(data,response,error) in
            
            if let error = error{
                print("There was an error: \(error.localizedDescription)")
            }
            else{
                let jsonData = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("The response: \(jsonData!)")
                //print(response)
                
            }
            
            
        })
        task.resume()
        
        //getPosts()
        
    }
    

    
    func getPosts(){
        let session = URLSession.shared
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else{ return }
        
        
        let task = session.dataTask(with: url, completionHandler: {(data,response,error) in
            
            if let error = error{
                print("There was an error: \(error.localizedDescription)")
            }
            else{
                let jsonData = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("The response: \(jsonData!)")
                
                
            }
            
            
        })
        task.resume()
    }
    
    
    

}
