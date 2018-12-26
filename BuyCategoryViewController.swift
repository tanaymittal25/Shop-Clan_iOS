//
//  BuyCategoryViewController.swift
//  Task Manager
//
//  Created by CAMSMAC on 18/12/18.
//  Copyright © 2018 cams. All rights reserved.
//

import UIKit

class BuyCategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UICollectionViewDelegate, UICollectionViewDataSource {
    
    var str_Category = ""
    var str_user = ""
    
    var ItemName: [String] = []
    var ItemSeller: [String] = []
    var ItemPrice: [String] = []
    var ItemCategory: [String] = []
    var ItemDesc: [String] = []
    var ItemUserContact: [String] = []
    
    var CategoryItem: [Int] = []
    
    @IBOutlet weak var collection_Category: UICollectionView!
    @IBOutlet weak var table_Category: UITableView!
    @IBOutlet weak var label_Category: UILabel!
    @IBOutlet weak var segmentView: UISegmentedControl!
    
    @IBAction func action_Segment(_ sender: UISegmentedControl) {
        switch segmentView.selectedSegmentIndex {
        case 0:
            table_Category.isHidden = false
            collection_Category.isHidden = true
            table_Category.reloadData()
        case 1:
            collection_Category.isHidden = false
            table_Category.isHidden = true
            collection_Category.reloadData()
        default:
            print("Default")
        }
    }
    
    @IBAction func action_Back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CategoryItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BuyCell", for: indexPath) as! ItemCollectionViewCell
        
        cell.label_Name?.text = ItemName[CategoryItem[indexPath.row]]
        cell.label_Desc?.text = ItemDesc[CategoryItem[indexPath.row]]
        cell.label_Price?.text = "$" + ItemPrice[CategoryItem[indexPath.row]]
        
        cell.layer.backgroundColor = UIColor.lightGray.cgColor
        
        cell.label_Name.adjustsFontSizeToFitWidth = true
        cell.label_Desc.adjustsFontSizeToFitWidth = true
        cell.label_Price.adjustsFontSizeToFitWidth = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let userRegister = storyBoard.instantiateViewController(withIdentifier: "Item") as! ItemViewController
        
        userRegister.item_Category = ItemCategory[CategoryItem[indexPath.row]]
        userRegister.item_Seller = ItemSeller[CategoryItem[indexPath.row]]
        userRegister.item_Price = ItemPrice[CategoryItem[indexPath.row]]
        userRegister.item_Name = ItemName[CategoryItem[indexPath.row]]
        userRegister.item_Desc = ItemDesc[CategoryItem[indexPath.row]]
        userRegister.item_Contact = ItemUserContact[CategoryItem[indexPath.row]]
        userRegister.item_Buyer = str_user
        
        self.present(userRegister, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CategoryItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BuyCategoryCell", for: indexPath) as! ItemTableViewCell
        
        cell.label_Name?.text = ItemName[CategoryItem[indexPath.row]]
        cell.label_Desc?.text = ItemDesc[CategoryItem[indexPath.row]]
        cell.label_Price?.text = "$" + ItemPrice[CategoryItem[indexPath.row]]
        
        cell.label_Name.adjustsFontSizeToFitWidth = true
        cell.label_Desc.adjustsFontSizeToFitWidth = true
        cell.label_Price.adjustsFontSizeToFitWidth = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let userRegister = storyBoard.instantiateViewController(withIdentifier: "Item") as! ItemViewController
        
        userRegister.item_Category = ItemCategory[CategoryItem[indexPath.row]]
        userRegister.item_Seller = ItemSeller[CategoryItem[indexPath.row]]
        userRegister.item_Price = ItemPrice[CategoryItem[indexPath.row]]
        userRegister.item_Name = ItemName[CategoryItem[indexPath.row]]
        userRegister.item_Desc = ItemDesc[CategoryItem[indexPath.row]]
        userRegister.item_Contact = ItemUserContact[CategoryItem[indexPath.row]]
        userRegister.item_Buyer = str_user
        
        self.present(userRegister, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        label_Category.text = str_Category

        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        switch segmentView.selectedSegmentIndex {
        case 0:
            table_Category.isHidden = false
            collection_Category.isHidden = true
            table_Category.reloadData()
        case 1:
            collection_Category.isHidden = false
            table_Category.isHidden = true
            collection_Category.reloadData()
        default:
            print("Default")
        }
        
        table_Category.reloadData()
        collection_Category.reloadData()
        
        CategoryItem = []
    
        ItemDesc = UserDefaults.standard.stringArray(forKey: "ItemDescArray") ?? [""]
        ItemName = UserDefaults.standard.stringArray(forKey: "ItemNameArray") ?? [""]
        ItemCategory = UserDefaults.standard.stringArray(forKey: "ItemCategoryArray") ?? [""]
        ItemPrice = UserDefaults.standard.stringArray(forKey: "ItemPriceArray") ?? [""]
        ItemSeller = UserDefaults.standard.stringArray(forKey: "ItemUserArray") ?? [""]
        ItemUserContact = UserDefaults.standard.stringArray(forKey: "ItemUserContactArray") ?? [""]
        
        for i in 0...ItemCategory.count-1
        {
            if(ItemCategory[i] == str_Category)
            {
                CategoryItem.append(i)
            }
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 103
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
