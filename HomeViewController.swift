//
//  HomeViewController.swift
//  Task Manager
//
//  Created by CAMSMAC on 17/12/18.
//  Copyright © 2018 cams. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var str_name = ""
    var str_email = ""
    var str_user = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func action_Logout(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func action_Sell(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let userRegister = storyBoard.instantiateViewController(withIdentifier: "HomeSell") as! HomeSellViewController
        userRegister.str_user = str_user
        self.present(userRegister, animated: true, completion: nil)
    }
    
    @IBAction func action_Buy(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let userRegister = storyBoard.instantiateViewController(withIdentifier: "HomeBuy") as! HomeBuyViewController
        self.present(userRegister, animated: true, completion: nil)
        
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
