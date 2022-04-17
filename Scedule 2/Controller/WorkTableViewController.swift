//
//  WorkTableViewController.swift
//  Scedule 2
//
//  Created by mac on 17.04.2022.
//

import UIKit

class WorkTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItems?[1] = editButtonItem
        print("hello")
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataManage.shared.toDoDataWork.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showWorkCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "\(DataManage.shared.toDoDataWork[indexPath.row])"
        cell.contentConfiguration = content
        return cell
    }
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataManage.shared.toDoDataWork.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .right)
        }
    }
}

    
