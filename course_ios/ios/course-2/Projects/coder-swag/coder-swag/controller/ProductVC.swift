//
//  ProductVC.swift
//  coder-swag
//
//  Created by Sadaf Fatin on 2/24/21.
//  Copyright © 2021 BISMILLAH-IT. All rights reserved.
//

import UIKit

class ProductVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var productCollection: UICollectionView!
    
    
    private (set) public var products:[Product] = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productCollection.dataSource = self
        productCollection.delegate = self
        if let layout = productCollection.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }

        // Do any additional setup after loading the view.
    }
    

  
    func initProducts(category:Category)  {
        self.products =  DataService.instance.getProducts(title: category.title)
        navigationItem.title = category.title
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        self.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell{
             let product = self.products[indexPath.row]
            cell.updateView(product: product)
            return cell
            
        }
        return ProductCell()
    }
    

}
