//
//  User.swift
//  tattamn
//
//  Created by heba sami on 7/19/18.
//  Copyright © 2018 heba sami. All rights reserved.
//

import Foundation
class User {
    //var id:Int
    var userName:String
    //var email:String
    //var phone:String
    var avatar :String
   // var Card_photo:String
   // var status:Int
    //var active:Int
    //var mobile_status:Int
    // var img_status:Int
   // var city_id:Int
  //  var area_id:Int
   // var token:String
   // var rest_code:String
   var user_rate:Double
   // var conformation_code
    
    init(userName:String,avatar:String,user_rate:Double) {
        self.userName=userName
        self.avatar=avatar
        self.user_rate=user_rate
    }
    
    
 
    
    
}
