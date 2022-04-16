//
//  ViewController.swift
//  Scedule 2
//
//  Created by mac on 10.04.2022.
//

import UIKit

protocol ResultViewControllerDelegate {
    func saveValue(_ numberOfRows: Int, _ schedule: [Schedule], _ color: UIColor)
}

class ViewController: UIViewController {

    @IBOutlet var labelDo: UILabel!
    @IBOutlet var numberOfRow: UITextField!
    
    @IBOutlet var buttonRandomNumber: UIButton!
    @IBOutlet var buttonGetResult: UIButton!
    
    @IBOutlet var buttonSavedResult: UIButton!
    @IBOutlet var clean: UIButton!
    

    let number = 1...10
    var schedule: [Schedule] = []
  
//    значения для экрана сохраненных расписаний
    var saveNumberOfRows = 0
    var saveSchedule: [Schedule] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSavedResult.tintColor = .gray
        
        buttonRandomNumber.layer.cornerRadius = 5
        buttonGetResult.layer.cornerRadius = 5
    }
  
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueSaveVC" {
           let saveVC = segue.destination as! SaveTableViewController
            saveVC.numberOfRows = saveNumberOfRows
            saveVC.schedule = saveSchedule
            
        } else if segue.identifier == "navigationVC" {
        let navigation = segue.destination as! UINavigationController
        let resultTableVC = navigation.topViewController as! ResultTableViewController
        resultTableVC.numberOfRow = Int(numberOfRow.text ?? "") ?? 0
        resultTableVC.schedule = schedule
        resultTableVC.delegate = self
        }
    }
    
    // Скрытие клавиатуры
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     super.touchesBegan(touches, with: event)
     view.endEditing(true)
     }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        let saveVC = segue.source as? SaveTableViewController
        saveSchedule = saveVC?.schedule ?? []
    }
   
    
    @IBAction func randomNumberOfDo() {
        numberOfRow.text = "\(number.randomElement() ?? 0)"
    }
    
    @IBAction func presedButtonGetResult(_ sender: Any) {
        guard let value = Int(numberOfRow.text ?? ""), value > 0, value <= 10 else {
            return showAlert(title: "Введите целое чило от 1 - 10", massage: "")
            }
        schedule = Schedule.setRandomSchedule(for: Int(numberOfRow.text ?? "") ?? 0)
        performSegue(withIdentifier: "navigationVC", sender: nil)
    }
    
    
    @IBAction func pressedButtonSavedResult(_ sender: Any) {
        if saveNumberOfRows != 0 {
        performSegue(withIdentifier: "segueSaveVC", sender: nil)
        } else {
            showAlert(title: "", massage: "Нет сохранненых данных")
        }
    }
    
    
    @IBAction func tapClean(_ sender: Any) {
       saveNumberOfRows = 0
      saveSchedule = []
        buttonSavedResult.tintColor = .gray
        showAlert(title: "", massage: "Сохранения удаленны")
    }
    
    //алерт контроллер
    private func showAlert(title: String, massage: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ОК", style: .default)
        alert.addAction(alertAction)
        present(alert, animated: true)
        numberOfRow.text = ""
    }
}

 // Действия по прекращению текстфилд
extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let value = Int(numberOfRow.text ?? ""), value > 0, value <= 10 else {
            return showAlert(title: "Введите целое чило от 1 - 10", massage: "")
            }
        }
    }

extension ViewController: ResultViewControllerDelegate {
    func saveValue(_ numberOfRows: Int, _ schedule: [Schedule], _ color: UIColor) {
        saveNumberOfRows = numberOfRows
        saveSchedule = schedule
        buttonSavedResult.tintColor = color
    }
    
    
}

