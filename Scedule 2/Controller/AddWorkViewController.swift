//
//  AddWorkViewController.swift
//  Scedule 2
//
//  Created by mac on 17.04.2022.
//

import UIKit

class AddWorkViewController: UIViewController {

    @IBOutlet var workTextField: UITextField!
    @IBOutlet var buttonSave: UIButton!
    @IBOutlet var resultAddWork: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultAddWork.isHidden = true
        buttonSave.layer.cornerRadius = buttonSave.layer.frame.height/5
        print("hello")
    }
    
    @IBAction func tapButtonSave(_ sender: Any) {
        if workTextField.text != nil && workTextField.text != "" {
            DataManage.shared.toDoDataWork.append(workTextField.text ?? "0")
            resultAddWork.text = "\(workTextField.text ?? "") добавлен/а в список"
            workTextField.text = ""
            resultAddWork.textColor = .blue
            resultAddWork.isHidden = false
        } else {
            resultAddWork.text = "Введите данные"
            resultAddWork.textColor = .red
            resultAddWork.isHidden = false
        }
    }
}
