//
//  HomeSellViewController.swift
//  Task Manager
//
//  Created by CAMSMAC on 17/12/18.
//  Copyright © 2018 cams. All rights reserved.
//

import UIKit

class HomeSellViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var str_user = ""
    
    var ItemName: [String] = []
    var ItemUser: [String] = []
    var ItemPrice: [String] = []
    var ItemCategory: [String] = []
    var ItemDesc: [String] = []
    
    var UserItem: [Int] = []
    
    @IBOutlet weak var table_Sell: UITableView!
    
    @IBAction func action_Add(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let userRegister = storyBoard.instantiateViewController(withIdentifier: "InsertNew") as! InsertNewViewController
        userRegister.str_key = str_user
        self.present(userRegister, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = ItemName[UserItem[indexPath.row]]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let userRegister = storyBoard.instantiateViewController(withIdentifier: "Item") as! ItemViewController
        
        userRegister.item_Category = ItemCategory[UserItem[indexPath.row]]
        userRegister.item_User = ItemUser[UserItem[indexPath.row]]
        userRegister.item_Price = "$" + ItemPrice[UserItem[indexPath.row]]
        userRegister.item_Name = ItemName[UserItem[indexPath.row]]
        userRegister.item_Desc = ItemDesc[UserItem[indexPath.row]]
        
        self.present(userRegister, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        UserItem = []
        
        ItemDesc = UserDefaults.standard.stringArray(forKey: "ItemDescArray") ?? [""]
        ItemName = UserDefaults.standard.stringArray(forKey: "ItemNameArray") ?? [""]
        ItemCategory = UserDefaults.standard.stringArray(forKey: "ItemCategoryArray") ?? [""]
        ItemPrice = UserDefaults.standard.stringArray(forKey: "ItemPriceArray") ?? [""]
        ItemUser = UserDefaults.standard.stringArray(forKey: "ItemUserArray") ?? [""]
        
        for i in 1...ItemUser.count - 1
        {
            if(ItemUser[i] == str_user)
            {
                UserItem.append(i)
            }
        }
        
        print(ItemUser)
        print(ItemCategory)
        print(ItemPrice)
        print(ItemName)
        print(ItemDesc)
        print(UserItem)
        
        table_Sell.reloadData()
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
