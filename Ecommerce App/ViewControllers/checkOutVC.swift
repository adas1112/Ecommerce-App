//
//  checkOutVC.swift
//  Ecommerce App
//
//  Created by Bilal on 11/04/25.
//

import UIKit

class checkOutVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Outlets

    @IBOutlet weak var deliveryAddTableView: UITableView!
    @IBOutlet weak var shoppingListTableView: UITableView!
    @IBOutlet weak var deliveryTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var shoppingTableViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        deliveryAddTableView.delegate = self
        deliveryAddTableView.dataSource = self
        
        shoppingListTableView.delegate = self
        shoppingListTableView.dataSource = self
        
        deliveryAddTableView.estimatedRowHeight = 100
        deliveryAddTableView.rowHeight = UITableView.automaticDimension

        let deliveryNib = UINib(nibName: "deliveryAddTableCell", bundle: nil)
        deliveryAddTableView.register(deliveryNib, forCellReuseIdentifier: "deliveryAddTableCell")
        
        let shoppingNib = UINib(nibName: "shoppingListTableCell", bundle: nil)
        shoppingListTableView.register(shoppingNib, forCellReuseIdentifier: "shoppingListTableCell")
        
        updateHeight()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateHeight()
    }
    
    //MARK: - TableView Methods
    
    func updateHeight(){
        deliveryAddTableView.reloadData()
        deliveryAddTableView.layoutIfNeeded()
        deliveryTableViewHeight.constant = deliveryAddTableView.contentSize.height
        
        shoppingListTableView.reloadData()
        shoppingListTableView.layoutIfNeeded()
        shoppingTableViewHeight.constant = shoppingListTableView.contentSize.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == deliveryAddTableView{
            return 2
        }else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == deliveryAddTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "deliveryAddTableCell", for: indexPath) as! deliveryAddTableCell
            if indexPath.row != 0{
                cell.plusView.isHidden = true
            }
            cell.addressView.layer.cornerRadius = 6
            cell.addressView.layer.masksToBounds = false
            cell.addressView.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
            cell.addressView.layer.shadowOffset = CGSize(width: 0, height: 6)
            cell.addressView.layer.shadowRadius = 14
            cell.addressView.layer.shadowOpacity = 0.8
            
            cell.addressView.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
            cell.addressView.layer.shadowOffset = CGSize(width: 0, height: -4)
            cell.addressView.layer.shadowRadius = 9
            cell.addressView.layer.shadowOpacity = 0.7
            
            cell.plusView.layer.cornerRadius = 6
            cell.plusView.layer.masksToBounds = false
            cell.plusView.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
            cell.plusView.layer.shadowOffset = CGSize(width: 0, height: 6)
            cell.plusView.layer.shadowRadius = 14
            cell.plusView.layer.shadowOpacity = 0.8
            
            cell.plusView.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
            cell.plusView.layer.shadowOffset = CGSize(width: 0, height: -4)
            cell.plusView.layer.shadowRadius = 9
            cell.plusView.layer.shadowOpacity = 0.7
            
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListTableCell", for: indexPath) as! shoppingListTableCell
            return cell
        }
    }
}
