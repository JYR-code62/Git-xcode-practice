//
//  JSONParsing.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 19/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

//NOTE: Json Parsing - accessing json data from JSONPLACEHOLDER api.


import UIKit

class JSONParsing: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let sharedSession = URLSession.shared
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!


       let task = sharedSession.dataTask(with: url, completionHandler: {(data,response,error)  in
            if error == nil{
                let httpResponse = response as! HTTPURLResponse
                if(httpResponse.statusCode == 200){
                    let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    print(jsonData!)

                    let result = jsonData as! Dictionary<String,Any>
                    print(result["id"]!)

                }
            }

        })
       task.resume()
        

        
        
    }
    

}
