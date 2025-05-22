//
//  ViewController.swift
//  Ecommerce App
//
//  Created by Bilal on 26/03/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //MARK: - Button Actions

    @IBAction func nextBtnClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "splash2VC") as! splash2VC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func skipBtnClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "loginVC") as! loginVC
        navigationController?.pushViewController(vc, animated: true)
    }
}

