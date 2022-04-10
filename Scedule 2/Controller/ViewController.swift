//
//  ViewController.swift
//  Scedule 2
//
//  Created by mac on 10.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelDo: UILabel!
    @IBOutlet var numberOfRow: UITextField!
    
    @IBOutlet var buttonRandomNumber: UIButton!
    @IBOutlet var buttontGetResult: UIButton!
    
//    var schedule: [Schedule] = []
    let number = 1...10
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonRandomNumber.layer.cornerRadius = 5
        buttontGetResult.layer.cornerRadius = 5
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigation = segue.destination as? UINavigationController else { return }
        guard let resultTableVC = navigation.topViewController as? ResultTableViewController else {return}
        guard let segueVC = segue.destination as? ListViewController else { return }
//        resultTableVC.schedule = schedule
        resultTableVC.numberOfRow = Int(numberOfRow.text ?? "") ?? 0
    
    }
    
    // Скрытие клавиатуры
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     super.touchesBegan(touches, with: event)
     view.endEditing(true)
     }
    
   
    
    @IBAction func randomNumberOfDo() {
        numberOfRow.text = "\(number.randomElement() ?? 0)"
    }
    
    @IBAction func presedButtonGetResult(_ sender: Any) {
        guard let value = Int(numberOfRow.text ?? ""), value > 0, value <= 10 else {
            return showAlert(title: "Введите целое чило от 1 - 10", massage: "")
            }
        performSegue(withIdentifier: "navigationVC", sender: nil)
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



