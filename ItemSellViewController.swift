//
//  ItemSellViewController.swift
//  Task Manager
//
//  Created by CAMSMAC on 24/12/18.
//  Copyright © 2018 cams. All rights reserved.
//

import UIKit

class ItemSellViewController: UIViewController {
    
    var item_Name = ""
    var item_Desc = ""
    var item_Price = ""
    var item_User = ""
    var item_Category = ""
    var item_Contact = ""
    
    @IBOutlet weak var label_Contact: UILabel!
    @IBOutlet weak var label_Price: UILabel!
    @IBOutlet weak var label_Desc: UILabel!
    @IBOutlet weak var label_Seller: UILabel!
    @IBOutlet weak var label_Category: UILabel!
    @IBOutlet weak var label_Name: UILabel!
    
    @IBAction func action_back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label_Desc.text = item_Desc
        label_Name.text = item_Name
        label_Price.text = "$" + item_Price
        label_Seller.text = item_User
        label_Category.text = item_Category
        label_Contact.text = item_Contact

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
