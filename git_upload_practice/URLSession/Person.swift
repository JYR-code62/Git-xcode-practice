//
//  Person.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 20/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

import Foundation


struct Person: Codable
{
    let firstName: String
    let lastName: String
    let gender: String
    let age: Int
    
    
    init() {
        firstName = ""
        lastName = ""
        gender = ""
        age = 0
    }
}











