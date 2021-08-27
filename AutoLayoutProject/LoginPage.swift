//
//  LoginPage.swift
//  AutoLayoutProject
//
//  Created by Jyoti1 Yadav on 24/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

import UIKit

class LoginPage: UIViewController {
    
    let emailField = UITextField()
    let passwordField = UITextField()
    let logInBtn = UIButton()
    let signUpBtn = UIButton()
    let helpBtn = UIButton()
    let iconView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 74.0/255.0, green: 118.0/255.0, blue: 183.0/255.0, alpha: 1)
        
        passwordField.backgroundColor = .white
        passwordField.placeholder = "Password"
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        emailField.backgroundColor = .white
        emailField.placeholder = "Email or Phone Number"
        emailField.translatesAutoresizingMaskIntoConstraints = false
        
        logInBtn.backgroundColor = UIColor(red: 47.0/255.0, green: 75.0/255.0, blue: 116.0/255.0, alpha: 1)
        logInBtn.setTitle("log In", for: .normal)
        logInBtn.translatesAutoresizingMaskIntoConstraints = false
        
        helpBtn.setTitle("Need Help?", for: .normal)
        helpBtn.setTitleColor(.white, for: .normal)
        helpBtn.translatesAutoresizingMaskIntoConstraints = false
        
        signUpBtn.setTitle("SignUp for FriendBook", for: .normal)
        signUpBtn.setTitleColor(.white, for: .normal)
        signUpBtn.translatesAutoresizingMaskIntoConstraints = false
        
        iconView.image = UIImage(systemName: "f.cursive")
        iconView.tintColor = .white
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(passwordField)
        view.addSubview(emailField)
        view.addSubview(logInBtn)
        view.addSubview(helpBtn)
        view.addSubview(signUpBtn)
        view.addSubview(iconView)
        addConstraints()

        
    }
    
    func addConstraints(){
        var constraints = [NSLayoutConstraint]()
        
        // Constraints for Password Field
        
        constraints.append(passwordField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16))
        constraints.append(passwordField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -16))
        constraints.append(passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(passwordField.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        constraints.append(passwordField.heightAnchor.constraint(equalToConstant: 34))
        
        //Constraints for Email Field
        
        constraints.append(emailField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16))
        constraints.append(emailField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -16))
        constraints.append(emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(emailField.bottomAnchor.constraint(equalTo: passwordField.topAnchor, constant: -17))
        constraints.append(emailField.heightAnchor.constraint(equalToConstant: 34))
        
        //LogIn Button Constraints
        constraints.append(logInBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16))
        constraints.append(logInBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -16))
        constraints.append(logInBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(logInBtn.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 25))
        constraints.append(logInBtn.heightAnchor.constraint(equalToConstant: 40))
        
        //helpbtn Constraints
        
        constraints.append(helpBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -55))
        constraints.append(helpBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor))
         constraints.append(helpBtn.heightAnchor.constraint(equalToConstant: 30))
         constraints.append(helpBtn.widthAnchor.constraint(equalToConstant: 236))
        
        // signUpBtn Constraints
        
        constraints.append(signUpBtn.bottomAnchor.constraint(equalTo: helpBtn.topAnchor, constant: -17))
        constraints.append(signUpBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor))
         constraints.append(signUpBtn.heightAnchor.constraint(equalToConstant: 30))
         constraints.append(signUpBtn.widthAnchor.constraint(equalToConstant: 236))
        
        //iconView Constraints
        
        constraints.append(iconView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(iconView.heightAnchor.constraint(equalToConstant: 170))
        constraints.append(iconView.widthAnchor.constraint(equalToConstant: 200))
        constraints.append(iconView.bottomAnchor.constraint(equalTo: emailField.topAnchor, constant: -60))
        
        
        NSLayoutConstraint.activate(constraints)
        
    
    }
    

   

}
