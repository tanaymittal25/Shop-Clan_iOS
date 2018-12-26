//
//  CartViewController.swift
//  Task Manager
//
//  Created by CAMSMAC on 24/12/18.
//  Copyright © 2018 cams. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var user = ""
    
    var itemTotal: [Int] = []
    var Total = Int(0)
    var userIndex: [Int] = []
    
    var cartUser: [String] = []
    var cartItemName: [String] = []
    var cartItemQuan: [String] = []
    var cartItemPrice: [String] = []
    var cartItemDesc: [String] = []
    var cartItemContact: [String] = []
    var cartItemCate: [String] = []
    var cartItemSeller: [String] = []
    
    @IBOutlet weak var label_Total: UILabel!
    @IBOutlet weak var table_Cart: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userIndex.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell
        
        cell.label_Name.text = cartItemName[userIndex[indexPath.row]]
        cell.label_Quantity.text = "Quantity: " + cartItemQuan[userIndex[indexPath.row]]
        cell.label_Total.text = "$" + String(itemTotal[indexPath.row])
        
        cell.label_Name.adjustsFontSizeToFitWidth = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let userRegister = storyBoard.instantiateViewController(withIdentifier: "ItemSell") as! ItemSellViewController
        
        userRegister.item_Category = cartItemCate[userIndex[indexPath.row]]
        userRegister.item_User = cartItemSeller[userIndex[indexPath.row]]
        userRegister.item_Price = cartItemPrice[userIndex[indexPath.row]]
        userRegister.item_Name = cartItemName[userIndex[indexPath.row]]
        userRegister.item_Desc = cartItemDesc[userIndex[indexPath.row]]
        userRegister.item_Contact = cartItemContact[userIndex[indexPath.row]]
        
        self.present(userRegister, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        table_Cart.layer.borderColor = UIColor.black.cgColor
        table_Cart.layer.borderWidth = 1
        
        cartUser = UserDefaults.standard.stringArray(forKey: "cartUser") ?? [""]
        cartItemName = UserDefaults.standard.stringArray(forKey: "cartItemName") ?? [""]
        cartItemQuan = UserDefaults.standard.stringArray(forKey: "cartItemQuan") ?? [""]
        cartItemPrice = UserDefaults.standard.stringArray(forKey: "cartItemPrice") ?? [""]
        cartItemDesc = UserDefaults.standard.stringArray(forKey: "cartItemDesc") ?? [""]
        cartItemContact = UserDefaults.standard.stringArray(forKey: "cartItemContact") ?? [""]
        cartItemCate = UserDefaults.standard.stringArray(forKey: "cartItemCate") ?? [""]
        cartItemSeller = UserDefaults.standard.stringArray(forKey: "cartItemSeller") ?? [""]
        
        userIndex = []
        Total = 0
        itemTotal = []
        
        if(cartUser.count != 0)
        {
            for i in 0...cartUser.count-1
            {
                if(cartUser[i] == user)
                {
                    userIndex.append(i)
                }
            }
            
            print(cartUser)
            print(cartItemName)
            print(cartItemQuan)
            print(cartItemPrice)
            print(cartItemDesc)
            print(cartItemContact)
            print(cartItemCate)
            print(cartItemSeller)
            print(userIndex)
            
            for i in 0...userIndex.count-1
            {
                let quantity = Int(cartItemQuan[userIndex[i]])
                let price = Int(cartItemPrice[userIndex[i]])
                let total = quantity! * price!
                itemTotal.append(total)
                Total = Total + total
            }
            
            print(itemTotal)
            label_Total.text = "Total: $" + String(Total)
            
            table_Cart.reloadData()
        }
        else {
            label_Total.text = "Total: $0"
            return
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if(editingStyle == .delete)
        {
            cartUser.remove(at: indexPath.row)
            cartItemName.remove(at: indexPath.row)
            cartItemQuan.remove(at: indexPath.row)
            cartItemPrice.remove(at: indexPath.row)
            cartItemDesc.remove(at: indexPath.row)
            cartItemContact.remove(at: indexPath.row)
            cartItemCate.remove(at: indexPath.row)
            cartItemSeller.remove(at: indexPath.row)
            
            UserDefaults.standard.set(cartUser, forKey: "cartUser")
            UserDefaults.standard.set(cartItemName, forKey: "cartItemName")
            UserDefaults.standard.set(cartItemQuan, forKey: "cartItemQuan")
            UserDefaults.standard.set(cartItemCate, forKey: "cartItemCate")
            UserDefaults.standard.set(cartItemDesc, forKey: "cartItemDesc")
            UserDefaults.standard.set(cartItemPrice, forKey: "cartItemPrice")
            UserDefaults.standard.set(cartItemContact, forKey: "cartItemContact")
            UserDefaults.standard.set(cartItemSeller, forKey: "cartItemSeller")
            
            userIndex = []
            Total = 0
            itemTotal = []
            
            if(cartUser.count != 0)
            {
                for i in 0...cartUser.count-1
                {
                    if(cartUser[i] == user)
                    {
                        userIndex.append(i)
                    }
                }
            
                print(cartUser)
                print(cartItemName)
                print(cartItemQuan)
                print(cartItemPrice)
                print(cartItemDesc)
                print(cartItemContact)
                print(cartItemCate)
                print(cartItemSeller)
                print(userIndex)
            
                for i in 0...userIndex.count-1
                {
                    let quantity = Int(cartItemQuan[userIndex[i]])
                    let price = Int(cartItemPrice[userIndex[i]])
                    let total = quantity! * price!
                    itemTotal.append(total)
                    Total = Total + total
                }
            
                print(itemTotal)
                label_Total.text = "Total: $" + String(Total)
            
                table_Cart.reloadData()
            }
            else {
                label_Total.text = "Total: $0"
                return
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func action_Back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
