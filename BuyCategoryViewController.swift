//
//  BuyCategoryViewController.swift
//  Task Manager
//
//  Created by CAMSMAC on 18/12/18.
//  Copyright © 2018 cams. All rights reserved.
//

import UIKit

class BuyCategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var str_Category = ""
    
    var ItemName: [String] = []
    var ItemUser: [String] = []
    var ItemPrice: [String] = []
    var ItemCategory: [String] = []
    var ItemDesc: [String] = []
    
    var CategoryItem: [Int] = []
    
    @IBOutlet weak var table_Category: UITableView!
    
    @IBAction func action_Back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CategoryItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BuyCategoryCell", for: indexPath)
        cell.textLabel?.text = ItemName[CategoryItem[indexPath.row]]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let userRegister = storyBoard.instantiateViewController(withIdentifier: "Item") as! ItemViewController
        
        userRegister.item_Category = ItemCategory[CategoryItem[indexPath.row]]
        userRegister.item_User = ItemUser[CategoryItem[indexPath.row]]
        userRegister.item_Price = "$" + ItemPrice[CategoryItem[indexPath.row]]
        userRegister.item_Name = ItemName[CategoryItem[indexPath.row]]
        userRegister.item_Desc = ItemDesc[CategoryItem[indexPath.row]]
        
        self.present(userRegister, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        CategoryItem = []
    
        ItemDesc = UserDefaults.standard.stringArray(forKey: "ItemDescArray") ?? [""]
        ItemName = UserDefaults.standard.stringArray(forKey: "ItemNameArray") ?? [""]
        ItemCategory = UserDefaults.standard.stringArray(forKey: "ItemCategoryArray") ?? [""]
        ItemPrice = UserDefaults.standard.stringArray(forKey: "ItemPriceArray") ?? [""]
        ItemUser = UserDefaults.standard.stringArray(forKey: "ItemUserArray") ?? [""]
        
        for i in 1...ItemCategory.count-1
        {
            if(ItemCategory[i] == str_Category)
            {
                CategoryItem.append(i)
            }
        }

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
