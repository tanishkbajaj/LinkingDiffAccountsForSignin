//
//  ViewController.swift
//  UserAuthPersonal
//
//  Created by IMCS2 on 9/5/19.
//  Copyright © 2019 Tanishk. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import Firebase

class ViewController: UIViewController {
    
    
    
    
    
    @IBOutlet weak var signInSelector: UISegmentedControl!
    
    
    @IBOutlet weak var signInLabel: UILabel!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var signInButton: UIButton!
    
    var isSignIn: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
      // setupGoogleButton()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
    }
    


    
    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        
        isSignIn = !isSignIn
        if isSignIn {
            signInLabel.text = "Sign In"
            signInButton.setTitle("Sign In", for: .normal)
        }
        else {
            signInLabel.text = "Register"
            signInButton.setTitle("Register", for: .normal)
        }
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        if let email = emailTextField.text, let pass = passwordTextField.text {
        if isSignIn {
            
            
            Auth.auth().signIn(withEmail: email, password: pass) { [weak self] user, error in
                guard let strongSelf = self else { return }
                if let u = user  {
                    self!.performSegue(withIdentifier: "home", sender: self)
                }
                else {
                   
                }
            }
            
        }
        else {
            
            Auth.auth().createUser(withEmail: email, password: pass) { authResult, error in
               
                if let u = authResult {
                   self.performSegue(withIdentifier: "home", sender: self)
                }
                else {
                   
                }
            }
            
        }
        }
    }
    

}


