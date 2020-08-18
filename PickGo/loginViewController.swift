//
//  ViewController.swift
//  PickGo
//
//  Created by Lily on 3/20/18.
//  Copyright © 2018 Lily. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userName.delegate = self
        password.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UITextFieldDelegate
    //called when return key pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    //called when user click outside the view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        // Finish text field editing
        view.endEditing(true)
    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
        guard let user = userName.text, !user.isEmpty else {
            errorMessage.text = "You must enter a value for user name!!"
            return
        }
        
        guard let password = password.text, !password.isEmpty else {
            errorMessage.text = "You must enter a value for password!!"
            return
        }
        
        Auth.auth().signIn(withEmail: user, password: password) { (user, error) in
            //have some issue
            if error != nil {
                self.errorMessage.text = "Your password is invalid !!"

            } else {
                self.performSegue(withIdentifier: "do_signin", sender: nil)
                self.errorMessage.text = "Success !!"
            }
        }

    }
}
