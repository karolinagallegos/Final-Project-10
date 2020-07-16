//
//  AddGoalViewController.swift
//  Final Project
//
//  Created by Karolina Gallegos on 7/16/20.
//  Copyright © 2020 Rahaf Aljerwi. All rights reserved.
//

import UIKit
import CoreData

class AddGoalViewController: UIViewController {
    var previousVC = GoalTrackerTableViewController()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var prioritySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addGoal(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let goalTracker = GoalTrackerCD(context : context)
        
        goalTracker.goal = textField.text
        goalTracker.important = prioritySwitch.isOn
        
        appDelegate.saveContext()
        
        navigationController?.popViewController(animated: true)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
