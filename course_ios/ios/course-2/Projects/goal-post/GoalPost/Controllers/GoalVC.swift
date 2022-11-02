//
//  ViewController.swift
//  GoalPost
//
//  Created by Sadaf Fatin on 3/17/21.
//  Copyright © 2021 BISMILLAH-IT. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalVC: UIViewController {
    
    
    
    var goals: [Goal] = []
    
    @IBOutlet weak var goalsTable: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.goalsTable.delegate = self
        self.goalsTable.dataSource = self
        self.goalsTable.rowHeight = UITableView.automaticDimension
        self.modalPresentationStyle = .fullScreen
        self.goalsTable.estimatedRowHeight = 120
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)

        print("viewDid load")
    }
    
    
    @objc func willEnterForeground() {
        self.refreshTableData()
    }
    
    func refreshTableData() {
        print("viewWillAppear")
        self.fetchCoreDataObject()
    }
    
    
    func fetchCoreDataObject(){
        self.fetch(completion: {
            successful in
            if(successful){
                if(goals.count>=1){
                    self.goalsTable.isHidden = false
                }
                else{
                    self.goalsTable.isHidden = true
                }
            }
        })
    }
    
    
    @IBAction func actionGoalButtonPressed(_ sender: Any) {
        guard let newgoalvc = storyboard?.instantiateViewController(identifier: "newGoalVC") else{ return }
        
        presentDetail(newgoalvc)
        
    }
    
    
}


extension GoalVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell
        {
            let goal = goals[indexPath.row]
            cell.configureCell(goal: goal)
            return cell
        }
    
        else {return UITableViewCell()}
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction  = UIContextualAction(style: .destructive, title: "DELETE") { (action, view, completion) in
            print("Just Swiped delete", action)
            self.remove(atindex: indexPath)
            self.fetchCoreDataObject()
         }
        
        let addAction  = UIContextualAction(style: .normal, title: "PROGRESS") { (action, view, completion) in
           print("Just Swiped add", action)
           self.setProgress(atIndex: indexPath)
           self.fetchCoreDataObject()
           tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.bottom)
            
        }
        
        let swipeAction = UISwipeActionsConfiguration(actions: [deleteAction,addAction])
        return swipeAction
    }
    
    
    
    
    
}


extension GoalVC{
    
    func setProgress(atIndex index: IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext
                   else { return }
        
        let currentGoal = goals[index.row]
        if(currentGoal.goalProgress<currentGoal.goalCompletionValue){
            currentGoal.goalProgress += 1;
            do{
                try managedContext.save()
               
            }
            catch{
                print(error.localizedDescription)
            }
        }
        else{
            return
        }
        
    }
    
    func fetch( completion: (_ successful:Bool) -> (Void) ) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext
            else { return }
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        do{
            self.goals = try managedContext.fetch(fetchRequest)
            self.goalsTable.reloadData()
            completion(true)
        }
        catch{
            print(error.localizedDescription)
            completion(false)
        }
    }
    
    
    func remove(atindex index: IndexPath) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext
            else { return }
        
        managedContext.delete(self.goals[index.row])
        do{
            try managedContext.save()
        }
        catch{
            print(error.localizedDescription)
            
        }
    }
    
    
    
    
}
