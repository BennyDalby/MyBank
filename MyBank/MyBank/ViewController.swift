//
//  ViewController.swift
//  MyBank
//
//  Created by Test on 6/13/20.
//  Copyright © 2020 BennyTest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var expenseTable: UITableView!
    let cellID = "expenseCell"
    var expenseList : [ExpenseData]?
    
    
    var janList : [ExpenseData]?
    var febList : [ExpenseData]?
    var marList : [ExpenseData]?
    var aprList : [ExpenseData]?
    var mayList : [ExpenseData]?
    var junList : [ExpenseData]?
    var julList : [ExpenseData]?
    var augList : [ExpenseData]?
    var sepList : [ExpenseData]?
    var octList : [ExpenseData]?
    var novList : [ExpenseData]?
    var decList : [ExpenseData]?
    
    
    var sectionCount = 0
    
    
    var monthList = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    var eachMonthList = [[ExpenseData]](repeating:[ExpenseData] ( repeating: ExpenseData(taskName: "", taskDate: "", taskprice: "", taskDesc: ""), count: 1) , count: 12)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        expenseTable.delegate = self
        expenseTable.dataSource = self
        
               expenseTable.register(UINib(nibName: "ExpenseCell", bundle: nil), forCellReuseIdentifier: cellID)

        expenseTable.backgroundColor = .white
        expenseTable.separatorStyle = .none
        
        
        let button = UIBarButtonItem(image: UIImage(named: "plus"), style: .plain, target: self, action: #selector(plusButtonClicked))
        
        self.navigationItem.setRightBarButton(button, animated: true)
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let data = UserDefaults.standard.value(forKey:"expense") as? Data {
            expenseList = try? PropertyListDecoder().decode(Array<ExpenseData>.self, from: data)
        }

        

        expenseList?.sort { (lhs:ExpenseData, rhs:ExpenseData) in
            return lhs.taskDate > rhs.taskDate
        }
        
        
        eachMonthList = [[ExpenseData]](repeating:[ExpenseData] ( repeating: ExpenseData(taskName: "", taskDate: "", taskprice: "", taskDesc: ""), count: 1) , count: 12)
        
        if expenseList != nil {
            
            for item in expenseList! {
                
                for i in 0...monthList.count - 1 {
                    
                    if item.taskDate.contains(monthList[i]){
                        
                        eachMonthList[i].append(item)
                    }
                }
                
                
                
                
                
               /* if item.taskDate.contains("Jun") {
                    
                    eachMonthList[5].append(item)
                }
                
                if item.taskDate.contains("Jul") {
                    
                    julList?.append(item)
                }
                if item.taskDate.contains("Aug") {
                    
                    augList?.append(item)
                }
                if item.taskDate.contains("Sep") {
                    
                    sepList?.append(item)
                }
                if item.taskDate.contains("Oct") {
                    
                    octList?.append(item)
                }
                if item.taskDate.contains("Nov") {
                    
                    novList?.append(item)
                }
                if item.taskDate.contains("Dec") {
                    
                    decList?.append(item)
                }
                if item.taskDate.contains("Jan") {
                    
                    janList?.append(item)
                }
                
                if item.taskDate.contains("Feb") {
                    
                    febList?.append(item)
                }
                
                if item.taskDate.contains("Mar") {
                    
                    marList?.append(item)
                }
                
                if item.taskDate.contains("Apr") {
                    
                    aprList?.append(item)
                }
                
                if item.taskDate.contains("May") {
                    
                    mayList?.append(item)
                }
 
 */
                
            }
            
          
            
            
        }
        
        
        for i in 0...eachMonthList.count - 1 {

            if eachMonthList[i].count > 0 && eachMonthList[i][0].taskName == "" {
            eachMonthList[i].removeFirst()
            }
            
            if eachMonthList[i].count > 0 {
                
                sectionCount += 1
            }
        }
        
        print(sectionCount)
        
        
        
        if expenseList == nil {
            
            expenseTable.isHidden = true
        }
        else {
            
             expenseTable.isHidden = false
        }

        
        expenseTable.reloadData()
        expenseTable.setNeedsLayout()
        
        
    }
    
    

    @objc func plusButtonClicked() {
        
        let addController:AddExpenseViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addController") as! AddExpenseViewController
        
        self.navigationController?.pushViewController(addController, animated: true)
    }


}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150.0
    }
    
    
}

