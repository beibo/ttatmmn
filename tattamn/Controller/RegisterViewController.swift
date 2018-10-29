//
//  RegisterViewController.swift
//  tattamn
//
//  Created by heba sami on 7/2/18.
//  Copyright © 2018 heba sami. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate{

    var index:Int=0
    var areaData=[Area]()
    var cityData=[City]()
    var areaString:String?=""
    var CityString:String?=""
    var areaId=0
    var cityId=0
   
   
    @IBOutlet weak var username: RoundedTextField!
    
    @IBOutlet weak var phoneNumber: RoundedTextField!
    
    @IBOutlet weak var email: RoundedTextField!
    
    @IBOutlet weak var earea: RoundedTextField!
    
    @IBOutlet weak var city: RoundedTextField!
    
    @IBOutlet weak var password: RoundedTextField!
    
    @IBOutlet weak var conformPassword: RoundedTextField!
    
    
//    var pickerView = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAllAreaArrayAndCityies()

       
        let pikerview=UIPickerView()
        let secondePikerView=UIPickerView()
        let toolBar = UIToolbar()
        pikerview.tag=1
        secondePikerView.tag=2
        toolBar.sizeToFit()
        let doneButton=UIBarButtonItem(title:"اختار",style:.plain,target:self,action:#selector(donePickerView) )

        
        let spaceButton = UIBarButtonItem(barButtonSystemItem:  UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let cancelButton=UIBarButtonItem(title:"الغاء",style:.plain,target:self,action:#selector(cancelPickerView) )
        
        toolBar.setItems([doneButton,spaceButton,cancelButton],
                         animated: false)
        
        
                         pikerview.reloadAllComponents()
        secondePikerView.reloadAllComponents()
        
        pikerview.delegate=self
        pikerview.dataSource=self
        secondePikerView.delegate=self
        secondePikerView.dataSource=self
        earea.inputAccessoryView=toolBar
        city.inputAccessoryView=toolBar
        

        earea.inputView = pikerview
        city.inputView = secondePikerView
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    //////////////////
    @objc func donePickerView(){
        
        if(areaString != ""){
            earea.text=areaString
            areaString=""
        }
        if(CityString != ""){
     city.text = CityString
            CityString=""
        }
        self.view.endEditing(true)
        
    }
////////////////
    @objc func cancelPickerView(){
        self.view.endEditing(true)
    }
 
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch  pickerView.tag{
        case 1:
            return areaData.count
            
            
        case 2:
            return cityData.count
        default:
            return 0
        }
        
       
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch  pickerView.tag{
        case 1:
            return areaData[row].name
            
            
        case 2:
           return cityData[row].name
        default:
            return " "
        }
        
        
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch  pickerView.tag{
        case 1:
           areaString=areaData[row].name
            earea.text=areaData[row].name
            areaId=areaData[row].id
            
        case 2:
             CityString=cityData[row].name
            city.text=CityString
            cityId=cityData[row].id
        default:
            print("no thing")
            
        }
        
        
    }
    
    
    @IBAction func newLogin(_ sender: Any) {
        guard  let username = username.text else {return }
        guard let email = email.text else {return }
        guard let phone = phoneNumber.text else {return }
        let area_id=areaId
        let city_id=cityId
        guard let password=password.text else{return}
        guard let confirmation_password=conformPassword.text else{return}
        let body=["username":username,"email":email,"phone":phone,"area_id":area_id,"city_id":city_id,"password":password,"confirmation_password":confirmation_password] as [String : Any]
    
        
        API.POST(URL: URLS.RGISTER, method: .post, body: body, header: nil, completion: {(sucess,value) in
            if sucess {
                print(value)
                if (value["message"] as! String == "Success"){
                    print("Sucess Rgister")
                    let storyboard=UIStoryboard.init(name: "AuthSB", bundle: nil)
                    let vc=storyboard.instantiateViewController(withIdentifier: "LoginCV") as! LoginCV
                    self.show(vc, sender: nil)
                    
                }
                else if (value["message"] as! String == "Validation Error") {
                    if let errors = value["errors"] as? [String:Any] {
                        if let email = errors["email"] as? [String] {
                            print(email[0])
                            self.makeAlert(email[0])
                        }
                        if let phone = errors["phone"] as? [String] { print(phone[0])
                            
                            self.makeAlert(phone[0])
                        }
                    
                
                        
                        if let username = errors["username"] as? [String] {
                            self.makeAlert(username[0])
                        }
            
                        
                        if let area_id=errors["area_id"] as?[String]{
                            print(area_id[0])
                            self.makeAlert(area_id[0])
                        }
                        if let city_id=errors["city_id"] as? [String]{
                            print(city_id[0])
                        }
                        if let passworderr=errors["password"] as? [String]{
                            print(passworderr[0])
                            self.makeAlert(passworderr[0])
                        }
                        if let confirmation=errors["confirmation_password"]as?[String]{
                            print(confirmation[0])
                            self.makeAlert(confirmation[0])
                        }
                      
                    }
                    
                    if let errcofurm=value["error"] as? String{
                        print(errcofurm)
                        self.makeAlert(errcofurm)
                    }
 
                }
            }
                
        })
    }
    
    func setAllAreaArrayAndCityies(){
        cityData=[]
        areaData=[]
        
        API.GET(URL: URLS.BASE_Cities, method: .get, hedeer: nil,completion: {(success,value) in
            
            if success{
                print("succcesss ffhhh")
                if(value["message"] as! String == "Success"){
                    let cityArr=value["cities"] as? [[String :Any]] ?? [["" :""]]
                    if cityArr.count > 0{
                        for area in cityArr {
                        
                            if  let name = area["name"]{
                                let id=area["id"] as? Int ?? 0
                                let created_at=area["created_at"] as? String ?? ""
                                let updated_at=area["updated_at"] as? String ?? ""
                                
                                let cityinst=City(name: name as! String, id: id , created_at: created_at,updated_at:updated_at)
                            
                                
                                self.cityData.append(cityinst)
                                print(name)
                                
                            }
                        
                            
                        }
                        
                    }
                    
        
                    
                }
                
            }
            
            else{
                
            }
            
        })//Get City
        
        API.GET(URL: URLS.BASE_AREA, method: .get, hedeer: nil, completion: {(success,value) in
            
            if success {
                if(value["message"] as! String == "Success"){
                    let areaArr=value["areas"] as? [[String :Any]] ?? [["" :""]]
                    if areaArr.count > 0{
                        for area in areaArr {
                            
                            if  let name = area["name"] {
                                let id=area["id"] as? Int ?? 0
                                let created_at=area["created_at"] as? String ?? ""
                                let updated_at=area["updated_at"] as? String ?? ""
                                
                                let areainst=Area(name: name as! String, id: id , created_at: created_at,updated_at:updated_at)
                                
                                self.areaData.append(areainst as! Area)
                                print(name)
                                
                            }
                            
                            
                        }
                        
                    }
                    
                    
                    
                }
                
            }
            
        })
        
        
        
        
        
    
    }
    
    func makeAlert(_ message:String){
        let alert = UIAlertController.init(title: "try again", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction.init(title: "ok", style: UIAlertActionStyle.default, handler:nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
