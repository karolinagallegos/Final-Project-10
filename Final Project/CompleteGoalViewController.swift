//
//  CompleteGoalViewController.swift
//  Final Project
//
//  Created by Karolina Gallegos on 7/16/20.
//  Copyright © 2020 Rahaf Aljerwi. All rights reserved.
//

import UIKit

class CompleteGoalViewController: UIViewController {
    var previousVC = GoalTrackerTableViewController()
    var selectedGoal : GoalTrackerCD?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = selectedGoal?.goal
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        if let theGoalTracker = selectedGoal {
            context.delete(theGoalTracker)
            navigationController?.popViewController(animated: true)
        }
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
