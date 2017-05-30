//
//  SettingsVC.swift
//  TipCalc
//
//  Created by Juan Morillo on 30/5/17.
//  Copyright © 2017 Juan Morillo. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
  
  // MARK: Properties and @IBoutlets
  @IBOutlet var viewInfoImage: UIView!
  @IBOutlet var notificationSwitch: UISwitch!
  @IBOutlet var inputUserNameTextField: UITextField!
  @IBOutlet var currentUserLabel: UILabel!
  let defaults = UserDefaults()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.notificationSwitch.setOn(defaults.bool(forKey: "showNotification"), animated: true)
    self.currentUserLabel.text = defaults.string(forKey: "name")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super .viewWillAppear(animated)
  }
  
  // MARK: @IBActions
  @IBAction func btnPressedSaved(_ sender: Any) {
    defaults.set(self.notificationSwitch.isOn, forKey: "showNotification")
    defaults.set(self.inputUserNameTextField.text, forKey: "name")
    defaults.synchronize()
    
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }

  
}
