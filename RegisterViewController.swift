//
//  RegisterViewController.swift
//  Task Manager
//
//  Created by CAMSMAC on 13/12/18.
//  Copyright © 2018 cams. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate {
    
    var Email: [String] = []
    var Password: [String] = []
    var Name: [String] = []
    var User: [String] = []
    var City: [String] = []
    var DOB: [String] = []
    var Contact: [String] = []
    
    var selectedDate = String()
    var maximumdate = NSDate()
    
    let scroll = UIScrollView()
    
    @IBOutlet weak var lbl_DOB: UILabel!
    @IBOutlet weak var label_old: UILabel!
    @IBOutlet weak var text_Name: UITextField!
    @IBOutlet weak var text_UserID: UITextField!
    @IBOutlet weak var text_Email: UITextField!
    @IBOutlet weak var text_Contact: UITextField!
    @IBOutlet weak var text_Password: UITextField!
    @IBOutlet weak var text_Password2: UITextField!
    @IBOutlet weak var text_City: UITextField!
    @IBOutlet weak var btn_Done: UIButton!
    @IBOutlet weak var btn_Cancel: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func action_Register(_ sender: Any) {
        
        if(text_Email.text != "" && text_Password2.text != "" && text_Password.text != "" && text_Name.text != "" && text_UserID.text != "" && text_City.text != "" && lbl_DOB.text != "" && text_Password.text == text_Password2.text && text_Contact.text?.count == 10)
        {
            var flag = false
            
            for i in 0...Email.count - 1
            {
                if(Email[i] == text_Email.text)
                {
                    label_old.isHidden = false
                    flag = true
                    return
                }
            }
            
            for i in 0...User.count - 1
            {
                if(User[i] == text_UserID.text)
                {
                    label_old.isHidden = false
                    flag = true
                    return
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
                Contact.append(text_Contact.text!)
                
                UserDefaults.standard.set(Email, forKey: "EmailArray")
                UserDefaults.standard.set(Password, forKey: "PasswordArray")
                UserDefaults.standard.set(Name, forKey: "NameArray")
                UserDefaults.standard.set(User, forKey: "UserArray")
                UserDefaults.standard.set(City, forKey: "CityArray")
                UserDefaults.standard.set(DOB, forKey: "DOBArray")
                UserDefaults.standard.set(Contact, forKey: "ContactArray")
                
                self.dismiss(animated: true, completion: nil)
                
            }
        }
        else {
            label_old.isHidden = false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    
    @IBAction func action_Clear(_ sender: Any) {
        
        text_City.text = ""
        text_Name.text = ""
        text_Email.text = ""
        text_UserID.text = ""
        text_Password.text = ""
        text_Password2.text = ""
        text_Contact.text = ""
    
    }
    
    @IBAction func action_Login(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    /*    view.addSubview(scroll)
        scroll.addSubview(lbl_DOB)
        scroll.addSubview(label_old)
        scroll.addSubview(text_Name)
        scroll.addSubview(text_UserID)
        scroll.addSubview(text_Email)
        scroll.addSubview(text_Contact)
        scroll.addSubview(text_Password)
        scroll.addSubview(text_Password2)
        scroll.addSubview(text_City)
        scroll.addSubview(btn_Done)
        scroll.addSubview(datePicker)
        scroll.addSubview(btn_Cancel)
        
        scroll.isScrollEnabled = true
        scroll.delegate = self
        
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scroll.widthAnchor.constraint(equalToConstant: self.view.frame.size.width).isActive = true
        scroll.heightAnchor.constraint(equalToConstant: self.view.frame.size.height).isActive = true
        scroll.contentSize = CGSize(width: self.view.frame.size.width, height: 1000)*/
        
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
        Contact = UserDefaults.standard.stringArray(forKey: "ContactArray") ?? [""]
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(clickDOB))
        lbl_DOB.isUserInteractionEnabled = true
        lbl_DOB.addGestureRecognizer(tapgesture)
        
        text_Name.delegate = self
        text_Email.delegate = self
        text_UserID.delegate = self
        text_Contact.delegate = self
        text_Password.delegate = self
        text_Password2.delegate = self
        text_City.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

        // Do any additional setup after loading the view.
    }

    @IBAction func action_Date(_ sender: UIDatePicker) {
    
        datePicker.datePickerMode = .date
        datePicker.maximumDate = maximumdate as Date
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd-MM-YYYY"
        selectedDate = dateFormat.string(from: sender.date as Date)
     
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
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
            let frame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            else {
                return
        }
        
        let content = UIEdgeInsets(top: 0, left: 0, bottom: frame.height, right: 0)
        scroll.contentInset = content
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scroll.contentInset = .zero
        scroll.scrollIndicatorInsets = .zero
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
