//
//  ViewController.swift
//  TouristApp
//
//  Created by 郭梦阳 on 2022/10/3.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tourists = ["Boston", "Vegas", "Seattle", "Denver", "Newyork"]

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tourists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TouristsTableViewCell
        cell.imgTourist.image = UIImage(named: tourists[indexPath.row])
        cell.lblTourists.text = tourists[indexPath.row]
        return cell
    }


}

