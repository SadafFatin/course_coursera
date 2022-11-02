//
//  FinishGoalVC.swift
//  GoalPost
//
//  Created by Sadaf Fatin on 3/22/21.
//  Copyright © 2021 BISMILLAH-IT. All rights reserved.
//

import UIKit



class FinishGoalVC: UIViewController {

    var goalDescription:String!
    var type:GoalType!
    
    @IBOutlet weak var goalCompletionTextView: UITextView!
    @IBOutlet weak var finishButton: UIButton!
    
    override func viewDidLoad() {
        
        finishButton.bindToKeyBoard()
        super.viewDidLoad()


    }
    
    
    
    func initData(description:String , type: GoalType ){
        self.goalDescription = description
        self.type = type
        
    }
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss()
    }
    
    @IBAction func finishGoalButtonWasPressed(_ sender: Any) {
        //pass data into core data
        debugPrint("Finished clicked")
   
        if(goalCompletionTextView.text != nil && goalCompletionTextView.text != ""){
            self.save( completion: { (finished ) in
                
                    if(finished){dismiss()}
            })
        
        }
        
    }
    
    

    func save(completion : (_ finshed: Bool) ->()) {
         
        if let managedContext = appDelegate?.persistentContainer.viewContext {
            let goal = Goal (context: managedContext)
            goal.goalDescription = self.goalDescription
            goal.goalType = self.type.rawValue
            goal.goalCompletionValue = Int32(goalCompletionTextView.text!)!
            goal.goalProgress = Int32(0)
            
            do{
                try managedContext.save()
                completion(true)
            }
            catch{
                debugPrint("Error while saving : \(error.localizedDescription)")
                completion(false)
            }
            
        }
        else{
            return
        }
    }
    
    
}
