//
//  ViewController.swift
//  UITestLoginApp
//
//  Created by 郭梦阳 on 12/9/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!

    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblStatus.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        let email = txtEmail.text
        let password = txtPassword.text
        
        if(email == "ashish@test.com" && password == "password"){
            lblStatus.text = ""
            performSegue(withIdentifier: "segueDashboard", sender: self)
        } else{
            lblStatus.text = "Invalid Password"
        }
    }
    

}

