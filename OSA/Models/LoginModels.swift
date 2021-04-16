//
//  LoginServices.swift
//  OSA
//
//  Created by Happy Sanz Tech on 05/02/21.
//

import Foundation
import UIKit


class MobileLoginModel {
    
    var msg : String?
    var status : String?
    var OTP: String?
    
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["msg"] as? String {
            self.msg = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
        if let data = dict["OTP"] as? String {
            self.OTP = data
        }
    }
}

class EmailLoginModels {
    
    var address_id : String?
    var birth_date : String?
    var customer_id : String?
    var first_name : String?
    var last_login : String?
    var last_name : String?
    var newsletter_status : String?
    var phone_number : String?
    var profile_picture : String?
    var status : String?
    var email : String?

    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["address_id"] as? String {
            self.address_id = data
        }
        if let data = dict["birth_date"] as? String {
            self.birth_date = data
        }
        if let data = dict["customer_id"] as? String {
            self.customer_id = data
        }
        if let data = dict["first_name"] as? String {
            self.first_name = data
        }
        if let data = dict["last_login"] as? String {
            self.last_login = data
        }
        if let data = dict["last_name"] as? String {
            self.last_name = data
        }
        if let data = dict["newsletter_status"] as? String {
            self.newsletter_status = data
        }
        if let data = dict["phone_number"] as? String {
            self.phone_number = data
        }
        if let data = dict["profile_picture"] as? String {
            self.profile_picture = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
        if let data = dict["email"] as? String {
            self.email = data
        }
        
    }
}

class OTPModels {
    
    var address_id : String?
    var birth_date : String?
    var customer_id : String?
    var first_name : String?
    var last_login : String?
    var last_name : String?
    var newsletter_status : String?
    var phone_number : String?
    var profile_picture : String?
    var status : String?
    var email : String?
    
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["address_id"] as? String {
            self.address_id = data
        }
        if let data = dict["birth_date"] as? String {
            self.birth_date = data
        }
        if let data = dict["customer_id"] as? String {
            self.customer_id = data
        }
        if let data = dict["first_name"] as? String {
            self.first_name = data
        }
        if let data = dict["last_login"] as? String {
            self.last_login = data
        }
        if let data = dict["last_name"] as? String {
            self.last_name = data
        }
        if let data = dict["newsletter_status"] as? String {
            self.newsletter_status = data
        }
        if let data = dict["phone_number"] as? String {
            self.phone_number = data
        }
        if let data = dict["profile_picture"] as? String {
            self.profile_picture = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
        if let data = dict["email"] as? String {
            self.email = data
        }
    }
}

class ForgotPasswordModels {
    
    var address_id : String?
    var birth_date : String?
    var customer_id : String?
    var first_name : String?
    var last_login : String?
    var last_name : String?
    var newsletter_status : String?
    var phone_number : String?
    var profile_picture : String?
    var status : String?

    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["address_id"] as? String {
            self.address_id = data
        }
        if let data = dict["birth_date"] as? String {
            self.birth_date = data
        }
        if let data = dict["customer_id"] as? String {
            self.customer_id = data
        }
        if let data = dict["first_name"] as? String {
            self.first_name = data
        }
        if let data = dict["last_login"] as? String {
            self.last_login = data
        }
        if let data = dict["last_name"] as? String {
            self.last_name = data
        }
        if let data = dict["newsletter_status"] as? String {
            self.newsletter_status = data
        }
        if let data = dict["phone_number"] as? String {
            self.phone_number = data
        }
        if let data = dict["profile_picture"] as? String {
            self.profile_picture = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
    }
}

class SignUpModels {
    
    
    var status : String?

    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
       
       
        if let data = dict["status"] as? String {
            self.status = data
        }
    }
}


class GoogleIntegrationModels {
    
    
    var address_id : String?
    var birth_date : String?
    var customer_id : String?
    var first_name : String?
    var last_login : String?
    var last_name : String?
    var newsletter_status : String?
    var phone_number : String?
    var profile_picture : String?
    var status : String?
    var email : String?
    
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["address_id"] as? String {
            self.address_id = data
        }
        if let data = dict["birth_date"] as? String {
            self.birth_date = data
        }
        if let data = dict["customer_id"] as? String {
            self.customer_id = data
        }
        if let data = dict["first_name"] as? String {
            self.first_name = data
        }
        if let data = dict["last_login"] as? String {
            self.last_login = data
        }
        if let data = dict["last_name"] as? String {
            self.last_name = data
        }
        if let data = dict["newsletter_status"] as? String {
            self.newsletter_status = data
        }
        if let data = dict["phone_number"] as? String {
            self.phone_number = data
        }
        if let data = dict["profile_picture"] as? String {
            self.profile_picture = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
        if let data = dict["email"] as? String {
            self.email = data
        }
    }
}
