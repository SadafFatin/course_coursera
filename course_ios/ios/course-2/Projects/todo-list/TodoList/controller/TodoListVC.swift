//
//  ViewController.swift
//  TodoList
//
//  Created by Sadaf Fatin on 3/28/21.
//  Copyright © 2021 BISMILLAH-IT. All rights reserved.
//

import UIKit


class TodoListVC: UIViewController {
    
    @IBOutlet weak var todoTaskTxt: UITextField!
    @IBOutlet weak var addTodoTask: UIButton!
    @IBOutlet weak var prioritySegments: UISegmentedControl!
    @IBOutlet weak var todoTaskTable: UITableView!
    
    var todos = Array<Todo>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Additional setup after loading the view.
        self.todoTaskTable.delegate = self
        self.todoTaskTable.dataSource = self
        self.getTodos()
        
    }
    
    func getTodos(){
        NetworkService.shared.getTodos(
            {(response_todos)
                in
                self.todos = response_todos.items
                self.todoTaskTable.reloadData()
        },
            {(error_msg)
                in
                debugPrint(error_msg)
                self.showToast(message: error_msg, seconds: 1.0)
        })
        
    }
    
    
    func addTodo(todo:Todo){
        NetworkService.shared.addTodos(todo: todo,
                                       {(response_todos)
                                        in
                                        self.todos = response_todos.items
                                        self.todoTaskTable.reloadData()
        },
                                       {(error_msg)
                                        in
                                        debugPrint(error_msg)
                                        self.showToast(message: error_msg, seconds: 1.0)
        })
    }
    
    
    
    @IBAction func addTodoButtonClicked(_ sender: Any) {
        if(self.todoTaskTxt.text != "" ){
            self.addTodo(todo: Todo(item: self.todoTaskTxt.text! ,priority: prioritySegments.selectedSegmentIndex))
        }
    }
    
}


extension TodoListVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.todos.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let todoCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as? TodoCell  else {
            return UITableViewCell()
        }
        
        todoCell.configureCell(todo: self.todos[indexPath.row])
        return todoCell
        
        
    }
    
    
    
    func showToast(message : String, seconds: Double){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = .black
        alert.view.alpha = 0.5
        alert.view.layer.cornerRadius = 15
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
    
    
    
    
    
}




