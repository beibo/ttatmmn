//
//  RoundedButton.swift
//  tattamn
//
//  Created by heba sami on 7/2/18.
//  Copyright © 2018 heba sami. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedButton: UIButton {
    @IBInspectable var cornerRadius :CGFloat = 3.0 {
        didSet{
            self.layer.cornerRadius=cornerRadius
        }
    }
    
  
    
    
    
    
    override func awakeFromNib() {
        setView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setView()
    }
    
    func setView(){
        self.layer.cornerRadius=cornerRadius
        
    }
    

 
  
    
    
    
    

}
