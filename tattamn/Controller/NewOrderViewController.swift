//
//  NewOrderViewController.swift
//  tattamn
//
//  Created by heba sami on 7/14/18.
//  Copyright © 2018 heba sami. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
class NewOrderViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
   
    
    
    @IBOutlet weak var NeededTOReciveOrderViewPressed: UIView!
    
    
    var counteryPikerView=UIPickerView()
    @IBOutlet weak var neededToSendOrder: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        counteryPikerView.delegate=self
        counteryPikerView.dataSource=self
        
        let tabSendOrder=UITapGestureRecognizer(target:self,action:#selector(tapSend))
        neededToSendOrder.addGestureRecognizer(tabSendOrder)
        
        let tabReciveOrder=UITapGestureRecognizer(target:self,action:#selector(tapReciveOrder))
        NeededTOReciveOrderViewPressed.addGestureRecognizer(tabReciveOrder)
        
        
        
    }

   
  @objc  func tapSend(){
    let storybord=UIStoryboard(name:"Main",bundle:nil)
    let vc=storybord.instantiateViewController(withIdentifier: "sendOrderVC")
    self.show(vc, sender: nil)
    }
    
    @objc func tapReciveOrder(){
        let storybord = UIStoryboard(name:"orderSB",bundle:nil)
        let vc = storybord.instantiateViewController(withIdentifier:"orderNC")
        self.show(vc, sender: nil)
    }
    
    @IBAction func openslidMenueBTNpressed(_ sender: Any) {
        self.slideMenuController()?.toggleRight()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return 2
    }
    
    
    
 
}
