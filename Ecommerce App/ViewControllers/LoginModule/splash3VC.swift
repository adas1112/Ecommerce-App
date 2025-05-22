//
//  splash3VC.swift
//  Ecommerce App
//
//  Created by Bilal on 27/03/25.
//

import UIKit

class splash3VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Button Actions

    @IBAction func getStartedBtnClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "loginVC") as! loginVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func prevBtnClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func skipBtnClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "loginVC") as! loginVC
        navigationController?.pushViewController(vc, animated: true)
    }
}
