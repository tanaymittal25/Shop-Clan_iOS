//
//  InsertNewViewController.swift
//  Task Manager
//
//  Created by CAMSMAC on 17/12/18.
//  Copyright © 2018 cams. All rights reserved.
//

import UIKit

class InsertNewViewController: UIViewController, UITextFieldDelegate{
    
    
    var str_key = ""
    var str_category = ""
    var str_user_contact = ""
    
    @IBOutlet weak var text_Desc: UITextField!
    @IBOutlet weak var text_Price: UITextField!
    @IBOutlet weak var text_Name: UITextField!
    @IBOutlet weak var label_Category: UILabel!
    @IBOutlet weak var label_invalid: UILabel!
    
    var ItemName: [String] = []
    var ItemUser: [String] = []
    var ItemPrice: [String] = []
    var ItemCategory: [String] = []
    var ItemDesc: [String] = []
    var ItemUserContact: [String] = []
    var ItemSeller: [String] = []
    
    @IBAction func action_AddItem(_ sender: Any) {
    
        if(text_Desc.text != "" && text_Name.text != "" && text_Price.text != "")
        {
            ItemCategory.append(str_category)
            ItemUser.append(str_key)
            ItemPrice.append(text_Price.text!)
            ItemName.append(text_Name.text!)
            ItemDesc.append(text_Desc.text!)
            ItemUserContact.append(str_user_contact)
            
            UserDefaults.standard.set(ItemDesc, forKey: "ItemDescArray")
            UserDefaults.standard.set(ItemName, forKey: "ItemNameArray")
            UserDefaults.standard.set(ItemCategory, forKey: "ItemCategoryArray")
            UserDefaults.standard.set(ItemPrice, forKey: "ItemPriceArray")
            UserDefaults.standard.set(ItemUser, forKey: "ItemUserArray")
            UserDefaults.standard.set(ItemUserContact, forKey: "ItemUserContactArray")
    
            dismiss(animated: true, completion: nil)
        }
        else
        {
            label_invalid.isHidden = false
        }
        
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func action_Back(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        text_Name.delegate = self
        text_Desc.delegate = self
        text_Price.delegate = self
        
        label_invalid.isHidden = true
        label_Category.text = str_category
        
        ItemDesc = UserDefaults.standard.stringArray(forKey: "ItemDescArray") ?? [""]
        ItemName = UserDefaults.standard.stringArray(forKey: "ItemNameArray") ?? [""]
        ItemCategory = UserDefaults.standard.stringArray(forKey: "ItemCategoryArray") ?? [""]
        ItemPrice = UserDefaults.standard.stringArray(forKey: "ItemPriceArray") ?? [""]
        ItemUser = UserDefaults.standard.stringArray(forKey: "ItemUserArray") ?? [""]
        ItemUserContact = UserDefaults.standard.stringArray(forKey: "ItemUserContactArray") ?? [""]
        
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
