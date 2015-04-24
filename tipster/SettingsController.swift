//
//  SettingsController.swift
//  tipster
//
//  Created by Jules Walter on 4/23/15.
//  Copyright (c) 2015 Jules Walter. All rights reserved.
//

import Foundation

import UIKit

protocol SettingsControllerDelegate{
    func minTipPercentageDidChange(value: Double)
    func medianTipPercentageDidChange(value: Double)
    func maxTipPercentageDidChange(value: Double)
}

var defaults = NSUserDefaults.standardUserDefaults()

class SettingsController: UIViewController {
    
    @IBOutlet weak var minTipLabel: UILabel!
    @IBOutlet weak var minTipStepper: UIStepper!
    @IBOutlet weak var medianTipLabel: UILabel!
    @IBOutlet weak var medianTipStepper: UIStepper!
    @IBOutlet weak var maxTipLabel: UILabel!
    @IBOutlet weak var maxTipStepper: UIStepper!
    var delegate: SettingsControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Settings"
        
        if let minTipIsNotNil = defaults.objectForKey("minTip") as? Double {
            minTipStepper.value = minTipIsNotNil
            minTipLabel.text = "\(Int(minTipStepper.value).description)%"
        }
        
        if let medianTipIsNotNil = defaults.objectForKey("medianTip") as? Double {
            medianTipStepper.value = medianTipIsNotNil
            medianTipLabel.text = "\(Int(medianTipStepper.value).description)%"
        }
        
        if let maxTipIsNotNil = defaults.objectForKey("maxTip") as? Double {
            maxTipStepper.value = maxTipIsNotNil
            maxTipLabel.text = "\(Int(maxTipStepper.value).description)%"
        }
    }
    
    @IBAction func stepperValueChanged(sender: UIStepper) {
        switch sender.self {
        case minTipStepper:
            minTipLabel.text = "\(Int(sender.value).description)%"
            defaults.setDouble(minTipStepper.value, forKey: "minTip")
        case medianTipStepper :
            medianTipLabel.text = "\(Int(sender.value).description)%"
            defaults.setDouble(medianTipStepper.value, forKey: "medianTip")
        default:
            maxTipLabel.text = "\(Int(sender.value).description)%"
            defaults.setDouble(maxTipStepper.value, forKey: "maxTip")
        }
        
        defaults.synchronize()
    }
}