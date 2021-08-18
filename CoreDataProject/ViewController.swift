//
//  ViewController.swift
//  CoreDataProject
//
//  Created by Jyoti1 Yadav on 14/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableview = UITableView()
    
    // Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // Data for the table
    var items:[Person]?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        view.addSubview(tableview)
        
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.delegate = self
        tableview.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector((didTapAdd)))
        
        
        // Get items from Core Data
        
        fetchPeople()
        
    }
    
    //MARK: Retrieve Data
    
    func fetchPeople(){
        
        // Fetch the data from Core Data to display in the tableview
        do{
            self.items = try context.fetch(Person.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
           
        }
        catch{
            
        }
        
    }
    
    //MARK: Save Data
    
    func saveData(){
        do{
         try self.context.save()
        }
        catch{
            
        }
    }
    
    //MARK: Add new data
    
    @objc func didTapAdd(){
        
        // Create Alert
        let alert = UIAlertController(title: "Add Person", message: "Enter name of the person", preferredStyle: .alert)
        
        alert.addTextField()
        
        //Configure Button Handler
        let submitButton = UIAlertAction(title: "Add", style: .default) {(action) in
            
            // Get the textfield for the alert
            
            let textfield = alert.textFields![0]
            
            // Create a person object
            
            let newPerson = Person(context: self.context)
//            newPerson.name = textfield.text
//            newPerson.age = 20
//            newPerson.gender = "Male"
            
            newPerson.setValue(textfield.text, forKey: "name")
            newPerson.setValue(20, forKey: "age")
            newPerson.setValue("Male", forKey: "gender")
            
            // Save the data
            
            self.saveData()
            
            // Re-fetch the data
            
            self.fetchPeople()
        }
        
            //Add button
            alert.addAction(submitButton)
        
        //Show alert
            self.present(alert,animated: true, completion: nil)
        
    }

        
            
            
            

    
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           tableview.frame = view.bounds
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items?.count ?? 0
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Get person from array and set the label
        let person = self.items![indexPath.row]
        
        cell.textLabel?.text = person.name
        
        return cell
        
      }
    
    
    
    //Delegate method
    
    //MARK: Update/Edit Data
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Selected Person
        let person = self.items![indexPath.row]
        
        //Create Alert
        let alert = UIAlertController(title: "Edit Person", message: "Edit name:", preferredStyle: .alert)
        alert.addTextField()
        
        let textfield = alert.textFields![0]
        textfield.text = person.name
        
        //Configure button handler
        let saveButton = UIAlertAction(title: "Save", style: .default){(action) in
            
            //Get the textfield for the alert
            let textfield = alert.textFields![0]
            
            //Edit the name property of the person object
            person.name = textfield.text
            
            //self.items![indexPath.row].setValue(textfield.text, forKey: "name")
            
            // Save the data
            self.saveData()
            
            //Re-fetch the data
            self.fetchPeople()
            
        }
        
        //Add button
        alert.addAction(saveButton)
        
        //Show alert
        self.present(alert,animated: true)
        
        
        
    }
    
    //MARK: Delete Data
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Create swipe action
        let action = UIContextualAction(style: .destructive, title: "Delete") {(action,view,completionHandler) in
            
            // which person to remove
            let personToRemove = self.items![indexPath.row]
            
            // Remove the person
            self.context.delete(personToRemove)
            
            // Save the data
            self.saveData()
            
            
            // Re-fetch the data
            self.fetchPeople()
            
        }
        return UISwipeActionsConfiguration(actions: [action])
    }

 

}

