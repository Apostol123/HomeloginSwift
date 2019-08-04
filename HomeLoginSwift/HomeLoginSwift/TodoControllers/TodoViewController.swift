//
//  TodoViewController.swift
//  HomeLoginSwift
//
//  Created by Apostol, Alexandru on 04/08/2019.
//  Copyright © 2019 Apostol, Alexandru. All rights reserved.
//

import UIKit
import HomeLoginCore

class TodoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var todos: [Todo] = []
    var userID: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.reloadData()
        tableView.register(UINib.init(nibName: "CustomCellControllerTableViewCell",bundle: nil), forCellReuseIdentifier: "customCell")
        tableView.register(UINib.init(nibName: "CompletedTodoTableViewCell", bundle: nil), forCellReuseIdentifier: "completedTodoCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(userID ?? "Empty Value")
        
        guard let secureID = userID else {
            return
        }
        
        let util = ApiDataSouce()
        
        let url = util.todosURL(pass: secureID)
        
        URLSession.shared.get(url, type: [Todo].self) { todos in
            if let todos = todos {
                self.todos = todos
                self.tableView.reloadData()
            }
        }
    }

    
    

}

extension TodoViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCellControllerTableViewCell
        
         let   completedTodoCell = tableView.dequeueReusableCell(withIdentifier: "completedTodoCell", for: indexPath) as! CompletedTodoTableViewCell
        
        let item = self.todos[indexPath.row]
        
        if item.completed {
            completedTodoCell.completedTodoLabel.text = item.title
          return completedTodoCell
        } else {
              cell.CustomCellLAbel.text = item.title
        }
        
      
        
        return cell
    }
    
    
    
    
}
