//
//  PasswordUpdateModels.swift
//  OSA
//
//  Created by Happy Sanz Tech on 26/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation


class CheckPasswordModels {
    
    var msg : String?
    var status : String?
       
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["msg"] as? String {
            self.msg = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
    }
}

class ChangePasswordModels {
    
    var msg : String?
    var status : String?
       
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["msg"] as? String {
            self.msg = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
    }
}
