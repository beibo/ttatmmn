
//
//  loadImageViewController.swift
//  tattamn
//
//  Created by heba sami on 7/21/18.
//  Copyright © 2018 heba sami. All rights reserved.
//

import UIKit
import Photos
import  Kingfisher
import Cosmos
class ProfileVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var areaLable: UILabel!
    
    @IBOutlet weak var segementContrl: UISegmentedControl!
    @IBOutlet weak var cityLable: UILabel!
    
    @IBOutlet weak var countOforderLable: UILabel!
    
    let imagePicker=UIImagePickerController()

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var allOrdersLable: UILabel!
    
    @IBOutlet weak var acountAPPLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate=self
        // Do any additional setup after loading the view.
        uplaodDataFromUserDefaults()
       
    
    }
    @IBOutlet weak var MoneyIsbaiedLable: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    
        
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
           self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.title="حسابى"
        self.navigationItem.backBarButtonItem?.title=""
    
    
    }
    
    @IBAction func loadImagePressBTN(_ sender: Any) {
//        imagePicker.allowsEditing=true
//        imagePicker.sourceType = .photoLibrary
//        present(imagePicker,animated: true,completion:nil)
        
        
        let opetionMenu = UIAlertController(title:nil,message:"Choose Option",preferredStyle:.actionSheet)
        
        let galleryAction=UIAlertAction(title:"Gallery",style:.default,handler:{
            (alert:UIAlertAction)->Void in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            self.imagePicker.allowsEditing=true
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker,animated: true,completion:nil)
            }
            else{
                print("no photo library")
                var alert=UIAlertView(title:"Sorry",message:"لا يوجد معرض الصور",delegate:nil,cancelButtonTitle:"Ok")
                alert.show();
            }
            
        })
        
        let CameraAction=UIAlertAction(title:"Camera",style:.default,handler:{
            (alert:UIAlertAction)->Void in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
            self.imagePicker.allowsEditing=true
       
            self.imagePicker.sourceType = .camera
                self.present(self.imagePicker,animated: true,completion:nil)}
            else{
                var alert=UIAlertView(title:"Sory",message:"الكاميرا لاتعمل",delegate:nil,cancelButtonTitle:"Ok")
                alert.show();
            }
        })
        
        
        let CancelAction=UIAlertAction(title:"Cancel",style:.cancel,handler:{
            (alert:UIAlertAction)->Void in
            //opetionMenu.dismiss(animated: true, completion: nil)
        })
        opetionMenu.addAction(galleryAction)
        opetionMenu.addAction(CameraAction)
        opetionMenu.addAction(CancelAction)
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            if let act = opetionMenu.popoverPresentationController {
//                act.sourceView = button
//                act.sourceRect = button.bouns
            }
            self.present(opetionMenu, animated: true, completion: nil)
        } else {
            self.present(opetionMenu, animated: true, completion: nil)
        }
        
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info [UIImagePickerControllerOriginalImage] as? UIImage{
//
        
            imageView.image=pickedImage
         
            
        }
        if let editImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            imageView.image=editImage
        }
        dismiss(animated: true,completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
         dismiss(animated: true,completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func uplaodDataFromUserDefaults(){
        let imageStr=UserDefaults.standard.string(forKey:"avatar")
        let url=URL(string:URLS.BASE_IMAGE+imageStr!)
        imageView.kf.setImage(with: url)
        
     
        nameLable.text = getstingDataFromUserDefault("username") as? String ?? ""
   
        cityLable.text=getstingDataFromUserDefault("city_name")as? String ?? ""
        areaLable.text=getstingDataFromUserDefault("area_name" )as? String ?? ""
        countOforderLable.text=getstingDataFromUserDefault("order_num")  as? String ?? ""
        countOforderLable.text = countOforderLable.text! + " " + " طلب"
        allOrdersLable.text=getstingDataFromUserDefault("order_price") as? String ?? ""
        if allOrdersLable.text != ""{
            allOrdersLable.text = allOrdersLable.text! + "  " + "ريال"
            
        }
        MoneyIsbaiedLable.text = getstingDataFromUserDefault("user_payment") as? String ?? ""
        if MoneyIsbaiedLable.text != ""{
            MoneyIsbaiedLable.text=MoneyIsbaiedLable.text! + "  " + "ريال"
        }
        let status=getstingDataFromUserDefault("status") as? Int ?? 0
        switch status {
        case 0:
            segementContrl.selectedSegmentIndex=1
            
        case 1:
            segementContrl.selectedSegmentIndex=0
            
        default:
            print(" jjj")
        }
        
        
        
        
        
    
        
        
        
        
    
    }
    func getstingDataFromUserDefault(_ Str:String)->Any{
        let strr=UserDefaults.standard.string(forKey: Str)
        return strr
    }


}
