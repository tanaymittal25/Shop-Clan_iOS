//
//  RegisterViewController.swift
//  Task Manager
//
//  Created by CAMSMAC on 13/12/18.
//  Copyright © 2018 cams. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var Email: [String] = []
    var Password: [String] = []
    var Name: [String] = []
    var User: [String] = []
    var City: [String] = []
    var DOB: [String] = []
    var selectedDate = String()
    var maximumdate = NSDate()
    
    @IBOutlet weak var lbl_DOB: UILabel!
    @IBOutlet weak var label_old: UILabel!
    @IBOutlet weak var text_Name: UITextField!
    @IBOutlet weak var text_UserID: UITextField!
    @IBOutlet weak var text_Email: UITextField!
    @IBOutlet weak var text_Password: UITextField!
    @IBOutlet weak var text_Password2: UITextField!
    @IBOutlet weak var text_City: UITextField!
    @IBOutlet weak var btn_Done: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var btn_Cancel: UIButton!
    
    @IBAction func action_Register(_ sender: Any) {
        
        if(text_Email.text != "" && text_Password2.text != "" && text_Password.text != "" && text_Name.text != "" && text_UserID.text != "" && text_City.text != "" && lbl_DOB.text != "" && text_Password.text == text_Password2.text)
        {
            var flag = false
            
            for i in 0...Email.count - 1
            {
                if(Email[i] == text_Email.text)
                {
                    label_old.isHidden = false
                    flag = true
                    break
                }
            }
            
            for i in 0...User.count - 1
            {
                if(User[i] == text_UserID.text)
                {
                    label_old.isHidden = false
                    flag = true
                    break
                }
            }
            
            if(flag == false)
            {
                Email.append(text_Email.text!)
                Password.append(text_Password.text!)
                Name.append(text_Name.text!)
                City.append(text_City.text!)
                User.append(text_UserID.text!)
                DOB.append(lbl_DOB.text!)
                
                UserDefaults.standard.set(Email, forKey: "EmailArray")
                UserDefaults.standard.set(Password, forKey: "PasswordArray")
                UserDefaults.standard.set(Name, forKey: "NameArray")
                UserDefaults.standard.set(User, forKey: "UserArray")
                UserDefaults.standard.set(City, forKey: "CityArray")
                UserDefaults.standard.set(DOB, forKey: "DOBArray")
                
                self.dismiss(animated: true, completion: nil)
                
            }
        }
    }
    
    @IBAction func action_Clear(_ sender: Any) {
        
        text_City.text = ""
        text_Name.text = ""
        text_Email.text = ""
        text_UserID.text = ""
        text_Password.text = ""
        text_Password2.text = ""
    
    }
    
    @IBAction func action_Login(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label_old.isHidden = true
        datePicker.isHidden = true
        btn_Cancel.isHidden = true
        btn_Done.isHidden = true
        
        Email = UserDefaults.standard.stringArray(forKey: "EmailArray") ?? [""]
        Password = UserDefaults.standard.stringArray(forKey: "PasswordArray") ?? [""]
        Name = UserDefaults.standard.stringArray(forKey: "NameArray") ?? [""]
        User = UserDefaults.standard.stringArray(forKey: "UserArray") ?? [""]
        DOB = UserDefaults.standard.stringArray(forKey: "DOBArray") ?? [""]
        City = UserDefaults.standard.stringArray(forKey: "CityArray") ?? [""]
        
        let tapgeuster = UITapGestureRecognizer(target: self, action: #selector(clickDOB))
        lbl_DOB.isUserInteractionEnabled = true
        lbl_DOB.addGestureRecognizer(tapgeuster)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func action_Date(_ sender: UIDatePicker) {
    
        datePicker.datePickerMode = .date
        datePicker.maximumDate = maximumdate as Date
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd-MM-YYYY"
        selectedDate = dateFormat.string(from:sender.date as Date)
     
    }

    @IBAction func action_Done(_ sender: Any) {
        
        lbl_DOB.text = selectedDate
        datePicker.isHidden = true
        btn_Cancel.isHidden = true
        btn_Done.isHidden = true
        
    }
    
    @IBAction func action_Cancel(_ sender: Any) {
        
        datePicker.isHidden = true
        btn_Cancel.isHidden = true
        btn_Done.isHidden = true
    }
    
    @objc func clickDOB() {
        
        datePicker.isHidden = false
        btn_Done.isHidden = false
        btn_Cancel.isHidden = false
        datePicker.backgroundColor = UIColor.white
        
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
