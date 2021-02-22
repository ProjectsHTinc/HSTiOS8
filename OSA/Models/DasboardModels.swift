//
//  DasboardModels.swift
//  OSA
//
//  Created by Happy Sanz Tech on 18/02/21.
//

import Foundation
import UIKit

class DashBoardDetailModels : NSObject {
    
    var id : String?
    var banner_title : String?
    var banner_desc : String?
    var banner_image : String?
    var product_id : String?
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
         if let data = dict["id"] as? String {
             self.id = data
         }

        if let data = dict["banner_title"] as? String {
            self.banner_title = data
        }
        
        if let data = dict["banner_desc"] as? String {
            self.banner_desc = data
        }
        
        if let data = dict["banner_image"] as? String {
            self.banner_image = data
        }
        if let data = dict["product_id"] as? String {
            self.product_id = data
        }
     }
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> DashBoardDetailModels {
         let model = DashBoardDetailModels()
         model.loadFromDictionary(dict)
         return model
     }
    
}

class CategoryDetailModels : NSObject {
    
    var id : String?
    var parent_id : String?
    var category_image : String?
    var category_desc : String?
    var category_name : String?
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
         if let data = dict["id"] as? String {
             self.id = data
         }

        if let data = dict["parent_id"] as? String {
            self.parent_id = data
        }
        
        if let data = dict["category_image"] as? String {
            self.category_image = data
        }
        
        if let data = dict["category_desc"] as? String {
            self.category_desc = data
        }
        if let data = dict["category_name"] as? String {
            self.category_name = data
        }
     }
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> CategoryDetailModels {
         let model = CategoryDetailModels()
         model.loadFromDictionary(dict)
         return model
     }
}

