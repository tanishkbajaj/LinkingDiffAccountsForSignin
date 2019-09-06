//
//  DispViewController.swift
//  UserAuthPersonal
//
//  Created by IMCS2 on 9/6/19.
//  Copyright © 2019 Tanishk. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class DispViewController: UIViewController {

    
    @IBAction func signOutButton(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signOut()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
