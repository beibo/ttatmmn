//
//  RoundedTextField.swift
//  tattamn
//
//  Created by heba sami on 7/2/18.
//  Copyright © 2018 heba sami. All rights reserved.


import UIKit
@IBDesignable
class RoundedTextField: UITextField {
    
    
    @IBInspectable var cornerRadius :CGFloat = 3.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
 
    let padding = UIEdgeInsets(top:0,left:20,bottom:0,right:20)

    
    
    override func awakeFromNib() {
        setView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setView()
    }
    
    func setView() {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds=true
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
       return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
