//
//  ViewController.swift
//  Tabuada do Rafael
//
//  Created by Denis Nascimento on 30/08/18.
//  Copyright © 2018 Denis Nascimento. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var swOperation: UISegmentedControl!
    
    var tableData = [String]()
    
    @IBAction func doOperation(_ sender: UISegmentedControl) {
        execute(index: sender.selectedSegmentIndex)
    }
    
    private func execute(index: Int) {
        
        switch index {
        case 0:
            soma()
            break
        case 1:
            subtracao()
            break
        case 2:
            multiplicacao()
            break
        case 3 :
            divisao()
            break
        default: break
            
        }
    }
    
    private func soma() {
        
        var tmp = [String]()
        let number =  Int(numberTextField.text!)!
        for i in  1...10 {
            tmp.append(String.init(format: "%d + %d = %d", number,i, (number + i)))
        }
        reloadTableWithNumber(result: tmp)
    }
    
    private func subtracao() {
        var tmp = [String]()
        let number =  Int(numberTextField.text!)!
        for i in  1...10 {
            tmp.append(String.init(format: "%d - %d = %d", number,i, (number - i)))
        }
        reloadTableWithNumber(result: tmp)
    }
    
    private func multiplicacao() {
        
        var tmp = [String]()
        let number =  Int(numberTextField.text!)!
        for i in  1...10 {
            tmp.append(String.init(format: "%d x %d = %d", number,i, (number * i)))
        }
        reloadTableWithNumber(result: tmp)
    }
    
    private func divisao() {
        var tmp = [String]()
        let number =  Int(numberTextField.text!)!
        for i in  1...10 {
            tmp.append(String.init(format: "%d / %d = %d", number,i, (number / i)))
        }
        reloadTableWithNumber(result: tmp)
    }
    
    func reloadTableWithNumber(result: [String]) {
        self.tableData = result
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.numberTextField.delegate = self
    
        execute(index: swOperation.selectedSegmentIndex)
       
        let numberToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        numberToolbar.barStyle = UIBarStyle.default
        numberToolbar.items = [
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action:  #selector(hideKeyboard))]
        
        

        numberToolbar.sizeToFit()
        numberTextField.inputAccessoryView = numberToolbar
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func hideKeyboard(){
        numberTextField.resignFirstResponder()
      execute(index: swOperation.selectedSegmentIndex)
    }
    

}

extension ViewController : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         execute(index: swOperation.selectedSegmentIndex)
        return true
    }
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier:"cell")
        cell.textLabel?.text = tableData[indexPath.row]
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        return cell
    }
}
