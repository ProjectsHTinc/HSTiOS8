//
//  Menu.swift
//  OSA
//
//  Created by Happy Sanz Tech on 11/02/21.
//

import UIKit

class Menu: UIViewController {

    private var navigationBarWasHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Save if it was hidden initially
        self.navigationBarWasHidden = self.navigationController?.isNavigationBarHidden ?? false
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
                                                                                                                                
