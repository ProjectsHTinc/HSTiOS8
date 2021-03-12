//
//  AddMoneyToWalletModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/03/21.
//
import Foundation
import UIKit

struct AddMoneyToWalletModel{
    struct Fetch {
        
        struct Request
        {
            
            var amount : String?
            var user_id : String? 
        }
        
        struct Response
        {
            var testObj: AddMoneyToWalletModels?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel
        {
            var msg : String?
            var status : String?
            var order_id : String?
            var amount : String?
            var isError: Bool
            var message: String?
        }
    }
}
