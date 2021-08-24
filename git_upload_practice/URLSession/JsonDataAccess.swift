//
//  JsonDataAccess.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 20/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

// NOTE: Access JSON data & display the data on the UI.
// Used Codable.

import UIKit

class JsonDataAccess: UIViewController {
    
    @IBOutlet var firstName: UILabel! 
    @IBOutlet var lastName: UILabel!
    @IBOutlet var age: UILabel!
    @IBOutlet var gender: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()

       
    }
    
    func fetchData(){
        let sharedSession = URLSession.shared
        let url = URL(string: "https://tools.learningcontainer.com/sample-json.json")!
        
        
        
        let task = sharedSession.dataTask(with: url, completionHandler: {(data,response,error) in
            
            let httpResponse = response as! HTTPURLResponse
            print(httpResponse.statusCode)
            
            guard let data = data
                else{
                return
            }
            
            
            do{
                let person = try JSONDecoder().decode(Person.self, from: data)
                
                DispatchQueue.main.async {
                    self.firstName.text = person.firstName
                    self.lastName.text = person.lastName
                    self.age.text = String(person.age)
                    self.gender.text = person.gender
                }
            }
            catch{
                print("Error occured")
            }
        
        
        
        
        })
        task.resume()
        
    }

   
}
