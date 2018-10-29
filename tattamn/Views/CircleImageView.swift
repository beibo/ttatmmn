//
//  CircleImageView.swift
//  tattamn
//
//  Created by heba sami on 7/10/18.
//  Copyright © 2018 heba sami. All rights reserved.
//

import UIKit
@IBDesignable
class CircleImageView: UIImageView {
    
    

    override func awakeFromNib() {
       
        cusomImage()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        cusomImage()
    }
    
    
    func cusomImage(){
        //self.layer.borderWidth=1
        self.layer.masksToBounds=false
        self.layer.cornerRadius=self.frame.height/2
        self.clipsToBounds = true
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
