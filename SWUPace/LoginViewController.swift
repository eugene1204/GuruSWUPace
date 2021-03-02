//
//  LoginViewController.swift
//  SWUPace
//
//  Created by yujin son on 2021/02/15.
//  Copyright © 2021 yujin son. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    let db = Database.database().reference()
    var id :String = ""
    var password :String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonClicked(_ sender: UITextField) {
        db.child("id").observeSingleEvent(of: .value) {snapshot in print("--> \(snapshot)")
            self.id = snapshot.value as? String ?? ""
        }
        db.child("password").observeSingleEvent(of: .value) {snapshot in print("--> \(snapshot)")
            self.password = snapshot.value as? String ?? ""
        }
        
        if idField.text! == self.id && passwordField.text! == self.password {
            self.performSegue(withIdentifier: "login", sender: self)
        }
    }
}

