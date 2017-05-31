//
//  BrainVC.swift
//  TipCalc
//
//  Created by Juan Morillo on 30/5/17.
//  Copyright © 2017 Juan Morillo. All rights reserved.
//

import UIKit

class BrainVC: UIViewController {
  
  //IBOutlets
  @IBOutlet var textFieldValue: UITextField!
  @IBOutlet var tipTotalLabel: UILabel!
  @IBOutlet var totalWithTipLabel: UILabel!
  @IBOutlet var tipPercentSegmentedControl: UISegmentedControl!
  @IBOutlet var userLabel: UILabel!
  
  
  //MARK: let and var
  let defaults = UserDefaults()
  var name: String?
  var valueOfSwitch : Bool? = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.userLabel.text = "Welcome again \(defaults.string(forKey: "name")!)"
    self.valueOfSwitch = defaults.bool(forKey: "showNotification")
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    textFieldValue.becomeFirstResponder()
    notification()
  }
  
  
  func notification() {
    if (self.valueOfSwitch == true) {
      let notification = UIAlertController(title: "Welcome", message: "We hope enjoy the TipCal", preferredStyle: .alert)
      let btnOkAction = UIAlertAction(title: "OK", style: .default, handler: nil)
      notification.addAction(btnOkAction)
      present(notification, animated: true, completion: nil)
      
    }
    
  }
  
  
  @IBAction func mainTextFieldProcess(_ sender: Any) {
    let tipPercent = [0.15, 0.18, 0.20]
    let totalBill = Double(textFieldValue.text!) ?? 0
    let tip = totalBill * tipPercent[tipPercentSegmentedControl.selectedSegmentIndex]
    let mainTotalBill = totalBill + tip
    
    tipTotalLabel.text = "\(tip)"
    totalWithTipLabel.text = "\(mainTotalBill)"
    tipTotalLabel.text = String(format: "$%.2f", tip)
    totalWithTipLabel.text = String(format: "$%.2f", mainTotalBill)
    
  }
 override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
}


  




