//
//  TableViewWithCustomCells.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 10/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

// NOTE : TableView -- this table view uses custom cells having a label,switch and image view.
// See Class CustomTableViewCell.swift for custom cell definition.

import UIKit

class TableViewWithCustomCells: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    let tableview = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        view.addSubview(tableview)
        tableview.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.frame = view.bounds
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
            
        }
        
        cell.configure(text: "Custom cell " + "\(indexPath.row)")
            
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    

}
