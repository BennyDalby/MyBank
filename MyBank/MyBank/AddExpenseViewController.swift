//
//  AddExpenseViewController.swift
//  MyBank
//
//  Created by Test on 6/13/20.
//  Copyright © 2020 BennyTest. All rights reserved.
//

import UIKit

enum FieldType: Int {
    
    case day = 0
    case month = 1
    case year = 3
}

class AddExpenseViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var expName: UITextField!
    
    @IBOutlet weak var exp_Day: UITextField!
    
    

    
    
    @IBOutlet weak var expPrice: UITextField!
   var expenseList : [ExpenseData]?
    
    @IBOutlet weak var submitButton: UIButton!
    var expData = ExpenseData(taskName: "", taskDate: "", taskprice: "", taskDesc: "")
    
    var currField = FieldType(rawValue: 0)

    @IBOutlet weak var exp_Desc: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        exp_Day.delegate = self
        expPrice.delegate = self
        expName.delegate = self
        expPrice.keyboardType = .numbersAndPunctuation
        
        self.title = "Add My Expense"
        
      

        submitButton.layer.masksToBounds = false
        submitButton.layer.cornerRadius = 5.0
        
        self.hideKeyboardWhenTappedAround()

        
    }
    
    
    @objc func dismissPicker() {

        view.endEditing(true)

    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
   
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == exp_Day {
            
            let picker = UIDatePicker()
            picker.datePickerMode = .date
            picker.addTarget(self, action: #selector(updateDateField(sender:)), for: .valueChanged)

            
            textField.inputView = picker
            textField.text = formatDateForDisplay(date: picker.date)
        }
        
        else if textField == expPrice {
            
            
            
            
            expPrice.text = expPrice.text!
        }
        
    }
    
    func formatDateForDisplay(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMM yyyy"
    return formatter.string(from: date)
    
    }
    
    
    @objc func updateDateField(sender: UIDatePicker){
        
        exp_Day.text = formatDateForDisplay(date: sender.date)
        
    }
    
    
    func validateTextFields() -> Bool {
        
        if expName.text == "" || expPrice.text == "" || exp_Day.text == "" {
            
            //TODO : alert message here
            
            self.popupAlert(title: "", message: "All Fields are required !", actionTitles: ["OK"], actions: [{action1 in }])
            
            return false
        }
        
        return true
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        
        if !validateTextFields() {
            
            return
        }
        
        expData.taskName = expName.text!
        expData.taskprice = expPrice.text!
        expData.taskDate = exp_Day.text!
        
        
         let concurentQueue =  DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)
        
        concurentQueue.async {
        
        
        
        if let data = UserDefaults.standard.value(forKey:"expense") as? Data {
            self.expenseList = try? PropertyListDecoder().decode(Array<ExpenseData>.self, from: data)
            
            self.expenseList?.append(self.expData)
        }
        else {
            self.expenseList = [ExpenseData]()
            self.expenseList!.append(self.expData)
        }
        
        
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.expenseList), forKey:"expense")
        
        }
        
        DispatchQueue.main.async {
        self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    

}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}



