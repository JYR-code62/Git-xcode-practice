//
//  ToDoList.swift
//  CoreDataProject
//
//  Created by Jyoti1 Yadav on 16/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

//Note: To Do List app - add new item, delete item, edit/update item in the list.

import UIKit

class ToDoList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    let tableview = UITableView()
       
   // Reference to managed object context
   let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   
   // Data for the table
    private var items = [ToDoListItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "To Do List"
        view.addSubview(tableview)
        
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.delegate = self
        tableview.dataSource = self
        tableview.frame = view.frame
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector((didTapAdd)))
        
        getAllItems()

        
    }
    
    @objc func didTapAdd(){
        
        // Create Alert
        let alert = UIAlertController(title: "New Item", message: "Enter new item", preferredStyle: .alert)
        
        alert.addTextField()
        
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: {_ in
            // Get the textfield for the alert
            let textfield = alert.textFields![0]
            
            self.createItem(name: textfield.text!)
            
            self.getAllItems()
            
            
        }))
        self.present(alert, animated: true)
            
        
    }
   
    // TableView Methods

    
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return items.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
           
           // Get person from array and set the label
           let entry = items[indexPath.row]
           
        cell.textLabel?.text = entry.name
        //cell.textLabel?.numberOfLines = 2
        // Create Date Formatter
        let dateFormatter = DateFormatter()
        cell.detailTextLabel?.text = dateFormatter.string(from: entry.createdAt!)
        
           
           return cell
       }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Create swipe action
        let action = UIContextualAction(style: .destructive, title: "Delete") {(action,view,completionHandler) in
            
            // which person to remove
            let itemToRemove = self.items[indexPath.row]
            
            // Remove the person
            self.context.delete(itemToRemove)
            
            // Save the data
            self.saveData()
            
            
            // Re-fetch the data
            self.getAllItems()
            
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        
        let sheet = UIAlertController(title: "Edit", message: nil, preferredStyle: .actionSheet)
        
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { _ in
            
            let alert = UIAlertController(title: "Edit Item", message: "Edit your item", preferredStyle: .alert)
            
            alert.addTextField()
            alert.textFields?.first?.text = item.name
            alert.addAction(UIAlertAction(title: "Save", style: .cancel, handler: {_ in
                
                let textfield = alert.textFields![0]
                //item.name = textfield.text
                
                self.updateItem(item: item, newName: textfield.text!)
                
                self.getAllItems()
                
                
            }))
            self.present(alert, animated: true)
            
        }))
        
        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            self.deleteItem(item: item)
            self.getAllItems()
        }))
        
        present(sheet,animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    // MARK: Core Data
    
    func saveData(){
        do{
         try self.context.save()
        }
        catch{
            
        }
    }
    
    func getAllItems(){
        do{
            items = try context.fetch(ToDoListItem.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
        catch{
            
        }
        
    }
    
    func createItem(name: String){
        let newItem = ToDoListItem(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        
        print(newItem.name!)
        
        self.saveData()
        
        
    }
    
    func deleteItem(item: ToDoListItem){
        
        context.delete(item)
        
        saveData()
        
    }
    
    func updateItem(item: ToDoListItem, newName: String){
        item.name = newName
        
        saveData()
    }
    
}
