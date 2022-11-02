//
//  ViewController.swift
//  coder-swag
//
//  Created by Sadaf Fatin on 2/9/21.
//  Copyright © 2021 BISMILLAH-IT. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController , UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var categoryTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTable.delegate = self
        categoryTable.dataSource = self
        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.init().getCategories().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
            
            let category = DataService.instance.getCategories()[indexPath.row]
            cell.updateView(category: category)
            return cell
        }
        else{
            return CategoryCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = DataService.instance.getCategories()[indexPath.row]
        performSegue(withIdentifier: "ProductVC", sender: category) 
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let barButtom = UIBarButtonItem()
        barButtom.title = ""
        navigationItem.backBarButtonItem = barButtom
        
        if let productVc = segue.destination as? ProductVC {
            productVc.initProducts(category: sender as!  Category)
        }
    }

}

