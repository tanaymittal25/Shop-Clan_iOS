//
//  InsertNewViewController.swift
//  Task Manager
//
//  Created by CAMSMAC on 17/12/18.
//  Copyright © 2018 cams. All rights reserved.
//

import UIKit

class InsertNewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var str_key = ""
    
    var Category: [String] = ["Lifestyle", "Electronics", "Books", "Furniture", "Stationary", "Beauty", "Toys and Baby"]
    var ItemName: [String] = []
    var ItemUser: [String] = []
    var ItemPrice: [String] = []
    var ItemCategory: [String] = []
    var ItemDesc: [String] = []
    
    
    @IBOutlet weak var label_invalid: UILabel!
    @IBOutlet weak var table_Category: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Category.count
    
    }
    
    @IBAction func action_AddItem(_ sender: Any) {
    
        if(text_Category.text != "" && text_Desc.text != "" && text_Name.text != "" && text_Price.text != "")
        {
            ItemCategory.append(text_Category.text!)
            ItemUser.append(str_key)
            ItemPrice.append(text_Price.text!)
            ItemName.append(text_Name.text!)
            ItemDesc.append(text_Desc.text!)
            
            UserDefaults.standard.set(ItemDesc, forKey: "ItemDescArray")
            UserDefaults.standard.set(ItemName, forKey: "ItemNameArray")
            UserDefaults.standard.set(ItemCategory, forKey: "ItemCategoryArray")
            UserDefaults.standard.set(ItemPrice, forKey: "ItemPriceArray")
            UserDefaults.standard.set(ItemUser, forKey: "ItemUserArray")
    
            dismiss(animated: true, completion: nil)
        }
        else
        {
            label_invalid.isHidden = false
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InsertNewCell", for: indexPath)
        cell.textLabel?.text = Category[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        text_Category.text = Category[indexPath.row]
        table_Category.isHidden = true
    }
    
    
    @IBAction func action_Back(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func action_add(_ sender: Any) {
        table_Category.isHidden = false
    }
    
    @IBOutlet weak var text_Desc: UITextField!
    @IBOutlet weak var text_Price: UITextField!
    @IBOutlet weak var text_Name: UITextField!
    @IBOutlet weak var text_Category: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table_Category.isHidden = true
        label_invalid.isHidden = true
        table_Category.layer.borderColor = UIColor.black.cgColor
        table_Category.layer.borderWidth = 1
        
        ItemDesc = UserDefaults.standard.stringArray(forKey: "ItemDescArray") ?? [""]
        ItemName = UserDefaults.standard.stringArray(forKey: "ItemNameArray") ?? [""]
        ItemCategory = UserDefaults.standard.stringArray(forKey: "ItemCategoryArray") ?? [""]
        ItemPrice = UserDefaults.standard.stringArray(forKey: "ItemPriceArray") ?? [""]
        ItemUser = UserDefaults.standard.stringArray(forKey: "ItemUserArray") ?? [""]
        
      /*  let   Items1 = UserDefaults.standard.object(forKey: str_key) as? Data
        if Items1 != nil {
            Items = NSKeyedUnarchiver.unarchiveObject(with: Items1!) as! [ItemModel]
        }
 
        */
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
