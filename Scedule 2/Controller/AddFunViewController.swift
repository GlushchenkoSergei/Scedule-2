//
//  AddFunViewController.swift
//  Scedule 2
//
//  Created by mac on 17.04.2022.
//

import UIKit

class AddFunViewController: UIViewController {
    
    @IBOutlet var funTextField: UITextField!
    @IBOutlet var buttonSave: UIButton!
    @IBOutlet var resultAddFun: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultAddFun.isHidden = true
        buttonSave.layer.cornerRadius = buttonSave.layer.frame.height/5
    }
    
    @IBAction func tapButtonSave(_ sender: Any) {
        if funTextField.text != nil && funTextField.text != "" {
            DataManage.shared.toDoDataFun.append(funTextField.text ?? "0")
            resultAddFun.text = "\(funTextField.text ?? "") добавлен/а в список"
            funTextField.text = ""
            resultAddFun.textColor = .blue
            resultAddFun.isHidden = false
        } else {
            resultAddFun.text = "Введите данные"
            resultAddFun.textColor = .red
            resultAddFun.isHidden = false
        }
    }
}
