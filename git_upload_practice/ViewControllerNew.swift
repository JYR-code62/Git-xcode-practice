//
//  ViewController1.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 05/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

// Accepting User Information --> Used TextField, TextView, Label, Button

import UIKit

class ViewControllerNew: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    
    @IBOutlet weak var userEmailField: UITextField!
    
    @IBOutlet weak var userPhoneNumberField: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameField.delegate = self
        userEmailField.delegate = self
        userPhoneNumberField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func SaveClicked(_ sender: Any) {
        
        if !((userNameField.text)!).isEmpty && !((userEmailField.text)!).isEmpty && !((userPhoneNumberField.text)!).isEmpty{
            textView.text = "User Name : \(userNameField.text!)\nEmail : \(userEmailField.text!)\nPhone Number : \(userPhoneNumberField.text!)"
        }
        else{
            print("Please fill all Fields")
            // Create new Alert
            let dialogMessage = UIAlertController(title: "Note", message: "Please fill all the Fields", preferredStyle: .alert)
                
                // Create OK button with action handler
            
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    //print("Ok button tapped")
                    })
                
                //Add OK button to a dialog message
            dialogMessage.addAction(ok)

                // Present Alert to
            self.present(dialogMessage, animated: true, completion: nil)
            }
        
    }
    
    @IBAction func ClearClicked(_ sender: Any) {
        userNameField.text?.removeAll()
        userEmailField.text?.removeAll()
        userPhoneNumberField.text?.removeAll()
        textView.text?.removeAll()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        userPhoneNumberField.resignFirstResponder()
    }
    
}

extension ViewControllerNew : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
