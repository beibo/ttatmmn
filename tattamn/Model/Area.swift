//
//  Area.swift
//  tattamn
//
//  Created by heba sami on 7/24/18.
//  Copyright © 2018 heba sami. All rights reserved.
//

import Foundation
class Area{

    let name:String
    let id:Int
    let created_at:String
    let Updated_at :String
    
    init(name:String,id:Int,created_at:String,updated_at:String) {
    
        self.name=name
        self.id=id
        self.created_at=created_at
        self.Updated_at = updated_at
    }
    
    
    
}
class City:Area{
    
}
