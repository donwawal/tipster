//
//  SettingsController.swift
//  tipster
//
//  Created by Jules Walter on 4/23/15.
//  Copyright (c) 2015 Jules Walter. All rights reserved.
//

import Foundation

import UIKit

class SettingsController: UIViewController {
    
    @IBOutlet weak var minTipLabel: UILabel!
    @IBOutlet weak var minTipStepper: UIStepper!
    @IBOutlet weak var medianTipLabel: UILabel!
    @IBOutlet weak var medianTipStepper: UIStepper!
    @IBOutlet weak var maxTipLabel: UILabel!
    @IBOutlet weak var maxTipStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Settings"
        
        minTipStepper.value = 18
        medianTipStepper.value = 20
        maxTipStepper.value = 22

    }
    
    @IBAction func stepperValueChanged(sender: UIStepper) {
        switch sender.self {
        case minTipStepper:
            minTipLabel.text = "\(Int(sender.value).description)%"
        case medianTipStepper :
            medianTipLabel.text = "\(Int(sender.value).description)%"
        default:
            maxTipLabel.text = "\(Int(sender.value).description)%"
        }
        
    }
}