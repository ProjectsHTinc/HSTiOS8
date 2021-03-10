//
//  CheckOutModels.swift
//  OSA
//
//  Created by Happy Sanz Tech on 08/03/21.
//

import Foundation

class DeliveryAddressModels : NSObject {
    
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
    
     class func build(_ dict: [String: AnyObject]) -> DeliveryAddressModels {
        let model = DeliveryAddressModels()
        model.loadFromDictionary(dict)
        return model
     }
}

class PromoCodeModels {
    
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

class PlaceOrderModels{
    
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

class OrderDetailsModels{
    
    var promo_amount : String?
    var paid_amount : String?
    var total_amount : String?
    var wallet_amount : String?
    
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["promo_amount"] as? String {
            self.promo_amount = data
        }
        if let data = dict["paid_amount"] as? String { 
            self.paid_amount = data
        }
        if let data = dict["total_amount"] as? String {
            self.total_amount = data
        }
        if let data = dict["wallet_amount"] as? String {
            self.wallet_amount = data
        }
    }
    
    class func build(_ dict: [String: AnyObject]) -> OrderDetailsModels {
       let model = OrderDetailsModels()
       model.loadFromDictionary(dict)
       return model
    }
}
//"address_mode" = 1;
//"address_type_id" = 0;
//"alternative_mobile_number" = 2;
//"browser_sess_id" = "";
//city = cbe;
//"country_id" = 1;
//"country_name" = India;
//"created_at" = "0000-00-00 00:00:00";
//"created_by" = 2147483647;
//"cus_address_id" = 11;
//"cus_id" = 3;
//"cus_notes" = "";
//"email_address" = 2;
//"full_name" = 2;
//"house_no" = 2;
//id = 11;
//landmark = 2;
//"mobile_number" = 2;
//"order_id" = "SHOP20210309F49117-3";
//"paid_amount" = "0.00";
//"payment_status" = "";
//pincode = 2;
//"promo_amount" = "0.00";
//"purchase_date" = "2021-03-09 12:50:57";
//"purchse_order_id" = 17;
//state = "tAMIL nADU";
//status = Active;
//street = 2;
//"total_amount" = "0.00";
//"updated_at" = "0000-00-00 00:00:00";
//"updated_by" = 0;
//"wallet_amount" = "0.00";
//}
//);
