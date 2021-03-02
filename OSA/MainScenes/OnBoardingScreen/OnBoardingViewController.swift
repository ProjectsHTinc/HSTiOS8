//
//  OnBoardingViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 02/03/21.
//

import UIKit

class OnBoardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getStartedAction(_ sender: Any) {
        UserDefaults.standard.setValue("yes", forKey: "getStartedKey")
        self.dismiss(animated: true, completion: nil)
    }
}
