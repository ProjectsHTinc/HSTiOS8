//
//  AddressModels.swift
//  OSA
//
//  Created by Happy Sanz Tech on 09/03/21.
//

import Foundation


class AddressListModels : NSObject {
    
    var address_type : String?
    var alternative_mobile_number : String?
    var city : String?
    var email_address : String?
    var full_name : String?
    var house_no : String?
    var id : String?
    var landmark : String?
    var mobile_number : String?
    var pincode : String?
    var state : String?
    var street : String?
    var address_mode : String?
   
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
        if let data = dict["address_type"] as? String {
             self.address_type = data
        }
        if let data = dict["alternative_mobile_number"] as? String {
            self.alternative_mobile_number = data
        }
        if let data = dict["city"] as? String {
            self.city = data
        }
        if let data = dict["email_address"] as? String {
            self.email_address = data
        }
        if let data = dict["full_name"] as? String {
            self.full_name = data
        }
        if let data = dict["house_no"] as? String {
             self.house_no = data
        }
        if let data = dict["id"] as? String {
            self.id = data
        }
        if let data = dict["landmark"] as? String {
            self.landmark = data
        }
        if let data = dict["mobile_number"] as? String {
           self.mobile_number = data
        }
        if let data = dict["pincode"] as? String {
           self.pincode = data
        }
        if let data = dict["state"] as? String {
            self.state = data
        }
        if let data = dict["street"] as? String {
            self.street = data
        }
        if let data = dict["address_mode"] as? String {
            self.address_mode = data
        }
    }
    
     class func build(_ dict: [String: AnyObject]) -> AddressListModels {
        let model = AddressListModels()
        model.loadFromDictionary(dict)
        return model
     }
}

class AddAddressModels {
    
    var msg : String?
    var status : String?
    var address_id : String?
   
    
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["msg"] as? String {
            self.msg = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
        if let data = dict["address_id"] as? String {
            self.address_id = data
        }
    }
}

class DeleteAddressModels{
    
    var status : String?
    
    
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
       
        if let data = dict["status"] as? String {
            self.status = data
        }
    }
}

class UpdateAddressModels{
    
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
class DefaultAddressModels{
    
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
