//
//  TableViewCell.swift
//  GoalPoast
//
//  Created by Sadaf Fatin on 3/12/21.
//  Copyright © 2021 BISMILLAH-IT. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescription: UILabel!
    @IBOutlet weak var goalType: UILabel!
    @IBOutlet weak var goalProgress: UILabel!
    @IBOutlet weak var goalCompletionView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    
    func configureCell(goal:Goal){
        
        if(goal.goalCompletionValue == goal.goalProgress){
            self.goalCompletionView.isHidden = false
        }
        else{
            self.goalCompletionView.isHidden = true;
        }
        self.goalDescription.text = goal.goalDescription
        self.goalProgress.text = String(describing: goal.goalProgress)
        self.goalType.text = goal.goalType
    }
    
    

}
