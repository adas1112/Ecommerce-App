//
//  homeVC.swift
//  Ecommerce App
//
//  Created by Bilal on 29/03/25.
//

import UIKit

class homeVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UIScrollViewDelegate {
    
    //MARK: - Outlets

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var dealofDayView: UIView!
    @IBOutlet weak var trendingView: UIView!
    @IBOutlet weak var offerView: UIView!
    @IBOutlet weak var viewAllBtn: UIButton!
    @IBOutlet weak var trendingViewAllBtn: UIButton!
    @IBOutlet weak var sortBtn: UIButton!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var product2CollectionView: UICollectionView!
    
    //MARK: - Variabels

    let imageNames = ["cat1", "cat2", "cat3", "cat4", "cat5","cat1", "cat2", "cat3", "cat4", "cat5"]
    let productNames = ["pro1","pro2","pro1","pro2","pro1","pro2","pro1","pro2"]
    let productDataImage = ["product1","product2","product1","product2","product1","product2","product1","product2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate = self
        bannerCollectionView.isPagingEnabled = true
        
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        
        product2CollectionView.dataSource = self
        product2CollectionView.delegate = self
        
        setupUI()
    }
    
    //MARK: - UI Setup

    func setupUI(){
        categoryCollectionView.layer.cornerRadius = 10
        dealofDayView.layer.cornerRadius = 8
        trendingView.layer.cornerRadius = 8
        viewAllBtn.layer.cornerRadius = 4
        trendingViewAllBtn.layer.cornerRadius = 4
        viewAllBtn.layer.borderColor = UIColor.white.cgColor
        trendingViewAllBtn.layer.borderColor = UIColor.white.cgColor
        viewAllBtn.layer.borderWidth = 1
        trendingViewAllBtn.layer.borderWidth = 1
        searchView.layer.cornerRadius = 6
        sortBtn.layer.cornerRadius = 6
        filterBtn.layer.cornerRadius = 6
        offerView.layer.cornerRadius = 6
        
        let categoryNib = UINib(nibName: "categoryCollectionCell", bundle: nil)
        categoryCollectionView.register(categoryNib, forCellWithReuseIdentifier: "categoryCollectionCell")
        
        let bannerNib = UINib(nibName: "BannerCollectionCell", bundle: nil)
        bannerCollectionView.register(bannerNib, forCellWithReuseIdentifier: "BannerCollectionCell")
        
        let productNib = UINib(nibName: "productDataCollectionCell", bundle: nil)
        productCollectionView.register(productNib, forCellWithReuseIdentifier: "productDataCollectionCell")
        
        let product2Nib = UINib(nibName: "productDataCollectionCell", bundle: nil)
        product2CollectionView.register(product2Nib, forCellWithReuseIdentifier: "productDataCollectionCell")
    }
    
    //MARK: - TableView Delegate Methods

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView {
            return 10
        }else if collectionView == bannerCollectionView{
            return 3
        }else if collectionView == productCollectionView{
            return 8
        }else {
            return 8
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCollectionCell", for: indexPath) as! categoryCollectionCell
            let images: [UIImage] = imageNames.compactMap { UIImage(named: $0) }
            cell.categoryImage.image = images[indexPath.row]
            return cell
        }else if collectionView == bannerCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionCell", for: indexPath) as! BannerCollectionCell
            return cell
        }else if collectionView == productCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productDataCollectionCell", for: indexPath) as! productDataCollectionCell
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productDataCollectionCell", for: indexPath) as! productDataCollectionCell
            let images : [UIImage] = productNames.compactMap { UIImage(named: $0)}
            cell.productImage.image = images[indexPath.row]
            cell.productDesc.isHidden = true
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == productCollectionView{
            let vc = storyboard?.instantiateViewController(withIdentifier: "productDetailVC") as! productDetailVC
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //MARK: - ScrollView Delegate Method
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = page
    }
}
