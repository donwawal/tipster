//
//  ViewController.swift
//  tipster
//
//  Created by Jules Walter on 4/12/15.
//  Copyright (c) 2015 Jules Walter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipTableView: UITableView!
    
    // Variables for numbers to be calculated and displayed
    var tipPercentages = [0.18, 0.2, 0.22]
    var billAmount: Double = 0.0
    var tipAmount: Double = 0.0
    var totalAmount: Double = 0.0
    var splitAmounts = [Double](count: 4, repeatedValue: 0.0)
    var  splitImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tipTableView.alpha = 0
        self.tipControl.alpha = 0
        
        splitImages = [UIImage(named: "splitOne")!, UIImage(named: "splitTwo")!, UIImage(named: "splitThree")!, UIImage(named: "splitFour")!]
        
        let settingsImage = UIImage(named: "settingsIcon")
        
        self.title = "tipster"
        
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeMinTip(newMin: Double) -> (){
        self.tipPercentages[0] = newMin
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {

        billAmount = NSString(string: billField.text).doubleValue
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        tipAmount = billAmount * tipPercentage
        totalAmount = billAmount + tipAmount
       
        splitAmounts = [totalAmount, totalAmount/2, totalAmount/3, totalAmount/4]
        
        self.tipTableView.reloadData()
        
        UIView.animateWithDuration(0.4, animations:{
            self.tipTableView.alpha = 1
            self.tipControl.alpha = 1
        })
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return splitAmounts.count
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tipTableView.dequeueReusableCellWithIdentifier("tipCell") as! UITableViewCell

        let section = indexPath.section
        
        // Creating number formatter to later format numbers based on current locale
        var numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.locale = NSLocale.currentLocale()
        
        if section == 0 {
            cell.textLabel!.text = "Tip:"
            cell.detailTextLabel!.text =  "$\(numberFormatter.stringFromNumber(tipAmount)!)"
            cell.detailTextLabel!.textColor = UIColor.whiteColor()
        }
        else {
            cell.detailTextLabel?.textColor = UIColor.blackColor()
            
            switch indexPath.row
            {
            case 0:
                cell.detailTextLabel?.font = UIFont(name: "Helvetica Neue", size: 30.0)
            default:
                cell.detailTextLabel?.font = UIFont(name: "System", size: 15.0)
            }
            
            cell.imageView!.image = splitImages[indexPath.row]
            cell.detailTextLabel!.text = "$\(numberFormatter.stringFromNumber(splitAmounts[indexPath.row])!)"
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

}

