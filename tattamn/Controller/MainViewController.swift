//
//  MainViewController.swift
//  tattamn
//
//  Created by heba sami on 7/9/18.
//  Copyright © 2018 heba sami. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
import SwiftyJSON
import Kingfisher
import Cosmos


class MainViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var FristUsernameLable: UILabel!
    
    @IBOutlet weak var fristUserImgeView: UIImageView!
  
    @IBOutlet weak var fristCollectionView: UICollectionView!
    
    @IBOutlet weak var secondeCollectionView: UICollectionView!
    
    var bestUserArr = [User]()
    var ratedusersArray=[User]()
    
    var latestusersArray=[User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fristCollectionView.delegate=self
        fristCollectionView.dataSource=self
        
        secondeCollectionView.delegate=self
        secondeCollectionView.dataSource=self
        
        API.GET(URL: URLS.GetHome, method: .get, hedeer: nil) { (success, value) in
            if success{
                
                let arrbest=value["bestuser"] as! [[String:AnyObject]]
                if arrbest.count>0{
                    for user in arrbest{
                        let username=user["username"] as? String ?? ""
                        let avatar=user["avatar"] as? String ?? ""
                        let rateUser=user["user_rate"] as? Double ?? 0.0
                        let userObj=User(userName: username, avatar:avatar, user_rate:rateUser)
                        self.bestUserArr=[]
                        self.bestUserArr.append(userObj)
    
                    }
                }
                

                self.FristUsernameLable.text=self.bestUserArr[0].userName as? String ?? ""
                
                let imgeString:String?=self.bestUserArr[0].avatar as? String ?? ""
                
                let urlimage=URL(string:URLS.BASE_IMAGE+imgeString!)
                self.fristUserImgeView.kf.setImage(with: urlimage)
         
             
                let ratedusers = value["ratedusers"] as! [[String:AnyObject]]
                if ratedusers.count > 0{
                    for user in ratedusers{
                        let username=user["username"] as? String ?? ""
                        let avatar=user["avatar"] as? String ?? ""
                        let rateUser=user["user_rate"] as? Double ?? 0.0
                        let userObj=User(userName: username, avatar:avatar, user_rate:rateUser)
                        
                        self.ratedusersArray.append(userObj)
                        
                    }
                }
                
                
                let latestusers=value["latestusers"] as! [[String:AnyObject]]
                
                if latestusers.count > 0{
                   
                        for user in latestusers{
                            let username=user["username"] as? String ?? ""
                            let avatar=user["avatar"] as? String ?? ""
                            let rateUser=user["user_rate"] as? Double ?? 0.0
                            let userObj=User(userName: username, avatar:avatar, user_rate:rateUser)
                            
                            self.latestusersArray.append(userObj)
                            
                        }
                    
                    
                }
                
                self.fristCollectionView.reloadData()
                self.secondeCollectionView.reloadData()
            }
            else{
                print("not ")
            }
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.fristCollectionView{
          
            return ratedusersArray.count
        }
        else{
            
            return latestusersArray.count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.fristCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"fristCell", for:indexPath) as?  CollectionViewCell else { return UICollectionViewCell() }
            
            
            cell.configureCell(user: bestUserArr[indexPath.row])
        
        
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"secondCell", for:indexPath) as! CollectionViewCell
            
            
          
            cell.configureCell(user: latestusersArray[indexPath.row])
         
        
            return cell
            
        }
    
        
    }
    
   
    @IBAction func openSideMenuBtnPreesed(_ sender: Any) {
        self.slideMenuController()?.toggleRight()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.fristCollectionView{
            
            let user = ratedusersArray[indexPath.row]
            print(user.user_rate)
        }
        else{
            
            let user = latestusersArray[indexPath.row]
            print(user.user_rate)
            
        }
    }
}
