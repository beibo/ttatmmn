//
//  Reset_passwordViewController.swift
//  tattamn
//
//  Created by heba sami on 7/9/18.
//  Copyright © 2018 heba sami. All rights reserved.
//

import UIKit

class Reset_passwordViewController: UIViewController {

    @IBOutlet weak var passwordtext: RoundedTextField!
  
    @IBOutlet weak var conformtxt: RoundedTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func backeArrow(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func pressConform(_ sender: Any) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
