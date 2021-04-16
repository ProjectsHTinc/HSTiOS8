//
//  FilterModels.swift
//  OSA
//
//  Created by Happy Sanz Tech on 31/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

class ListFilterModels : NSObject {
    
    var id : String?
    var parent_id : String?
    var category_name : String?
    var category_image : String?
    var category_thumbnail : String?
    var category_desc : String?
    var category_meta_title : String?
    var category_meta_desc : String?
    var category_keywords : String?
    var status : String?
    var created_at : String?
    var created_by : String?
    var updated_at : String?
    var updated_by : String?
   
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
      
        if let data = dict["id"] as? String {
             self.id = data
        }
        if let data = dict["parent_id"] as? String {
            self.parent_id = data
        }
        if let data = dict["category_name"] as? String {
            self.category_name = data
        }
        if let data = dict["category_image"] as? String {
            self.category_image = data
        }
        if let data = dict["category_thumbnail"] as? String {
             self.category_thumbnail = data
        }
        if let data = dict["category_desc"] as? String {
            self.category_desc = data
        }
        if let data = dict["category_meta_title"] as? String {
            self.category_meta_title = data
        }
        if let data = dict["category_meta_desc"] as? String {
            self.category_meta_desc = data
        }
        if let data = dict["category_keywords"] as? String {
             self.category_keywords = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
        if let data = dict["created_at"] as? String {
            self.created_at = data
        }
        if let data = dict["created_by"] as? String {
            self.created_by = data
        }
        if let data = dict["updated_at"] as? String {
             self.updated_at = data
        }
        if let data = dict["updated_by"] as? String {
            self.updated_by = data
        }
    }
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> ListFilterModels {
         let model = ListFilterModels()
         model.loadFromDictionary(dict)
         return model
     }
}
class SizeListModels : NSObject {
    
    var mas_size_id : String?
    var size : String?
    var cat_id : String?
    var sub_cat_id : String?
   
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
      
        if let data = dict["mas_size_id"] as? String {
             self.mas_size_id = data
        }
        if let data = dict["size"] as? String {
            self.size = data
        }
        if let data = dict["cat_id"] as? String {
            self.cat_id = data
        }
        if let data = dict["sub_cat_id"] as? String {
            self.sub_cat_id = data
        }
        
    }
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> SizeListModels {
         let model = SizeListModels()
         model.loadFromDictionary(dict)
         return model
     }
}

class ColourListModels : NSObject {
    
    var sub_cat_id : String?
    var cat_id : String?
    var mas_color_id : String?
    var attribute_value : String?
    var attribute_name : String?
    
   
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
      
        if let data = dict["sub_cat_id"] as? String {
             self.sub_cat_id = data
        }
        if let data = dict["cat_id"] as? String {
            self.cat_id = data
        }
        if let data = dict["mas_color_id"] as? String {
            self.mas_color_id = data
        }
        if let data = dict["attribute_value"] as? String {
            self.attribute_value = data
        }
        if let data = dict["attribute_name"] as? String {
             self.attribute_name = data
        }
       
    }
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> ColourListModels {
         let model = ColourListModels()
         model.loadFromDictionary(dict)
         return model
     }
}


class ResultFilterModels : NSObject {
    
    var id : String?
    var parent_id : String?
    var category_name : String?
    var category_image : String?
    var category_thumbnail : String?
    var category_desc : String?
    var category_meta_title : String?
    var category_meta_desc : String?
    var category_keywords : String?
    var status : String?
    var created_at : String?
    var created_by : String?
    var updated_at : String?
    var updated_by : String?
   
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
      
        if let data = dict["id"] as? String {
             self.id = data
        }
        if let data = dict["parent_id"] as? String {
            self.parent_id = data
        }
        if let data = dict["category_name"] as? String {
            self.category_name = data
        }
        if let data = dict["category_image"] as? String {
            self.category_image = data
        }
        if let data = dict["category_thumbnail"] as? String {
             self.category_thumbnail = data
        }
        if let data = dict["category_desc"] as? String {
            self.category_desc = data
        }
        if let data = dict["category_meta_title"] as? String {
            self.category_meta_title = data
        }
        if let data = dict["category_meta_desc"] as? String {
            self.category_meta_desc = data
        }
        if let data = dict["category_keywords"] as? String {
             self.category_keywords = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
        if let data = dict["created_at"] as? String {
            self.created_at = data
        }
        if let data = dict["created_by"] as? String {
            self.created_by = data
        }
        if let data = dict["updated_at"] as? String {
             self.updated_at = data
        }
        if let data = dict["updated_by"] as? String {
            self.updated_by = data
        }
    }
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> ResultFilterModels {
         let model = ResultFilterModels()
         model.loadFromDictionary(dict)
         return model
     }
}
