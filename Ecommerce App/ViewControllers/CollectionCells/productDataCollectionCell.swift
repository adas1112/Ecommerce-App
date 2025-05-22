//
//  productDataCollectionCell.swift
//  Ecommerce App
//
//  Created by Bilal on 07/04/25.
//

import UIKit

class productDataCollectionCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var mainPrice: UILabel!
    @IBOutlet weak var discountPercent: UILabel!
    @IBOutlet weak var ratingView: StarRatingView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
