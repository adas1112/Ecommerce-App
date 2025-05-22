//
//  productDetailVC.swift
//  Ecommerce App
//
//  Created by Bilal on 05/05/25.
//

import UIKit

class productDetailVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout {
    
    //MARK: - Outlets

    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var sizeCollectionView: UICollectionView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var productCollectionHeight: NSLayoutConstraint!
    @IBOutlet weak var lblMainPrice: UILabel!
    
    //MARK: - Variabels

    let imageName = ["wishpro1","wishpro2","wishpro3","wishpro4","wishpro5","wishpro6","wishpro7","wishpro8","wishpro9","wishpro10","wishpro11","wishpro12"]
    let productsName = ["Black Winter","Mens Starry","Black Dress","Pink Embroide","Flare Dress","denim dress","Jordan Stay","Realme 7","Sony PS4","Black Jacket 12","D7200 Digital Camera","Shoes"]
    let productDesc = ["Autumn And Winter Casual cotton-padded jacket...","Mens Starry Sky Printed Shirt 100% Cotton Fabric","Solid Black Dress for Women, Sexy Chain Shorts Ladies","EARTHEN Rose Pink Embroidered Tiered Max","Antheaa Black & Rust Orange Floral Print Tiered Midi","Blue cotton denim dress Look 2 Printed cotton dress","The classic Air Jordan 12 to create a shoe that's fresh","6 GB RAM | 64 GB ROM | Expandable Upto 256gb","Sony PS4 Console, 1TB Slim with 3 Games: Gran Turis","This warm and comfortable jacket is great for learning","D7200 Digital Camera (Nikon) In New Area","George Walker Derby Brown Formal Shoes"]
    var sizeArr = ["6UK","7UK","8UK","9UK","10UK"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate = self
        
        sizeCollectionView.dataSource = self
        sizeCollectionView.delegate = self
        
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        
        let bannerNib = UINib(nibName: "productBannerCollectionCell", bundle: nil)
        bannerCollectionView.register(bannerNib, forCellWithReuseIdentifier: "productBannerCollectionCell")
        
        let productNib = UINib(nibName: "productDataCollectionCell", bundle: nil)
        productCollectionView.register(productNib, forCellWithReuseIdentifier: "productDataCollectionCell")
        
        sizeCollectionView.reloadData()
        
        DispatchQueue.main.async {
            let defaultIndexPath = IndexPath(item: 0, section: 0)
            self.sizeCollectionView.selectItem(at: defaultIndexPath, animated: false, scrollPosition: [])
            self.collectionView(self.sizeCollectionView, didSelectItemAt: defaultIndexPath)
        }
        
        let text = "$200"
        let attributedString = NSAttributedString(string: text, attributes: [
            .strikethroughStyle: NSUnderlineStyle.single.rawValue
        ])
        lblMainPrice.attributedText = attributedString
        updateHeight()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateHeight()
    }
    
    //MARK: - Button Actions

    @IBAction func backBtnClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - TableView Methods

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bannerCollectionView{
            return 4
        }else if collectionView == sizeCollectionView{
            return 5
        }else {
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == bannerCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productBannerCollectionCell", for: indexPath) as! productBannerCollectionCell
            return cell
        }else if collectionView == sizeCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sizeCollectionCell", for: indexPath) as! sizeCollectionCell
            cell.lblSize.text = sizeArr[indexPath.row]
            return cell
        }else {
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == sizeCollectionView {
            if let cell = collectionView.cellForItem(at: indexPath) as? sizeCollectionCell {
                cell.cellView.backgroundColor = UIColor(hex: "F07189")
                cell.lblSize.textColor = UIColor(hex: "ffffff")
                lblSize.text = "Size: \(cell.lblSize.text ?? "")"
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == sizeCollectionView{
            if let cell = collectionView.cellForItem(at: indexPath) as? sizeCollectionCell {
                cell.cellView.backgroundColor = UIColor(hex: "FFFFFF")
                cell.lblSize.textColor = UIColor(hex: "F07189")
            }
        }
    }
    
    func updateHeight(){
        productCollectionView.reloadData()
        productCollectionView.layoutIfNeeded()
        productCollectionHeight.constant = productCollectionView.contentSize.height
    }
    
    //MARK: - ScrollView Delegate Methods

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = page
    }
}

