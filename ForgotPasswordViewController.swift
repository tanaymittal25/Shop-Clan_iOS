//
//  ForgotPasswordViewController.swift
//  Task Manager
//
//  Created by CAMSMAC on 14/12/18.
//  Copyright © 2018 cams. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    
    var Email: [String] = []
    var User: [String] = []
    var Name: [String] = []
    var Password: [String] = []

    @IBOutlet weak var btn_continue: UIButton!
    @IBOutlet weak var label_invalid: UILabel!
    @IBOutlet weak var text_Password: UITextField!
    @IBOutlet weak var text_Name: UITextField!
    @IBOutlet weak var text_User: UITextField!
    @IBOutlet weak var text_Email: UITextField!
    @IBOutlet weak var text_Confirm: UITextField!
    @IBAction func action_Back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func action_Continue(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func action_Change(_ sender: Any) {
        
        if(text_Name.text != "" && text_User.text != "" && text_Email.text != "" && text_Confirm.text != "" && text_Password.text != "" && text_Password.text == text_Confirm.text)
        {
            var flag = false
            var index = Int()
            for i in 0...Email.count - 1
            {
                if(Email[i] == text_Email.text)
                {
                    index = i
                    flag = true
                    break
                }
            }
            
            if(text_User.text == User[index] && text_Name.text == Name[index])
            {
                Password[index] = text_Password.text!
                label_invalid.text = "Password Changed.."
                label_invalid.isHidden = false
                UserDefaults.standard.set(Password, forKey: "PasswordArray")
                btn_continue.isHidden = false
            }
            else
            {
                flag = false
            }
            
            if(flag == false)
            {
                label_invalid.text = "Invalid Details.."
                label_invalid.isHidden = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Email = UserDefaults.standard.stringArray(forKey: "EmailArray") ?? [""]
        User = UserDefaults.standard.stringArray(forKey: "UserArray") ?? [""]
        Name = UserDefaults.standard.stringArray(forKey: "NameArray") ?? [""]
        Password = UserDefaults.standard.stringArray(forKey: "PasswordArray") ?? [""]
        label_invalid.isHidden = true
        btn_continue.isHidden = true
        
        print(Email)
        print(User)
        print(Name)
        print(Password)
        
         // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
