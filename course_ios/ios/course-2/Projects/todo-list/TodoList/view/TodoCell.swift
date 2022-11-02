//
//  TodoCell.swift
//  TodoList
//
//  Created by Sadaf Fatin on 3/28/21.
//  Copyright © 2021 BISMILLAH-IT. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {
    
    @IBOutlet weak var todoTaskDescTxt: UILabel!
    @IBOutlet weak var todoPriorityView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(todo:Todo){
        self.todoTaskDescTxt.text = todo.item
        self.todoPriorityView.backgroundColor = getColorAccordingToPriority(priority: todo.priority)
        
    }
    
    func getColorAccordingToPriority(priority:Int) -> UIColor {
        if (priority==1){
            return #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        }
        else if (priority==2){
            return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
        else{
            return #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        }
    }
    
}
