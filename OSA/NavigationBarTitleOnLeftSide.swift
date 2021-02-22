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
    
//            longTitleLabel.font = UIFont(name: "", size: 18)
            longTitleLabel.textColor = UIColor.white
            longTitleLabel.sizeToFit()

            let leftItem = UIBarButtonItem(customView: longTitleLabel)
            self.navigationItem.leftBarButtonItem = leftItem
//            self.navigationItem.backGroundColor = UIColor.red
    }
}
