//
//  NavigationBarTitleOnLeftSide.swift
//  OPS
//
//  Created by Happy Sanz Tech on 01/10/20.
//

import UIKit

extension UIViewController
{
    func navTitleOnLeftSide (){
        
        let longTitleLabel = UILabel()
        if LocalizationSystem.sharedInstance.getLanguage() == "en"
        {
            longTitleLabel.text = "O.Panneerselvam"
        }
        else
        {
            longTitleLabel.text = "ஓ.பன்னீர்செல்வம்"
        }
            longTitleLabel.font = UIFont(name: "Poppins-Medium", size: 18)
            longTitleLabel.textColor = UIColor.white
            longTitleLabel.sizeToFit()

            let leftItem = UIBarButtonItem(customView: longTitleLabel)
            self.navigationItem.leftBarButtonItem = leftItem
//            self.navigationItem.backGroundColor = UIColor.red
    }
}
