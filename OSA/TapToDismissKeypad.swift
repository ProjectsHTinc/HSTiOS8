//
//  TapToDismissKeypad.swift
//  Constituent
//
//  Created by Happy Sanz Tech on 15/06/20.
//  Copyright © 2020 HappySanzTech. All rights reserved.
//

import UIKit

extension UIViewController
{
    func hideKeyboardWhenTappedAround()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
}
extension UITextField {

enum Direction {
    case Left
    case Right
}

// add image to textfield
func withImage(direction: Direction, image: UIImage, colorSeparator: UIColor, colorBorder: UIColor){
    let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
    mainView.layer.cornerRadius = 5

    let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
    view.backgroundColor = .white
    view.clipsToBounds = true
    view.layer.cornerRadius = 5
    view.layer.borderWidth = CGFloat(0.5)
    view.layer.borderColor = colorBorder.cgColor
    mainView.addSubview(view)

    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    imageView.frame = CGRect(x: 12.0, y: 10.0, width: 24.0, height: 24.0)
    view.addSubview(imageView)

    let seperatorView = UIView()
    seperatorView.backgroundColor = colorSeparator
    mainView.addSubview(seperatorView)

    if(Direction.Left == direction){ // image left
        seperatorView.frame = CGRect(x: 45, y: 0, width: 5, height: 45)
        self.leftViewMode = .always
        self.leftView = mainView
    } else { // image right
        seperatorView.frame = CGRect(x: 0, y: 0, width: 5, height: 45)
        self.rightViewMode = .always
        self.rightView = mainView
    }

    self.layer.borderColor = colorBorder.cgColor
    self.layer.borderWidth = CGFloat(0.5)
    self.layer.cornerRadius = 5
}

}
