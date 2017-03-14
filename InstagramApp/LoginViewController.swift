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
        if (!(username.text?.isEmpty)! && !(password.text?.isEmpty)!) {
            PFUser.logInWithUsername(inBackground: username.text!, password: password.text!) { (success: PFUser?, error: Error?) in
                if (success != nil) {
                    print("Logged In!")
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else {
                    let alert = UIAlertController(title: "Error", message: "Incorrect Password", preferredStyle: UIAlertControllerStyle.alert)
                    let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
                        // Default alert
                    })
                    alert.addAction(defaultAction)
                    self.present(alert, animated: true, completion: nil)
                    print(error?.localizedDescription ?? "Error Unavailable")
                }
            }
        }
        
        
    }
    @IBAction func signUpAction(_ sender: Any) {
        
        let newUser = PFUser()
        
        newUser.username = username.text
        newUser.password = password.text
        if (username.text != "" && password.text != "") {
            newUser.signUpInBackground { (success: Bool, error: Error?) in
                if success {
                    print("Yay, created a user")
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }else {
                    let alert = UIAlertController(title: "Error", message: "Incorrect Password", preferredStyle: UIAlertControllerStyle.alert)
                    let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
                        // Default alert
                    })
                    alert.addAction(defaultAction)
                    self.present(alert, animated: true, completion: nil)
                    print(error?.localizedDescription ?? "Error Unavailable")
                    
                }
                
            }
        }
        
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
