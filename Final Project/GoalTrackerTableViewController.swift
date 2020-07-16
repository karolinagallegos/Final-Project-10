//
//  GoalTrackerTableViewController.swift
//  Final Project
//
//  Created by Karolina Gallegos on 7/16/20.
//  Copyright © 2020 Rahaf Aljerwi. All rights reserved.
//

import UIKit

class GoalTrackerTableViewController: UITableViewController {
    var goals : [GoalTrackerCD] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getGoals()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getGoals()
    }
    
    func getGoals() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataGoals = try? context.fetch(GoalTrackerCD.fetchRequest()) as? [GoalTrackerCD] {
                goals = coreDataGoals
                tableView.reloadData()
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let goalTracker = goals[indexPath.row]
        
        if let goal = goalTracker.goal {
        if goalTracker.important {
            cell.textLabel?.text = "🌎 " + goal
        } else {
            cell.textLabel?.text = "🌿 " + goal
        }
        }
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goalTracker = goals[indexPath.row]
        
        performSegue(withIdentifier: "moveToComplete", sender: goalTracker)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddGoalViewController {
            addVC.previousVC = self;
        }
        
        if let completeVC = segue.destination as? CompleteGoalViewController {
            if let goalTracker = sender as? GoalTrackerCD {
                completeVC.selectedGoal = goalTracker
                completeVC.previousVC = self
            }
        }
    }


}
