//
//  ReturnOrderModels.swift
//  OSA
//
//  Created by Happy Sanz Tech on 24/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//



class ReturnReasonListModels : NSObject {
    
    var id : String?
    var question : String?
    var user_type : String?
    var status : String?
    var created_at : String?
    var updated_at : String?
   
   
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
        if let data = dict["id"] as? String {
             self.id = data
        }
        if let data = dict["question"] as? String {
            self.question = data
        }
        if let data = dict["user_type"] as? String {
            self.user_type = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
        if let data = dict["created_at"] as? String {
            self.created_at = data
        }
        if let data = dict["updated_at"] as? String {
            self.updated_at = data
        }
    }
    
     class func build(_ dict: [String: AnyObject]) -> ReturnReasonListModels {
        let model = ReturnReasonListModels()
        model.loadFromDictionary(dict)
        return model
     }
}
