//
//  CtegoryCellTableViewCell.swift
//  coder-swag
//
//  Created by Sadaf Fatin on 2/11/21.
//  Copyright © 2021 BISMILLAH-IT. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak internal var categoryImage: UIImageView!

    @IBOutlet weak internal var categoryTitle: UILabel!
   
    func updateView(category:Category){
        categoryImage.image = UIImage(named: category.image) 
        categoryTitle.text = category.title
    }

}
