//
//  ThirdPageViewController.swift
//  tattamn
//
//  Created by heba sami on 7/9/18.
//  Copyright © 2018 heba sami. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class ThirdPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toMyAPP_press(_ sender: Any) {
        let storyboard = UIStoryboard(name:"Main",bundle:nil)
        let rightVC = storyboard.instantiateViewController(withIdentifier: "slideMenu") as!RigthSildMenuViewController
        let mainVC = storyboard.instantiateViewController(withIdentifier: "tabBar") 
//        let slideMenu = slideMenuController(MainViewController:mainVC,rightMenuViewController: rightVC)
        let slideMenu = SlideMenuController(mainViewController: mainVC, rightMenuViewController: rightVC)
        
      self.present(slideMenu, animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
