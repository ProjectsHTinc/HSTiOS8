//
//  UpdateReviewModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 25/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation
import UIKit

struct UpdateReviewModel{
    struct Fetch {
        
        struct Request
        {
            
            var product_id : String?
            var user_id : String?
            var comment : String?
            var rating : String?
            var review_id : String?
        }
     
        struct Response
        {
            var testObj: UpdateReviewModels?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel
        {
            var msg : String?
            var status : String?
            var isError: Bool
            var message: String?
        }
    }
}
