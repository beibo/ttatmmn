//
//  FristPageViewController.swift
//  tattamn
//
//  Created by heba sami on 7/23/18.
//  Copyright © 2018 heba sami. All rights reserved.
//

import UIKit

class FristPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var SkipTologinPressBTN: UIButton!
    
    @IBAction func skipToLoginBtn(_ sender: Any) {
        let storyboard=UIStoryboard(name:"AuthSB",bundle:nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AuthNav")

        self.present(vc, animated: true, completion: nil)
        
    }
    

}
