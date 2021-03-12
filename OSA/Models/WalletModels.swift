//
//  WalletModels.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/03/21.
//

import Foundation

class WalletDetailsModels : NSObject {
    
    var created_at : String?
    var id : String?
    var transaction_amt : String?
    var status : String?
    var created_by : String?
    var customer_id : String?
    var notes : String?
    var order_id : String?
   
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
        if let data = dict["created_at"] as? String {
             self.created_at = data
        }
        if let data = dict["id"] as? String {
            self.id = data
        }
        if let data = dict["transaction_amt"] as? String {
            self.transaction_amt = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
        if let data = dict["created_by"] as? String {
            self.created_by = data
        }
        if let data = dict["customer_id"] as? String {
             self.customer_id = data
        }
        if let data = dict["notes"] as? String {
            self.notes = data
        }
        if let data = dict["order_id"] as? String {
            self.order_id = data
        }
    }
    
     class func build(_ dict: [String: AnyObject]) -> WalletDetailsModels {
        let model = WalletDetailsModels()
        model.loadFromDictionary(dict)
        return model
     }
}

class AddMoneyToWalletModels {
    
    var msg : String?
    var status : String?
    var order_id : String?
    var amount : String?
   
    
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
        if let data = dict["amount"] as? String {
            self.amount = data
        }
    }
}
