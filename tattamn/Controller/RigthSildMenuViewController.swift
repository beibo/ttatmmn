//
//  LeftViewController.swift
//  tattamn
//
//  Created by heba sami on 7/9/18.
//  Copyright © 2018 heba sami. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class RigthSildMenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var userImageView: UIImageView!
    struct TableViewIteamCell {
        var icon:String
        var title:String
    }
     var dataIteamCellArray:[TableViewIteamCell]=[]
    var arrayIcon:[String]=["profile disactive","sm order","envelope","sm order","sm money","sm notification","sm settings","sm information","sm phone-call","sm exit"]
    
    var arrayTitle:[String]=["الصفحه الشخصيه","طلب جديد","الرسائل","الطالبات","الدفع","الاشعارات","الاعدادات","الشروط والاحكام","تواصل معنا","تسجيل خروج"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.dataSource=self
        self.tableview.delegate=self
        
     
        
    
        
       
        // Do any additional setup after loading the view.
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! SlidMenuTableViewCell
        cell.titleLabel.text = arrayTitle[indexPath.row]
        cell.iconImage.image = UIImage(named:arrayIcon[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(arrayIcon[indexPath.row])
        
        switch arrayIcon[indexPath.row]{
        case "sm exit":moveToCV(nameOfCV:"login")
        case "sm order":moveToCV(nameOfCV:"order",indexOfVC:1)
        case "profile disactive":moveToCV(nameOfCV:"MyAcount",indexOfVC:3)
        case "sm notification": moveToCV(nameOfCV:"notification",indexOfVC:2)

        case "sm settings":moveToCV(nameOfCV:"sitings",indexOfVC:4)
        default:
            print("noting")
        }
    }

    func moveToCV(nameOfCV:String,indexOfVC:Int=0){
        let storybord=UIStoryboard(name:"Main",bundle:nil )
        if ((nameOfCV=="order")||(nameOfCV=="MyAcount")||(nameOfCV=="notification")||(nameOfCV=="sitings")){
            let rigthVC=storybord.instantiateViewController(withIdentifier:"slideMenu") as! RigthSildMenuViewController
            let mainvc = storybord.instantiateViewController(withIdentifier:"tabBar") as! HomeTabBarViewController
        
         
            let slideMenu = SlideMenuController(mainViewController:mainvc,rightMenuViewController:rigthVC)
            
            mainvc.selectedIndex=indexOfVC
            self.present(slideMenu, animated: true, completion: nil)
            
            
        }else{
        let vc=storybord.instantiateViewController(withIdentifier: nameOfCV)
        self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func openSlid(_ sender: Any) {
        print("jjhhj")
    }
    @IBAction func openSlidmenu(_ sender: Any) {
    print("jjhhj")
    }
}
