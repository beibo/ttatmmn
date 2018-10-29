//
//  loadImageViewController.swift
//  tattamn
//
//  Created by heba sami on 7/21/18.
//  Copyright © 2018 heba sami. All rights reserved.
//

import UIKit
import Photos
class ProfileVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    let imagePicker=UIImagePickerController()

    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate=self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    
        
        // Dispose of any resources that can be recreated.
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

}
