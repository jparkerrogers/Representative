//
//  ResultsTableViewController.swift
//  Representatives
//
//  Created by Jonathan Rogers on 4/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController {
    
    @IBOutlet weak var partyLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var districtLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var officeLabel: UILabel!
    
    @IBOutlet weak var linkLabel: UILabel!
    
    
    
    var repsArray: [Representative] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.repsArray.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.repsArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("representativeCell", forIndexPath: indexPath)
        
        let representative = self.repsArray[indexPath.row]
        cell.textLabel?.text = representative.name
        cell.detailTextLabel?.text = representative.party
        if representative.party == "D" {
            cell.textLabel?.textColor = UIColor.redColor()
        } else if representative.party == "R"{
            cell.detailTextLabel?.textColor = UIColor.redColor()
        } else  if representative.party == "I"{
            cell.detailTextLabel?.textColor = UIColor.yellowColor()
        }
        
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toDetailView" {
            
            guard let detailTableViewController = segue.destinationViewController as? DetailTableViewController,
                cell = sender as? UITableViewCell,
                indexPath = self.tableView.indexPathForCell(cell) else {return}
            
            let representative = self.repsArray[indexPath.row]
            
            detailTableViewController.representative  = representative
            
            
            
        }
        
    }
    
    
}
