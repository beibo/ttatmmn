//
//  API.swift
//  tattamn
//
//  Created by heba sami on 7/18/18.
//  Copyright © 2018 heba sami. All rights reserved.
//

import Foundation
import Alamofire
import KRProgressHUD
class API{
  
    
    
    class func GET(URL:String,method:HTTPMethod,hedeer:[String:Any]?,completion: @escaping (_ success:Bool,_ result:[String:Any])-> Void){
        KRProgressHUD.show()
        request(URL, method: method, parameters: nil, encoding: JSONEncoding.default, headers:hedeer as? HTTPHeaders).responseJSON { (respons) in
            switch respons.result{
            case .failure(let error):
                print(error)
                KRProgressHUD.dismiss()
                completion(false,[:])
            case .success(let value):
                print(value)
                KRProgressHUD.dismiss()
                completion(true,value as! [String:Any])
            }
        }
       
        
    }
    
    class func POST(URL:String,method:HTTPMethod,body:[String:Any],header:[String:Any]?,completion:@escaping (_ success:Bool,_ result:[String:Any])->Void){
        KRProgressHUD.show()
        request(URL, method: method, parameters: body, encoding: JSONEncoding.default, headers: header as? HTTPHeaders).responseJSON{(respons)in
            
            switch respons.result{
            case .failure(let error):
                print(error)
                KRProgressHUD.dismiss()
                completion(false,[:])
            case .success(let value):
                print(value)
                KRProgressHUD.dismiss()
                completion(true,value as! [String:Any])
            }
        }
    }
}
