
//  ReciveOrderViewController.swift
//  tattamn
//
//  Created by heba sami on 7/16/18.
//  Copyright © 2018 heba sami. All rights reserved.


import UIKit

class ReciveOrderViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
  let datepicker=UIDatePicker()
  let timePickerView=UIDatePicker()
    var namecountry1:String=""
     var namecountry2:String=""
    var transprtStr:String=""
    
    
    let countryArray:[String]=["مصر","لبيا","اليمن","الرياض","الجزائر","المغرب","السعوديه","دبى"]
    
    let typeOfTransportArray:[String]=["برى","جوى"]
    
    @IBOutlet weak var heigthOfHidenView: NSLayoutConstraint!
    @IBOutlet weak var hidenView: UIView!
    
    @IBOutlet weak var cuntryFromTF: UITextField!

    @IBOutlet weak var countryMoveToTF: UITextField!
    
    @IBOutlet weak var DateTextFiled: UITextField!


    @IBOutlet weak var timetextField: UITextField!
    
    @IBOutlet weak var TypeTransportTextFiled: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
let countryPickerview2 = UIPickerView()
        
    countryPickerview2.delegate=self
    countryPickerview2.dataSource=self
    countryPickerview2.tag=2
    //////////
let countryPickerview1 = UIPickerView()
        countryPickerview1.delegate=self
        countryPickerview1.dataSource=self
        countryPickerview1.tag=1
  ///////////
let transportPickerView = UIPickerView()
   transportPickerView.delegate=self
   transportPickerView.dataSource=self
   transportPickerView.tag=4
        
    //////
    datepicker.tag=3
    datepicker.datePickerMode = .date
    DateTextFiled.inputView=datepicker
      
        //////
        timePickerView.datePickerMode = .time
        timetextField.inputView=timePickerView
                
let toolbar = UIToolbar()
 let toolbardate=UIToolbar()
 let  toolbartime=UIToolbar()
toolbartime.sizeToFit()
    
        toolbardate.sizeToFit()
toolbar.sizeToFit()
        let doneButton=UIBarButtonItem(title:"اختار",style:.plain,target:self,action:#selector(donePickerView) )
        let doneButtondate=UIBarButtonItem(title:"اختار",style:.plain,target:self,action:#selector(donedatePicker) )
        
        let  doneButtonTime=UIBarButtonItem(title:"اختار",style: .plain,target:self,action:#selector(doneTimePicker))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem:  UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
         let cancelButton=UIBarButtonItem(title:"الغاء",style:.plain,target:self,action:#selector(cancelPickerView) )
        let canceDatelButton=UIBarButtonItem(title:"الغاء",style:.plain,target:self,action:#selector(cancelPickerView) )
          let canceTimelButton=UIBarButtonItem(title:"الغاء",style:.plain,target:self,action:#selector(cancelPickerView) )
        
toolbar.setItems([doneButton,spaceButton,cancelButton],
                 animated: false)
toolbardate.setItems([doneButtondate,spaceButton,canceDatelButton],animated: false)
    
toolbartime.setItems([doneButtonTime,spaceButton,canceTimelButton],animated: false)

countryMoveToTF.inputAccessoryView = toolbar
countryMoveToTF.inputView = countryPickerview2
cuntryFromTF.inputAccessoryView=toolbar
cuntryFromTF.inputView=countryPickerview1
cuntryFromTF.inputAccessoryView=toolbar
DateTextFiled.inputAccessoryView=toolbardate
timetextField.inputAccessoryView=toolbartime
TypeTransportTextFiled.inputAccessoryView=toolbar
TypeTransportTextFiled.inputView=transportPickerView
        
    
    }//didload
   
    @objc func donedatePicker(){
        print("date")
        let formatter = DateFormatter()
        formatter.dateFormat="dd/MM/yyyy"
       DateTextFiled.text=formatter.string(for:datepicker.date)
    
       
        self.view.endEditing(true)
    }//done
    
    
    @objc func doneTimePicker(){
        print("time")
        let formatter=DateFormatter()
        formatter.timeStyle = .short
        timetextField.text = formatter.string(from: timePickerView.date)
        self.view.endEditing(true)
    }//done
    
    
    @objc func donePickerView(){
        if(namecountry1 != ""){
            cuntryFromTF.text!=namecountry1
            namecountry1=""
        }
        if(namecountry2 != ""){
            countryMoveToTF.text!=namecountry2
            namecountry2=""
        }
        
        if(transprtStr != ""){
            TypeTransportTextFiled.text!=transprtStr
            if(transprtStr=="برى"){
                print("برى")
                if(hidenView.isHidden == false){
                    hidenView.isHidden=true
                     heigthOfHidenView.constant=0
                }
                
            }
            else if transprtStr=="جوى"{
                print("جوى")
            heigthOfHidenView.constant=125
               hidenView.isHidden=false
            }
            
           transprtStr=""
        }
              self.view.endEditing(true)
         
        }//done
    
    
    @objc func cancelPickerView(){
    self.view.endEditing(true)
    }//cancel
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag==1){
            return countryArray.count}
        if pickerView.tag==2{
            return countryArray.count
        }
        if pickerView.tag==4{
            return typeOfTransportArray.count
        }
   return 1
    
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int, forComponent component: Int) ->
        String? {
            switch pickerView.tag {
            case 1: return countryArray[row]
            case 2:return countryArray[row]
            case 4:return typeOfTransportArray[row]
            default:
                return ""
            }
    }

    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:namecountry1=countryArray[row]
      
            
            
            
        case 2: namecountry2=countryArray[row]
        
            
        case 4:transprtStr=typeOfTransportArray[row]
      
            
        default:
            print("nothing")
        }
    
}
   
}//class vc
