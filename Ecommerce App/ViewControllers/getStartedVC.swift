//
//  getStartedVC.swift
//  Ecommerce App
//
//  Created by Bilal on 27/03/25.
//

import UIKit

class getStartedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Button Actions

    @IBAction func getStartedBtnClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "mainTabBarVC") as! mainTabBarVC
        navigationController?.pushViewController(vc, animated: true)
    }
}
