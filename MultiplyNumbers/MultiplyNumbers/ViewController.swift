//
//  ViewController.swift
//  MultiplyNumbers
//
//  Created by 郭梦阳 on 2022/9/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var FirstNumber: UITextField!
    
    @IBOutlet weak var SecondNumber: UITextField!
    
    @IBOutlet weak var lblresult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func multiply(_ sender: Any) {
        let firstNumber = Int(FirstNumber.text ?? "0") ?? 0
        let secondNumber = Int(SecondNumber.text ?? "0") ?? 0
        let product = firstNumber * secondNumber

        lblresult.text = String(product)
    }
    
//    @IBAction func multiply(_ sender: Any) {
//        let firstNumber = Int(FirstNumber.text ?? "0") ?? 0
//        let secondNumber = Int(SecondNumber.text ?? "0") ?? 0
//        let product = firstNumber * secondNumber
//
//        lblresult.text = String(product)
//    }
    

}

