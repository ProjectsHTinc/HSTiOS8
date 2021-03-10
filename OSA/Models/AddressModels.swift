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
    var product_name : String?
    var state : String?
    var street : String?
   
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
        if let data = dict["product_name"] as? String {
           self.product_name = data
        }
        if let data = dict["state"] as? String {
            self.state = data
        }
        if let data = dict["street"] as? String {
            self.street = data
        }
    }
    
     class func build(_ dict: [String: AnyObject]) -> AddressListModels {
        let model = AddressListModels()
        model.loadFromDictionary(dict)
        return model
     }
}
