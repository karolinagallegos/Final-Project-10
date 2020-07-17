//
//  DailyAffirmationsViewController.swift
//  Final Project
//
//  Created by Celine Giang on 7/17/20.
//  Copyright © 2020 Rahaf Aljerwi. All rights reserved.
//

import UIKit

class DailyAffirmationsViewController: UIViewController {
  
    let quoteArray = ["You are doing your best!", "You can do this!", "Nothing can stop you if you keep trying!", "You're doing amazing; don't let anyone tell you otherwise.", "You are powerful, and you have all the time in the world.", "You are able to overcome anything!", "You are ready to take life by the reins! You are in control!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var changeAffirmation: UILabel!
    
 
    @IBAction func affirmationButton(_ sender: Any) {
    

       /* self.changeAffirmation.text = quoteArray[Int(arc4random_uniform(UInt32(quoteArray.count)))] */
        let number = Int.random(in: 0 ..< 7);
        let element = quoteArray[number]
        
        self.changeAffirmation.text = element
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
