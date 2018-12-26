//
//  ItemViewController.swift
//  Task Manager
//
//  Created by CAMSMAC on 18/12/18.
//  Copyright © 2018 cams. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    var item_Name = ""
    var item_Desc = ""
    var item_Price = ""
    var item_Seller = ""
    var item_Category = ""
    var item_Contact = ""
    var item_Buyer = ""
    
    var cartUser: [String] = []
    var cartItemName: [String] = []
    var cartItemQuan: [String] = []
    var cartItemPrice: [String] = []
    var cartItemDesc: [String] = []
    var cartItemContact: [String] = []
    var cartItemCate: [String] = []
    var cartItemSeller: [String] = []
    
    @IBOutlet weak var label_add: UILabel!
    @IBOutlet weak var label_Contact: UILabel!
    @IBOutlet weak var label_Price: UILabel!
    @IBOutlet weak var label_Desc: UILabel!
    @IBOutlet weak var label_Seller: UILabel!
    @IBOutlet weak var label_Category: UILabel!
    @IBOutlet weak var label_Name: UILabel!
    @IBOutlet weak var label_Quantity: UILabel!
    @IBOutlet weak var label_Total: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBAction func action_step(_ sender: UIStepper) {
        label_Quantity.text = Int(sender.value).description
        
        let quantity = Int(label_Quantity.text!)
        let price = Int(item_Price)
        label_Total.text = "$" + String(price! * quantity!)
    }
    
    @IBAction func action_add_cart(_ sender: Any) {
        
        cartUser.append(item_Buyer)
        cartItemCate.append(item_Category)
        cartItemDesc.append(item_Desc)
        cartItemName.append(item_Name)
        cartItemQuan.append(label_Quantity.text!)
        cartItemPrice.append(item_Price)
        cartItemContact.append(item_Contact)
        cartItemSeller.append(item_Seller)
        
        label_add.isHidden = false
        
        UserDefaults.standard.set(cartUser, forKey: "cartUser")
        UserDefaults.standard.set(cartItemName, forKey: "cartItemName")
        UserDefaults.standard.set(cartItemQuan, forKey: "cartItemQuan")
        UserDefaults.standard.set(cartItemCate, forKey: "cartItemCate")
        UserDefaults.standard.set(cartItemDesc, forKey: "cartItemDesc")
        UserDefaults.standard.set(cartItemPrice, forKey: "cartItemPrice")
        UserDefaults.standard.set(cartItemContact, forKey: "cartItemContact")
        UserDefaults.standard.set(cartItemSeller, forKey: "cartItemSeller")
    
    }
    
    @IBAction func action_back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func action_Cart(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let userRegister = storyBoard.instantiateViewController(withIdentifier: "Cart") as! CartViewController
        
        userRegister.user = item_Buyer
        
        self.present(userRegister, animated: true, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        label_Desc.text = item_Desc
        label_Name.text = item_Name
        label_Price.text = "$" + item_Price
        label_Seller.text = item_Seller
        label_Category.text = item_Category
        label_Contact.text = item_Contact
        label_Quantity.text = String(1)
        label_Total.text = "$" + item_Price
        
        stepper.value = 1
        
        stepper.wraps = true
        stepper.autorepeat = true
        
        cartUser = UserDefaults.standard.stringArray(forKey: "cartUser") ?? [""]
        cartItemName = UserDefaults.standard.stringArray(forKey: "cartItemName") ?? [""]
        cartItemQuan = UserDefaults.standard.stringArray(forKey: "cartItemQuan") ?? [""]
        cartItemPrice = UserDefaults.standard.stringArray(forKey: "cartItemPrice") ?? [""]
        cartItemDesc = UserDefaults.standard.stringArray(forKey: "cartItemDesc") ?? [""]
        cartItemContact = UserDefaults.standard.stringArray(forKey: "cartItemContact") ?? [""]
        cartItemCate = UserDefaults.standard.stringArray(forKey: "cartItemCate") ?? [""]
        cartItemSeller = UserDefaults.standard.stringArray(forKey: "cartItemSeller") ?? [""]
        
        label_add.isHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
