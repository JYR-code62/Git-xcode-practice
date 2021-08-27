//
//  XMLParsing.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 23/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

//NOTE: XML Parsing - parse the xml data and display it in the tableview.
// See, Books.xml for the xml data.

import UIKit


struct Book {
       var bookTitle: String
       var bookAuthor: String
   }

class XMLParsing: UIViewController, UITableViewDelegate, UITableViewDataSource, XMLParserDelegate {
    
    
    
    @IBOutlet var tableview: UITableView!
    
    
    var books: [Book] = []
    var elementName: String = String()
    var bookTitle = String()
    var bookAuthor = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        if let path = Bundle.main.url(forResource: "Books", withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                parser.delegate = self
                parser.parse()
            }
        }

        
    }
    
    //Parser
    
    
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        //print(elementName)
        
        if elementName == "book" {
            bookTitle = String()
            bookAuthor = String()
        
        }
        
        self.elementName = elementName
        
    }
    
    
    // 2
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "book" {
            let book = Book(bookTitle: bookTitle, bookAuthor: bookAuthor)
            books.append(book)
        }
    }
    
    // 3
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if (!data.isEmpty) {
            if self.elementName == "title" {
                bookTitle += data
            } else if self.elementName == "author" {
                bookAuthor += data
            }
        }
    }
    
    
    
    
    
    
    //TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

         let book = books[indexPath.row]

         cell.textLabel?.text = book.bookTitle
         cell.detailTextLabel?.text = book.bookAuthor

         return cell
    }
   

}




/*
 <?xml version="1.0" encoding="UTF-8" standalone="no"?>
 <document type="com.apple.InterfaceBuilder3.CocoaTouch.XIB" version="3.0" toolsVersion="13142" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" useSafeAreas="YES" colorMatched="YES">
     <dependencies>
         <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="12042"/>
     </dependencies>
     <objects>
         <placeholder placeholderIdentifier="IBFilesOwner" id="-1" userLabel="File's Owner"/>
         <placeholder placeholderIdentifier="IBFirstResponder" id="-2" customClass="UIResponder"/>
     </objects>
 </document>
 
 */
