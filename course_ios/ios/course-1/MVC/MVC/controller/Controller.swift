//
//  ViewController.swift
//  MVC
//
//  Created by Sadaf Fatin on 10/17/20.
//  Copyright © 2020 SYNESISIT. All rights reserved.
//

import UIKit

class Controller: UIViewController {
    
    @IBOutlet weak var iphoNeameLabel: CustomLabelView!
    @IBOutlet weak var iphoneColorLabel: CustomLabelView!
    @IBOutlet weak var iphonePriceLabel: CustomLabelView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let appleProduct = AppleProduct(name: "Iphone 6s", price: 1200.400, color: "Space Gray")
        
        iphoNeameLabel.text = appleProduct.name
        iphoneColorLabel.text = appleProduct.color
        iphonePriceLabel.text = "\(appleProduct.price)"
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "I'm a test label"
        self.view.addSubview(label)
        
    }


    
}
