//
//  FunTableViewController.swift
//  Scedule 2
//
//  Created by mac on 17.04.2022.
//

import UIKit

class FunTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItems?[1] = editButtonItem

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataManage.shared.toDoDataFun.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showFunCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "\(DataManage.shared.toDoDataFun[indexPath.row])"
        cell.contentConfiguration = content
        return cell
    }
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataManage.shared.toDoDataFun.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .right)
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
}

    
