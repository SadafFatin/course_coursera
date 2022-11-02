//
//  NewGoalVC.swift
//  GoalPost
//
//  Created by Sadaf Fatin on 3/20/21.
//  Copyright © 2021 BISMILLAH-IT. All rights reserved.
//

import UIKit

class NewGoalVC: UIViewController {

    
    
    
    
    @IBOutlet weak var goalDescriptionTextView: UITextView!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
     
    var goalType:GoalType = .shortTerm
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
        nextButton.bindToKeyBoard()
        shortTermButton.selectedColor()
        longTermButton.unselectedColor()
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss()
        
    }
    
    
    @IBAction func longTermButtonWasPressed(_ sender: Any) {
        goalType = .longTerm
        longTermButton.selectedColor()
        shortTermButton.unselectedColor()
    }
    
    @IBAction func shortTermButtonWasPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermButton.selectedColor()
        longTermButton.unselectedColor()
    }
    
    @IBAction func nextButtonWasPressed(_ sender: Any) {
        if ( goalDescriptionTextView.text != "" && goalDescriptionTextView.text != "What is your goal?" )
        {
            guard let finishGoalVc = storyboard?.instantiateViewController(identifier: "finishGoalVC") as?FinishGoalVC else{ return }
            
            finishGoalVc.initData(description: goalDescriptionTextView.text ?? " ", type: goalType)
            presentingViewController?.presentSecoendaryDeatil(finishGoalVc)
            
            
        }
        
    }
    
    
    
    
    

}
