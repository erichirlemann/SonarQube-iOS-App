//
//  ProjectsTable.swift
//  
//
//  Created by Elena Vilchik on 08/10/15.
//
//

import UIKit

class ProjectsTable: UITableViewController {
    
    // MARK: Properties
    
    var projects = SonarQubeAPI.getProjects()
    var selectedProject: SonarProject!
    
    let qgImageOk = UIImage(named: "QualityGateOk")!
    let qgImageError = UIImage(named: "QualityGateError")!
    let qgImageWarn = UIImage(named: "QualityGateWarn")!


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ProjectCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ProjectCell
        
        let project = projects[indexPath.row]
        
        cell.projectNameLabel.text = project.name
        
        switch project.qualityGate {
        case .orange:
            cell.qualityGateImage.image = qgImageWarn
        case .red:
            cell.qualityGateImage.image = qgImageError
        case .green:
            cell.qualityGateImage.image = qgImageOk
        }
        cell.id = project.id
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedProject = projects[indexPath.item]
        println("tableView \(selectedProject)")
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueToDetails") {
            var detailsViewController = (segue.destinationViewController as! UINavigationController).viewControllers[0] as! ViewController;
            println(selectedProject)
            var cell = sender as! ProjectCell
            detailsViewController.projectId = cell.id
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
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
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
