//
//  HomeSellViewController.swift
//  Task Manager
//
//  Created by CAMSMAC on 17/12/18.
//  Copyright © 2018 cams. All rights reserved.
//

import UIKit

class HomeSellViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var str_user = ""
    var str_Category = ""
    var str_contact = ""
    
    var ItemName: [String] = []
    var ItemUser: [String] = []
    var ItemPrice: [String] = []
    var ItemCategory: [String] = []
    var ItemDesc: [String] = []
    var ItemUserContact: [String] = []
    
    var UserItem: [Int] = []
    
    @IBOutlet weak var segmentView: UISegmentedControl!
    @IBOutlet weak var label_Category: UILabel!
    @IBOutlet weak var table_Sell: UITableView!
    @IBOutlet weak var collection_Sell: UICollectionView!
    
    @IBAction func action_Segment(_ sender: UISegmentedControl) {
        switch segmentView.selectedSegmentIndex {
        case 0:
            table_Sell.isHidden = false
            collection_Sell.isHidden = true
            table_Sell.reloadData()
        case 1:
            collection_Sell.isHidden = false
            table_Sell.isHidden = true
            collection_Sell.reloadData()
        default:
            print("Default")
        }
    }
    
    @IBAction func action_Add(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let userRegister = storyBoard.instantiateViewController(withIdentifier: "InsertNew") as! InsertNewViewController
        userRegister.str_key = str_user
        userRegister.str_category = str_Category
        userRegister.str_user_contact = str_contact
        self.present(userRegister, animated: true, completion: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return UserItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SellCell", for: indexPath) as! ItemCollectionViewCell
        
        cell.label_Name.text = ItemName[UserItem[indexPath.row]]
        cell.label_Desc.text = ItemDesc[UserItem[indexPath.row]]
        cell.label_Price.text = "$" + ItemPrice[UserItem[indexPath.row]]
        cell.layer.backgroundColor = UIColor.lightGray.cgColor
        
        cell.label_Name.adjustsFontSizeToFitWidth = true
        cell.label_Desc.adjustsFontSizeToFitWidth = true
        cell.label_Price.adjustsFontSizeToFitWidth = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let userRegister = storyBoard.instantiateViewController(withIdentifier: "ItemSell") as! ItemSellViewController
        
        userRegister.item_Category = ItemCategory[UserItem[indexPath.row]]
        userRegister.item_User = ItemUser[UserItem[indexPath.row]]
        userRegister.item_Price = ItemPrice[UserItem[indexPath.row]]
        userRegister.item_Name = ItemName[UserItem[indexPath.row]]
        userRegister.item_Desc = ItemDesc[UserItem[indexPath.row]]
        userRegister.item_Contact = ItemUserContact[UserItem[indexPath.row]]
        
        self.present(userRegister, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ItemTableViewCell
        
        cell.label_Name.text = ItemName[UserItem[indexPath.row]]
        cell.label_Desc.text = ItemDesc[UserItem[indexPath.row]]
        cell.label_Price.text = "$" + ItemPrice[UserItem[indexPath.row]]
        
        cell.label_Name.adjustsFontSizeToFitWidth = true
        cell.label_Desc.adjustsFontSizeToFitWidth = true
        cell.label_Price.adjustsFontSizeToFitWidth = true
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let userRegister = storyBoard.instantiateViewController(withIdentifier: "ItemSell") as! ItemSellViewController
        
        userRegister.item_Category = ItemCategory[UserItem[indexPath.row]]
        userRegister.item_User = ItemUser[UserItem[indexPath.row]]
        userRegister.item_Price = ItemPrice[UserItem[indexPath.row]]
        userRegister.item_Name = ItemName[UserItem[indexPath.row]]
        userRegister.item_Desc = ItemDesc[UserItem[indexPath.row]]
        userRegister.item_Contact = ItemUserContact[UserItem[indexPath.row]]
        
        self.present(userRegister, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        UserItem = []
        label_Category.text = str_Category
        
        switch segmentView.selectedSegmentIndex {
        case 0:
            table_Sell.isHidden = false
            collection_Sell.isHidden = true
            table_Sell.reloadData()
        case 1:
            collection_Sell.isHidden = false
            table_Sell.isHidden = true
            collection_Sell.reloadData()
        default:
            print("Default")
        }
        
        table_Sell.reloadData()
        collection_Sell.reloadData()
        
        ItemDesc = UserDefaults.standard.stringArray(forKey: "ItemDescArray") ?? [""]
        ItemName = UserDefaults.standard.stringArray(forKey: "ItemNameArray") ?? [""]
        ItemCategory = UserDefaults.standard.stringArray(forKey: "ItemCategoryArray") ?? [""]
        ItemPrice = UserDefaults.standard.stringArray(forKey: "ItemPriceArray") ?? [""]
        ItemUser = UserDefaults.standard.stringArray(forKey: "ItemUserArray") ?? [""]
        ItemUserContact = UserDefaults.standard.stringArray(forKey: "ItemUserContactArray") ?? [""]
        
        for i in 0...ItemUser.count - 1
        {
            if(ItemUser[i] == str_user && ItemCategory[i] == str_Category)
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
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 103
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
