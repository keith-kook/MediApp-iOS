//
//  ViewController.swift
//  MediApp
//
//  Created by Keith on 13/7/2017.
//  Copyright © 2017 Keith. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var statePicker: UIPickerView!

    @IBOutlet weak var statePickerBtn: UIButton!
    
    
    let states = ["ACT","NSW","NT", "QLD", "VIC"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.statePicker.dataSource = self
        self.statePicker.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stateBtnPressed(_ sender: Any) {
        statePicker.isHidden = false
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 //COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        statePickerBtn.setTitle(states[row], for: .normal)
        statePicker.isHidden = true
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label: UILabel
        if let view = view as? UILabel { label = view }
        else { label = UILabel() }
        
        label.text = states[row]
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        
        return label
    }

}


