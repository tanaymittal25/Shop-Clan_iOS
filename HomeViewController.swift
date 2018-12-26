//
//  HomeViewController.swift
//  Task Manager
//
//  Created by CAMSMAC on 17/12/18.
//  Copyright © 2018 cams. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var Category: [String] = ["Lifestyle", "Electronics", "Books", "Furniture", "Stationary", "Beauty", "Toys and Baby"]
    
    var str_name = ""
    var str_email = ""
    var str_user = ""
    var str_phone = ""

    @IBOutlet weak var segmentSelect: UISegmentedControl!
    @IBOutlet weak var table_Category: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellCaseSelect" , for: indexPath)
        cell.textLabel?.text = Category[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(segmentSelect.selectedSegmentIndex == 0)
        {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let userRegister = storyBoard.instantiateViewController(withIdentifier: "BuyCategory") as! BuyCategoryViewController
            userRegister.str_Category = Category[indexPath.row]
            userRegister.str_user = str_user
            self.present(userRegister, animated: true, completion: nil)
        }
        else if(segmentSelect.selectedSegmentIndex == 1)
        {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let userRegister = storyBoard.instantiateViewController(withIdentifier: "HomeSell") as! HomeSellViewController
            userRegister.str_user = str_user
            userRegister.str_contact = str_phone
            userRegister.str_Category = Category[indexPath.row]
            self.present(userRegister, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func action_Cart(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let userRegister = storyBoard.instantiateViewController(withIdentifier: "Cart") as! CartViewController
        
        userRegister.user = str_user
        
        self.present(userRegister, animated: true, completion: nil)
        
    }
    @IBAction func action_Logout(_ sender: Any) {
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
