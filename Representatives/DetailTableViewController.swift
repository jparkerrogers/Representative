//
//  DetailTableViewController.swift
//  Representatives
//
//  Created by Jonathan Rogers on 4/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var representative: Representative?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let representative = representative {
            title = representative.name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let representative = representative else {
            return tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath)
        }
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath)
            cell.textLabel?.text = representative.name
            if let state = representative.state {
                cell.imageView?.image = UIImage(named: state)
            }
            var stateDistrictString = ""
            if let state = representative.state {
                stateDistrictString = state + " - "
            }
            
            if let district = representative.district {
                stateDistrictString = stateDistrictString + district
            }
            
            cell.detailTextLabel?.text = stateDistrictString
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.textLabel?.text = "Party"
            cell.detailTextLabel?.text = representative.party
            return cell
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.textLabel?.text = "Website"
            cell.detailTextLabel?.text = representative.link
            return cell
        case 3:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.textLabel?.text = "Phone"
            cell.detailTextLabel?.text = representative.phone
            return cell
        case 4:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.textLabel?.text = "Office"
            cell.detailTextLabel?.text = representative.office
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath)
            return cell
        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
