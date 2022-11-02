//
//  ViewController.swift
//  Unit Converter
//
//  Created by Sadaf Fatin on 12/22/20.
//  Copyright © 2020 BISMILLAH-IT. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    
    
    @IBOutlet weak var convertionValue: CustomUITextField!
    @IBOutlet weak var convertionTypeSwitch: UISwitch!
    @IBOutlet weak var convertionTypeLabel: UILabel!
    @IBOutlet weak var convertionResult: UILabel!
    @IBOutlet weak var convertionResultType: UILabel!
    
    
    var currentConvertionType = "Miles to Kilometers"
    var resultantConvertionType = "Kilometers"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        convertionTypeSwitch.addTarget(self, action: #selector(switchConvertionType), for: .valueChanged)
        convertionValue.addTarget(self, action: #selector(onConvertionInputChanged), for: UIControl.Event.editingChanged)
        setConvertionState()
   
    }


    @objc func switchConvertionType(_ sender: Any) {
        setConvertionState()
        convertAndDisplayResult()
    }
    
    
    @objc func onConvertionInputChanged(_ sender: Any) {
       convertAndDisplayResult()
    }
    
    func setConvertionState(){
        if(convertionTypeSwitch.isOn){
            currentConvertionType = "Miles to Kilometers"
            resultantConvertionType = "Kilometers"
            convertionTypeLabel.text = currentConvertionType
            
        }
        else{
            currentConvertionType = "Kilometers to Miles"
            resultantConvertionType = "Miles"
            convertionTypeLabel.text = currentConvertionType
        }
    }
    
    func convertAndDisplayResult() {
        var result:Double = 0
        let constant = 1.60934
        //Miles to km
        if(convertionTypeSwitch.isOn){
            if let text = convertionValue.text {
                if let value = Double(text){
                    result = value * constant
                }
            }
        }
        //Km to miles
        else{
            if let text = convertionValue.text {
                if let value = Double(text){
                    result = value * (1/constant)
                }
            }
            
        }
        result = (result * 1000).rounded() / 1000
        convertionResult.text = String(result);
        convertionResultType.text = resultantConvertionType
    }
    
    
    
    
}

