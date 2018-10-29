//
//  ViewController.swift
//  tattamn
//
//  Created by heba sami on 7/1/18.
//  Copyright © 2018 heba sami. All rights reserved.
//

import UIKit
import SwiftyJSON

class LoginCV: UIViewController {

    @IBOutlet weak var loginext: UIButton!
    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       // Do any additional setup after loading the view, typically from a nib
//        phoneNumber.layer.cornerRadius=30.0
//       password.layer.cornerRadius=30.0
//        loginext.layer.cornerRadius=30.0
    }
    
   
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registerButtonWasPressed(_ sender: Any) {
        let storyboard=UIStoryboard(name:"AuthSB",bundle:nil)
        let objVC = storyboard.instantiateViewController(withIdentifier:"RegisterVC") as! RegisterViewController
        self.show(objVC, sender: nil)
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
   
    }
    @IBAction func login(_ sender: Any) {
        var body=[String:Any]()
        let pass = self.password.text
        let phoneNum=self.phoneNumber.text
        
      
            self.makeAlert("phone and password are required")
            body=["phone":phoneNum,"password":pass]
            
            
            API.POST(URL: URLS.POSTLOGIN, method: .post, body: body, header: nil,completion: {(success,value) in
                
                if success{
                   print(value["message"]!)
                    if(value["message"]as! String=="success"){
                        let user = value["user"] as? [String:Any] ?? [" ":" "]
                        let token=user["token"] as? String ?? ""
                        let id = user["id"] as? Int ?? 0
                        let username = user["username"] as? String ?? ""
                        let email = user["email"] as? String ?? ""
                        let phone = user["phone"] as? Int ?? 0
                        let avater = user["avatar"] as? String ?? ""
                        var rates=[Any]()
                        rates = value["rates"] as! [Any]
                        let user_rate=user["user_rate"] as? Double ?? 0.0
                        let  order_num=user["order_num"] as? Int ?? 0
                        let order_price=user["order_price"] as? Int ?? 0
                        let user_payment=user["user_payment"] as? Int ?? 0
                        let status=user["status"] as? Int ?? 0
                        let city_name=user["city_name"] as? String ?? ""
                        let area_name=user["area_name"] as? String ?? ""
                   
                        UserDefaults.standard.set(token, forKey: "token")
                        UserDefaults.standard.set(id, forKey: "id")
                         UserDefaults.standard.set(username, forKey: "username")
                         UserDefaults.standard.set(email, forKey: "email")
                         UserDefaults.standard.set(phone, forKey: "phone")
                         UserDefaults.standard.set(avater, forKey: "avatar")
                         UserDefaults.standard.set(rates, forKey: "rates")
                         UserDefaults.standard.set(user_rate, forKey: "user_rate")
                         UserDefaults.standard.set(order_num, forKey: "order_num")
                           UserDefaults.standard.set(order_price, forKey: "order_price")
                           UserDefaults.standard.set(user_payment, forKey: "user_payment")
                           UserDefaults.standard.set(status, forKey: "status")
                           UserDefaults.standard.set(city_name, forKey: "city_name")
                           UserDefaults.standard.set(area_name, forKey: "area_name")

                        
                        let storybord=UIStoryboard(name: "AuthSB", bundle: nil)
                        let vc = storybord.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                    else if (value["message"]as! String=="Validation Error"){
                        if let errors=value["Validation Error"] as? [String:Any]{
                            
                            if let phoneErr=errors["phone"]as? [String] {
                                print(phoneErr[0])
                                   self.makeAlert(phoneErr[0])
                            }
                            if let passwordError=errors["password"]as? [String]{
                                print(passwordError[0])
                                self.makeAlert(passwordError[0])
                            }
                            
                        }// if errors
                        
                        else if (value["message"] as! String=="Failed"){
                            if let error = value["error"]as? String  {
                                print(error)
                               self.makeAlert(error)
                                
                            }
                        }
                        
                    }
    
                }
                    
                
            }
                
            )
            
        
        
      
            
        }
        
        
    
    func makeAlert(_ message:String){
        let alert = UIAlertController.init(title: "try again", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction.init(title: "ok", style: UIAlertActionStyle.default, handler:nil))
        self.present(alert, animated: true, completion: nil)
    }
    
        
    
    
}

