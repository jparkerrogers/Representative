//
//  SelectAStateViewController.swift
//  Representatives
//
//  Created by Jonathan Rogers on 4/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class SelectAStateViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let states = ["AK", "AL", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    
    var resultReps: [Representative] = []
    
    @IBOutlet weak var statePickerView: UIPickerView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.flatRedColor()
    
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func SearchButtonTapped(sender: AnyObject) {
        
        let index = self.statePickerView.selectedRowInComponent(0)
        let stateString = self.states[index]
        
        
        RepresentativeController.searchRepsByState(stateString) { (representatives) in
            if representatives.count > 0 {
                self.resultReps = representatives
                
                
                dispatch_async(dispatch_get_main_queue(), { 
                    self.performSegueWithIdentifier("toResultsTableViewController", sender: self)
                })
            } else {
                print("no representatives were found in the array || unable to perform segue")
            }
        }
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.states.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return self.states[row]
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     
        if segue.identifier == "toResultsTableViewController" {
            guard let resultsTableViewController = segue.destinationViewController as? ResultsTableViewController else {return}
            
            resultsTableViewController.repsArray = self.resultReps
            
            
            
        }
        
     }
    
    
}
