//
//  ViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 02/02/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let navigationbar = self.navigationController?.navigationBar {
            navigationbar.setGradientBackground(colors: [UIColor(red: 189.0/255.0, green: 6.0/255.0, blue: 33.0/255.0, alpha: 1.0), UIColor(red: 95.0/255.0, green: 3.0/255.0, blue: 17.0/255.0, alpha: 1.0)], startPoint: .topLeft, endPoint: .bottomRight)
            backView.layer.cornerRadius = 15
        }
    }
}
