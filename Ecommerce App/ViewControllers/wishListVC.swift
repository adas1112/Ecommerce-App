//
//  wishListVC.swift
//  Ecommerce App
//
//  Created by Bilal on 10/04/25.
//

import UIKit

class wishListVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    //MARK: - Outlets

    @IBOutlet weak var productCollectionView: UICollectionView!
    
    //MARK: - Variabels

    let imageName = ["wishpro1","wishpro2","wishpro3","wishpro4","wishpro5","wishpro6","wishpro7","wishpro8","wishpro9","wishpro10","wishpro11","wishpro12"]
    let productsName = ["Black Winter","Mens Starry","Black Dress","Pink Embroide","Flare Dress","denim dress","Jordan Stay","Realme 7","Sony PS4","Black Jacket 12","D7200 Digital Camera","Shoes"]
    let productDesc = ["Autumn And Winter Casual cotton-padded jacket...","Mens Starry Sky Printed Shirt 100% Cotton Fabric","Solid Black Dress for Women, Sexy Chain Shorts Ladies","EARTHEN Rose Pink Embroidered Tiered Max","Antheaa Black & Rust Orange Floral Print Tiered Midi","Blue cotton denim dress Look 2 Printed cotton dress","The classic Air Jordan 12 to create a shoe that's fresh","6 GB RAM | 64 GB ROM | Expandable Upto 256gb","Sony PS4 Console, 1TB Slim with 3 Games: Gran Turis","This warm and comfortable jacket is great for learning","D7200 Digital Camera (Nikon) In New Area","George Walker Derby Brown Formal Shoes"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
        let productNib = UINib(nibName: "productDataCollectionCell", bundle: nil)
        productCollectionView.register(productNib, forCellWithReuseIdentifier: "productDataCollectionCell")
    }
    
    //MARK: - TableView Delegate Methods

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productDataCollectionCell", for: indexPath) as! productDataCollectionCell
        let images : [UIImage] = imageName.compactMap { UIImage(named: $0)}
        cell.productImage.image = images[indexPath.row]
        cell.productName.text = productsName[indexPath.row]
        cell.productDesc.text = productDesc[indexPath.row]
        
        cell.contentView.layer.cornerRadius = 8
        cell.contentView.layer.masksToBounds = true
        
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = false

        cell.layer.shadowColor = UIColor.black.withAlphaComponent(0.15).cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowRadius = 2
        cell.layer.shadowOpacity = 1
        cell.layer.masksToBounds = false
        
        return cell
    }
}
