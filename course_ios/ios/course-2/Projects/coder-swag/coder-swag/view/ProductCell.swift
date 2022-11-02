//
//  CollectionViewCell.swift
//  coder-swag
//
//  Created by Sadaf Fatin on 2/22/21.
//  Copyright © 2021 BISMILLAH-IT. All rights reserved.
//

import UIKit




class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak internal var productImage: UIImageView!
    @IBOutlet weak internal var productTitle: UILabel!
    @IBOutlet weak internal var productPrice: UILabel!
    
    func updateView(product:Product){
        productImage.image = UIImage(named: product.imageName)
        productTitle.text = product.title
        productPrice.text = product.price
    }

    
}
