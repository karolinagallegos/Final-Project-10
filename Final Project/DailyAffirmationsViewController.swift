//
//  DailyAffirmationsViewController.swift
//  Final Project
//
//  Created by Celine Giang on 7/17/20.
//  Copyright © 2020 Rahaf Aljerwi. All rights reserved.
//

import UIKit

class DailyAffirmationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func button(_ sender: Any) {
        let quoteArray = ["You are doing your best!", "You can do this!", "Nothing can stop you if you keep trying!", "You're doing amazing; don't let anyone tell you otherwise.", "You are powerful, and you have all the time in the world.", "You are able to overcome anything!", "You are ready to take life by the reins! You are in control!"]
        self.affirmations.text = quoteArray[Int(arc4random_uniform(UInt32(quoteArray.count)))]
    }
    
    @IBOutlet weak var affirmations: UITextView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
