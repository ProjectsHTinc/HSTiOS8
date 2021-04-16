//
//  CCWebViewWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 13/03/21.
//

//
//import Foundation
//import UIKit
//
//typealias CCWebViewresponseHandler = (_ response:CCWebViewModel.Fetch.Response) ->()
//
//class CCWebViewWorker{
//
//   func fetch(promo_code_id:String,user_id:String,purchse_order_id:String, onSuccess successCallback:(CCWebViewresponseHandler)?,onFailure failureCallback: @escaping(CCWebViewresponseHandler)) {
//       let manager = APIManager()
//       manager.callAPICCWebView(
//        promo_code_id:promo_code_id,user_id:user_id, purchse_order_id:purchse_order_id, onSuccess: { (resp)  in
//               successCallback?(CCWebViewModel.Fetch.Response(testObj:resp, isError: false, message:nil))
//           },
//               onFailure: { (errorMessage) in
//                   failureCallback(CCWebViewModel.Fetch.Response(testObj: nil, isError: true, message:nil))
//           }
//       )
//   }
//}