extension ViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if eachMonthList[section].count == 0 {
            
            return 0.3
        }
        
        else {
            
            return 40.0
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return eachMonthList[section].count
        
        
      /*
        
        if section == 0 {
            
            if let count = janList?.count {
                
                return count
            }
            else{
                
                return 0
            }
        }
        
        else if section == 1 {
            
           if let count = febList?.count {
                
                return count
            }
            else{
                
                return 0
            }
            
        }
        
        else if section == 2 {
            
           if let count = marList?.count {
                
                return count
            }
            else{
                
                return 0
            }
        }
        
        else if section == 3 {
            
           if let count = aprList?.count {
                
                return count
            }
            else{
                
                return 0
            }
            
        }
        else if section == 4 {
            
            if let count = mayList?.count {
                
                return count
            }
            else{
                
                return 0
            }
        }
        else if section == 5 {
            
           if let count = junList?.count {
                
                return count
            }
            else{
                
                return 0
            }
            
        }
        else if section == 6 {
            
            if let count = julList?.count {
                
                return count
            }
            else{
                
                return 0
            }
            
        }
        else if section == 7 {
            
            if let count = augList?.count {
                
                return count
            }
            else{
                
                return 0
            }
            
        }else if section == 8 {
            
            if let count = sepList?.count {
                
                return count
            }
            else{
                
                return 0
            }
            
        }
        else if section == 9 {
            
            if let count = octList?.count {
                
                return count
            }
            else{
                
                return 0
            }
            
        }
        else if section == 10 {
            
            if let count = novList?.count {
                
                return count
            }
            else{
                
                return 0
            }
            
        }
        else if section == 11 {
            
            if let count = decList?.count {
                
                return count
            }
            else{
                
                return 0
            }
            
        }
        
        
        return 0
 
 */
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
   
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? ExpenseCell {
           
            let expense = eachMonthList[indexPath.section][indexPath.row]
            
         
            
            if indexPath.row % 5 == 0 {
                
                cell.exp_image.image = UIImage(named: "grocery-cart")
            }
            else if indexPath.row % 3 == 0 {
                
                cell.exp_image.image = UIImage(named: "fast-food")
            }
            
            else {
                
                cell.exp_image.image = UIImage(named: "pay-card")
            }
            
            
            cell.exp_name?.text = expense.taskName
            cell.exp_price?.text = expense.taskprice
            cell.exp_date?.text = expense.taskDate
           // cell.accessoryType = .disclosureIndicator
        
        return cell
        }
        
        return UITableViewCell()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 12
    }
    
   
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if eachMonthList[section].count == 0 {
            
            return nil
        }
        
        else {
            
            return  monthList[section] + "      " + "Total Expense: $" + String(calulateMonthlyExpense(eachMonthList[section]))
            
        }
       
            
     
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.popupAlert(title: "", message: "FEATURE UNDER CONSTRUCTION...", actionTitles: ["Oh ok !"], actions: [ {action1 in }])
        
    }
    
    
    func calulateMonthlyExpense(_ list:[ExpenseData]?) -> Double {
        
        var sum = 0.0
        
        if list == nil {
            
            return 0.0
        }
        
        for item in list! {
            
          //  print(item.taskprice)
            sum += Double(String(item.taskprice))!
        }
        
        return Double(round(100*sum)/100)
    }
    
    
}



extension UIViewController   {
    
    func popupAlert(title: String?, message: String?, actionTitles: [String?], actions: [((UIAlertAction) -> Void)?]) {

           if message == "" || message == nil {
               return
           }
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
       // let messageFont = [NSAttributedString.Key.font: UIFont(name: "SFProText-Bold", size: 17.0)! ]
       //    let messageAttrString = NSMutableAttributedString(string: message!, attributes: messageFont)
       //    alert.setValue(messageAttrString, forKey: "attributedMessage")
           for (index, title) in actionTitles.enumerated() {
               let action = UIAlertAction(title: title, style: .default, handler: actions[index])
               alert.addAction(action)
           }
           self.present(alert, animated: true, completion: nil)
       }
    
}

struct ExpenseData: Codable {
    
    var taskName : String
    var taskDate : String
    var taskprice : String
    var taskDesc : String?
    
}

