//
//  Registration.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 05/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

import UIKit

// MARK: First View Controller - Welcome Page

class Registration: UIViewController {
    
    let lbl = UILabel()
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        
        lbl.frame = CGRect(x: 50, y: 300, width: 300, height: 50)
        lbl.text = "Welcome To JIO"
        lbl.textColor = .systemBlue
        lbl.font = lbl.font.withSize(40)
        lbl.font = UIFont.boldSystemFont(ofSize: 40)
        //lbl.layer.borderColor = UIColor.black.cgColor
        lbl.textAlignment = .center
        view.addSubview(lbl)
        
        button.setTitle("Get Started", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 100, y: 500, width: 200, height: 52)
        //button.center = view.center
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func buttonClicked(){
        let rootVC = Screen1()
        let navigationVC = UINavigationController(rootViewController: rootVC)
        navigationVC.modalPresentationStyle = .fullScreen
        present(navigationVC,animated: true)
    }


}

// MARK: Screen 1 -- LogIn OR SignUp page

class Screen1: UIViewController{
   
   let btnLogIn = UIButton()
   let btnSignUp = UIButton()
   let lblLogIn = UILabel()
   let lblSignUp = UILabel()
   let lblOr = UILabel()

   override func viewDidLoad() {
       super.viewDidLoad()
       title = "Home"
       view.backgroundColor = .systemGray2
    
       lblLogIn.frame = CGRect(x: 30, y: 170, width: 350, height: 50)
       lblLogIn.text = "Log In if you already have an account"
       lblLogIn.textColor = .systemBlue
       lblLogIn.font = lblLogIn.font.withSize(20)
       //lblLogIn.layer.borderWidth = 0.5
       lblLogIn.textAlignment = .center
       lblLogIn.backgroundColor = .systemGray4
       view.addSubview(lblLogIn)
       
        btnLogIn.setTitle("Log In", for: .normal)
        btnLogIn.backgroundColor = .systemGreen
        btnLogIn.setTitleColor(.white, for: .normal)
        btnLogIn.frame = CGRect(x: 30, y: 270, width: 350, height: 52)
        view.addSubview(btnLogIn)
        btnLogIn.addTarget(self, action: #selector(btnLogInClicked), for: .touchUpInside)
    
        lblOr.frame = CGRect(x: 30, y: 355, width: 350, height: 50)
        lblOr.text = "OR"
        lblOr.textColor = .white
        lblOr.font = lblLogIn.font.withSize(30)
        lblOr.textAlignment = .center
        view.addSubview(lblOr)
    
       lblSignUp.frame = CGRect(x: 30, y: 440, width: 350, height: 50)
       lblSignUp.text = "Sign Up to Create a new account"
       lblSignUp.textColor = .systemBlue
       lblSignUp.font = lblSignUp.font.withSize(20)
       //lblSignUp.layer.borderWidth = 0.5
       lblSignUp.textAlignment = .center
       lblSignUp.backgroundColor = .systemGray4
       view.addSubview(lblSignUp)
       
        btnSignUp.setTitle("Sign Up", for: .normal)
        btnSignUp.backgroundColor = .systemGreen
        btnSignUp.setTitleColor(.white, for: .normal)
        btnSignUp.frame = CGRect(x: 30, y: 540, width: 350, height: 52)
        view.addSubview(btnSignUp)
        btnSignUp.addTarget(self, action: #selector(btnSignUpClicked), for: .touchUpInside)
    
       navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
       //navigationItem.leftBarButtonItem?.tintColor = UIColor.white
    
    }
    @objc func btnSignUpClicked(){
        let vc2 = Screen2()
        navigationController?.pushViewController(vc2, animated: true)
    }
    
    @objc func btnLogInClicked(){
        let vc4 = Screen4()
        navigationController?.pushViewController(vc4, animated: true)
    }
    
    @objc func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
}

// MARK: Screen 2 -- Personal Details

class Screen2: UIViewController{
    
    let nameField = UITextField()
    let emailField = UITextField()
    let phoneNumberField = UITextField()
    
    let btnNext = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        
        nameField.frame = CGRect(x: 30, y: 150, width: 350, height: 50)
        nameField.placeholder = " Enter your Name"
        nameField.layer.borderWidth = 0.5
        nameField.backgroundColor = .white
        view.addSubview(nameField)
        
        emailField.frame = CGRect(x: 30, y: 250, width: 350, height: 50)
        emailField.placeholder = " Enter your Email ID"
        emailField.layer.borderWidth = 0.5
        emailField.backgroundColor = .white
        view.addSubview(emailField)
        
        phoneNumberField.frame = CGRect(x: 30, y: 350, width: 350, height: 50)
        phoneNumberField.placeholder = " Enter your phone number"
        phoneNumberField.layer.borderWidth = 0.5
        phoneNumberField.backgroundColor = .white
        view.addSubview(phoneNumberField)
        
        btnNext.setTitle("Next", for: .normal)
        btnNext.backgroundColor = .systemGreen
        btnNext.setTitleColor(.white, for: .normal)
        btnNext.frame = CGRect(x: 100, y: 500, width: 200, height: 52)
        //button.center = view.center
        view.addSubview(btnNext)
        btnNext.addTarget(self, action: #selector(btnNextClicked), for: .touchUpInside)
    }
    
    @objc func btnNextClicked(){
        
        if !((nameField.text)!).isEmpty && !((emailField.text)!).isEmpty && !((phoneNumberField.text)!).isEmpty{
        
        // Create new Alert
        let dialogMessage = UIAlertController(title: "You Entered", message: "User Name : \(nameField.text!)\nEmail : \(emailField.text!)\nPhone Number : \(phoneNumberField.text!) ", preferredStyle: .alert)
            
            // Create OK button with action handler
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                //print("Ok button tapped")
            let vc3 = Screen3()
            self.navigationController?.pushViewController(vc3, animated: true)
                })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            //print("Cancel button tapped")
            
            
        }
            
            //Add OK button to a dialog message
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)

