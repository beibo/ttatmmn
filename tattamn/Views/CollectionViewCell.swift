//
//  CollectionViewCell.swift
//  tattamn
//
//  Created by heba sami on 7/10/18.
//  Copyright © 2018 heba sami. All rights reserved.
//

import UIKit
import Kingfisher
import Cosmos

class CollectionViewCell: UICollectionViewCell {
  
    @IBOutlet var nameUser:UILabel?

    @IBOutlet weak var rateUserCosmos: CosmosView!
    
    @IBOutlet weak var UserImage: UIImageView!
    
    
    override func prepareForReuse() {
     self.UserImage.image = nil
        self.rateUserCosmos.rating = 0
    }
    
    
    func configureCell(user:User){
        self.nameUser?.text = user.userName
        self.UserImage.kf.setImage(with: URL(string:URLS.BASE_IMAGE+user.avatar))
        print(user.user_rate)
        self.rateUserCosmos.rating = user.user_rate
        print(self.rateUserCosmos.rating)
    }
    
}
