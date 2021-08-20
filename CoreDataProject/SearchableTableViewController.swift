//
//  SearchableTbleViewViewController.swift
//  CoreDataProject
//
//  Created by Jyoti1 Yadav on 18/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

//NOTE: Searchable TableView
// Here, Textfield & Tableview are created using storyboard.

import UIKit
import CoreData

class SearchableTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate {
    
    @IBOutlet var tableview: UITableView!
    @IBOutlet var field: UITextField!

    // Reference to managed object context
       let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
       
       // Data for the table
       var items:[Person]?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        field.delegate = self

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
    
    func fetchSearchPeople(){
        
//        if !(field.text!.isEmpty){
        do{
            let request = Person.fetchRequest() as NSFetchRequest<Person>
            
            
            
                let search = field.text!
                //print(search)
                let pred = NSPredicate(format: "name CONTAINS[c] %@",search)
                request.predicate = pred
                self.items = try context.fetch(request)
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
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = field.text,!text.isEmpty{
        fetchSearchPeople()
        }
        else{
            fetchPeople()
        }
        return true
    }
}