            // Present Alert to
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    else{
    
    let dialogMessage = UIAlertController(title: "Alert", message: "All Fields are mandatory", preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                   //print("Ok button tapped")
    })
    dialogMessage.addAction(ok)
    self.present(dialogMessage, animated: true, completion: nil)
    }
    }
}

// MARK: Screen 3 -- Username & Password

class Screen3: UIViewController{
    
    let usernameField = UITextField()
    let passwordField = UITextField()
    let confirmpasswordField = UITextField()
    
    let btnRegister = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        usernameField.frame = CGRect(x: 30, y: 150, width: 350, height: 50)
        usernameField.placeholder = " UserName"
        usernameField.layer.borderWidth = 0.5
        usernameField.backgroundColor = .white
        view.addSubview(usernameField)
        
        passwordField.frame = CGRect(x: 30, y: 250, width: 350, height: 50)
        passwordField.placeholder = " Enter password"
        passwordField.layer.borderWidth = 0.5
        passwordField.backgroundColor = .white
        view.addSubview(passwordField)
        
        confirmpasswordField.frame = CGRect(x: 30, y: 350, width: 350, height: 50)
        confirmpasswordField.placeholder = " Confirm Password"
        confirmpasswordField.layer.borderWidth = 0.5
        confirmpasswordField.backgroundColor = .white
        view.addSubview(confirmpasswordField)
        
        btnRegister.setTitle("Register", for: .normal)
        btnRegister.backgroundColor = .systemGreen
        btnRegister.setTitleColor(.white, for: .normal)
        btnRegister.frame = CGRect(x: 100, y: 500, width: 200, height: 52)
        view.addSubview(btnRegister)
        btnRegister.addTarget(self, action: #selector(btnRegisterClicked), for: .touchUpInside)
    }
    
    @objc func btnRegisterClicked(){
        
        
        if !((usernameField.text)!).isEmpty && !((passwordField.text)!).isEmpty && !((confirmpasswordField.text)!).isEmpty{
        let dialogMessage = UIAlertController(title: "Thank You", message: "Registered Successfully!", preferredStyle: .alert)
            
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                
            let vc4 = Screen4()
            self.navigationController?.pushViewController(vc4, animated: true)
                })
           dialogMessage.addAction(ok)
           self.present(dialogMessage, animated: true, completion: nil)
    }
        else{
        
        let dialogMessage = UIAlertController(title: "Alert", message: "All Fields are mandatory", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                       //print("Ok button tapped")
        })
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
        }
        
       
    }
}

// MARK: Screen 4 -- LogIn Page

class Screen4:UIViewController{
    
    let usernameField = UITextField()
    let passwordField = UITextField()
    
    let btnLogIn2 = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        title = "Log In"
        
        usernameField.frame = CGRect(x: 30, y: 150, width: 350, height: 50)
        usernameField.placeholder = " UserName"
        usernameField.layer.borderWidth = 0.5
        usernameField.backgroundColor = .white
        view.addSubview(usernameField)
        
        passwordField.frame = CGRect(x: 30, y: 250, width: 350, height: 50)
        passwordField.placeholder = " Enter password"
        passwordField.layer.borderWidth = 0.5
        passwordField.backgroundColor = .white
        view.addSubview(passwordField)
        
        btnLogIn2.setTitle("Log In", for: .normal)
        btnLogIn2.backgroundColor = .systemGreen
        btnLogIn2.setTitleColor(.white, for: .normal)
        btnLogIn2.frame = CGRect(x: 30, y: 500, width: 350, height: 52)
        view.addSubview(btnLogIn2)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(goToHome))
        
    }
    @objc func goToHome(){
        navigationController?.popToRootViewController(animated: true)
    }
    
}
