//
//  TableView.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 08/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

//NOTE: TableView - This is normal TableView without custom cells.
// Shows a contacts like list. Also has header & footer.

import UIKit

class TableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    
    let tableview = UITableView()
    
    //var data = [String]()
    let data = [["Ashwini","Ayesha","Asavari"],["Beena"],["Deepa","Dolly"],["Harshada","Himanshi"]]
    let sectiontitle = ["A","B","D","H"]

    override func viewDidLoad() {
        super.viewDidLoad()
        //for x in 0...50{
          //  data.append("Some data \(x)")
        //}
        
        view.addSubview(tableview)
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.sectionHeaderHeight = 20
        tableview.sectionFooterHeight = 10
        
        
        tableview.frame = view.bounds
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 200))
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 200))
        
        let lblheader = UILabel(frame: header.bounds)
        lblheader.text = "Header"
        lblheader.textAlignment = .center
        lblheader.textColor = .black
        header.addSubview(lblheader)
        
        let lblfooter = UILabel(frame: footer.bounds)
        lblfooter.text = "Footer"
        lblfooter.textAlignment = .center
        lblfooter.textColor = .black
        footer.addSubview(lblfooter)
        
        header.backgroundColor = .cyan
        footer.backgroundColor = .brown
        
        tableview.tableHeaderView = header
        tableview.tableFooterView = footer
        
        }
   /* override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }*/
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectiontitle[section]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        //"Cell \(indexPath.row + 1)"
        cell.backgroundColor = .orange
        return cell
        
      }
    
    //Delegate method
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row \(indexPath.row) from section \(indexPath.section)")
        print(data[indexPath.section][indexPath.row])
        tableview.deselectRow(at: indexPath, animated: true)
        //print("Cell tapped")
    }

    

}
