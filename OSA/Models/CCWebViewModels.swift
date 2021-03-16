//
//  CCWebViewModels.swift
//  OSA
//
//  Created by Happy Sanz Tech on 13/03/21.
//

import Foundation

class CCWebViewModels{
    
    var msg : String?
    var status : String?
    var order_id : String?
   
    
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["msg"] as? String {
            self.msg = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
        if let data = dict["order_id"] as? String {
            self.order_id = data
        }
    }
}
