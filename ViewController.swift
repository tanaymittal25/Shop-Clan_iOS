//
//  ViewController.swift
//  Task Manager
//
//  Created by CAMSMAC on 12/12/18.
//  Copyright © 2018 cams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var Email: [String] = []
    var Password: [String] = []
    var Name: [String] = []
    var User: [String] = []
    
    @IBOutlet weak var label_invalid: UILabel!
    @IBOutlet weak var text_Password: UITextField!
    @IBOutlet weak var text_Email: UITextField!
    
    @IBAction func action_ForgotPassword(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let userRegister = storyBoard.instantiateViewController(withIdentifier: "ForgotPassword") as! ForgotPasswordViewController
        self.present(userRegister, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        label_invalid.isHidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func action_Signup(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let userRegister = storyBoard.instantiateViewController(withIdentifier: "Register") as! RegisterViewController
        self.present(userRegister, animated: true, completion: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        text_Email.text = ""
        text_Password.text = ""
    }
    
    @IBAction func action_Login(_ sender: Any) {
        
        Email = UserDefaults.standard.stringArray(forKey: "EmailArray") ?? [""]
        Password = UserDefaults.standard.stringArray(forKey: "PasswordArray") ?? [""]
        Name = UserDefaults.standard.stringArray(forKey: "NameArray") ?? [""]
        User = UserDefaults.standard.stringArray(forKey: "UserArray") ?? [""]
        
        print(Email)
        print(Password)
        
        var flag = -1
        
        if(Email.count == 1)
        {
            label_invalid.isHidden = false
            return
        }
        
        for i in 0...Email.count - 1
        {
            if(text_Email.text == Email[i])
            {
                flag = i
                break
            }
        }
        
        if(flag == -1)
        {
            label_invalid.isHidden = false
        }
        else if(text_Password.text == Password[flag] && text_Email.text == Email[flag])
        {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let userRegister = storyBoard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
            userRegister.str_user = User[flag]
            userRegister.str_email = Email[flag]
            userRegister.str_name = Name[flag]
            self.present(userRegister, animated: true, completion: nil)
        }
        else {
            label_invalid.isHidden = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

