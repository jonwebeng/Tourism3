//
//  ViewController.swift
//  Tourism3
//
//  Created by JON SKYNET on 06/03/17.
//  Copyright © 2017 JON SKYNET. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    let conditionRef = FIRDatabase.database().reference().child("condition")
    
    @IBOutlet weak var conditionlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func sunnygettouch(_ sender: AnyObject) {
        conditionRef.setValue("Sunny")
    }
    
    @IBAction func foggygettouch(_ sender: AnyObject) {
        conditionRef.setValue("Foggy")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // let conditionRef = rootRef.child("condition")
        conditionRef.observe(.value) { (snap: FIRDataSnapshot) in
            self.conditionlabel.text = (snap.value as AnyObject).description
            
        }
    }
}
