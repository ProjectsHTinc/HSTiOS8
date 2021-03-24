//
//  OrderHistoryViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 22/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import UIKit

class OrderHistoryViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var deleviredOrderView: UIView!
    @IBOutlet weak var transitView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        segmentedControl.setTitle("Delivered Orders", forSegmentAt: 0)
        segmentedControl.setTitle("In Transit", forSegmentAt: 1)
        deleviredOrderView.alpha  = 1
        transitView.alpha   = 0
    }
    
    @IBAction func segmentControllAction(_ sender: Any) {
        
        if (sender as AnyObject).selectedSegmentIndex == 0
        {
            deleviredOrderView.alpha  = 1
            transitView.alpha   = 0
        }
        else
        {
            deleviredOrderView.alpha   = 0
            transitView.alpha = 1
        }
    }
}
