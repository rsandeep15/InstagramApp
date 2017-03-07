//
//  LoginViewController.swift
//  InstagramApp
//
//  Created by Sandeep Raghunandhan on 3/7/17.
//  Copyright © 2017 Sandeep Raghunandhan. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInAction(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: username.text!, password: password.text!) { (success: PFUser?, error: Error?) in
            if (success != nil) {
                print("Logged In!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print(error?.localizedDescription)
            }
        }
        
        
    }
    @IBAction func signUpAction(_ sender: Any) {
        
        let newUser = PFUser()
        
        newUser.username = username.text
        newUser.password = password.text
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success {
                print("Yay, created a user")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else {
                print(error?.localizedDescription)
                
            }
            
            
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
