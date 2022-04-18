//
//  TimeTableViewController.swift
//  Scedule 2
//
//  Created by mac on 15.04.2022.
//

import UIKit

class TimeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItems?[1] = editButtonItem
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataManage.shared.timeOfDayData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showTimeCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "\(DataManage.shared.timeOfDayData[indexPath.row])"
        cell.contentConfiguration = content
        return cell
    }
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataManage.shared.timeOfDayData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .right)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

