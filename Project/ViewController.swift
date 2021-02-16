//
//  ViewController.swift
//  Project
//
//  Created by english on 2020-11-26.
//  Copyright © 2020 Manan. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController , UIApplicationDelegate {
    

    @IBOutlet var unm: UITextField!
    @IBOutlet var pwd: UITextField!
    @IBOutlet var errMsg: UILabel!
    @IBAction func login(_ sender: UIButton)
    {
        let user = unm.text;
        let pass = pwd.text;
        
        if(user == "manan" && pass == "piyush")
        {
            performSegue(withIdentifier: "dashBoard", sender: nil)
            let alert = UIAlertController(title: "Credentials", message: "Login Successfull !!!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            self.present(alert, animated: true)
        }
        else
        {
             errMsg.text = "Invalid Credentials !!";
            let alert = UIAlertController(title: "Credentials", message: "Invalid Credentials !!!\n Login Again ??", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

            self.present(alert, animated: true)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

