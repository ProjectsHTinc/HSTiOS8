//
//  APIManager.swift
//  OSA
//
//  Created by HappysanziMac on 15/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager: NSObject {
    
    static let instance = APIManager()
    var manager: SessionManager {
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 3.0
        return manager
    }
    
    enum RequestMethod {
        case get
        case post
    }
    
    func createRequest (_ url: String,method: HTTPMethod,headers: [String: String]?,parameters: [String:String]?,onSuccess successCallback: ((JSON) -> Void)?,onFailure failureCallback: ((String) -> Void)?)
      {
      manager.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (responseObject) -> Void in
        print(responseObject)
        
        if responseObject.result.isSuccess
        {
            let resJson = JSON(responseObject.result.value!)
            successCallback?(resJson)
        }
        
        if responseObject.result.isFailure
        {
           let error : Error = responseObject.result.error!
            failureCallback!(error.localizedDescription)
        }
      }
    }
        
        func callAPIMobileLogin(mobile_no:String,onSuccess successCallback: ((_ login: MobileLoginModel) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
       // Build URL
           let url = APIURL.BaseUrl_Dev+APIFunctionName.loginMobileUrl
       // Set Parameters
       let parameters: Parameters =  ["mobile_number": mobile_no]
       // call API
       self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
       // Create dictionary
       print(responseObject)
         
       guard let msg = responseObject["msg"].string, msg == "Mobile Login" else{
             failureCallback?(responseObject["msg"].string!)
             return
        }
           
           let OTP =  responseObject["OTP"].string
           let message =  responseObject["msg"].string
           let status =  responseObject["status"].string
         
           let sendToModel = MobileLoginModel()
           sendToModel.OTP = OTP
           sendToModel.msg = message
           sendToModel.status = status

           successCallback?(sendToModel)
           
       },
       onFailure: {(errorMessage: String) -> Void in
           failureCallback?(errorMessage)
       }
     )
   }
        
        func callAPIEmailLogin(email_id:String,password:String,mob_key:String,mobile_type:String,onSuccess successCallback: ((_ login: EmailLoginModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
       // Build URL
           let url = APIURL.BaseUrl_Dev+APIFunctionName.loginEmailUrl
       // Set Parameters
       let parameters: Parameters =  ["email_id": email_id,"password": password,"mob_key": mob_key,"mobile_type": mobile_type,]
       // call API
       self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
       // Create dictionary
       print(responseObject)
         
       guard let msg = responseObject["msg"].string, msg == "Login Successfully" else{
             failureCallback?(responseObject["msg"].string!)
             return
        }
           
           let address_id =  responseObject["userData"]["address_id"].string
           let birth_date =  responseObject["userData"]["birth_date"].string
           let customer_id =  responseObject["userData"]["customer_id"].string
           let first_name =  responseObject["userData"]["first_name"].string
           let last_login =  responseObject["userData"]["last_login"].string
           let last_name =  responseObject["userData"]["last_name"].string
           let newsletter_status =  responseObject["userData"]["newsletter_status"].string
           let phone_number =  responseObject["userData"]["phone_number"].string
           let profile_picture =  responseObject["userData"]["profile_picture"].string
           let status =  responseObject["userData"]["status"].string
           let email =  responseObject["userData"]["email"].string
         
           let sendToModel = EmailLoginModels()
           sendToModel.address_id = address_id
           sendToModel.birth_date = birth_date
           sendToModel.customer_id = customer_id
           sendToModel.first_name = first_name
           sendToModel.last_login = last_login
           sendToModel.status = status
           sendToModel.last_name = last_name
           sendToModel.newsletter_status = newsletter_status
           sendToModel.status = status
           sendToModel.phone_number = phone_number
           sendToModel.profile_picture = profile_picture
           sendToModel.status = status
           sendToModel.email = email
        
           successCallback?(sendToModel)
           
       },
       onFailure: {(errorMessage: String) -> Void in
           failureCallback?(errorMessage)
       }
     )
   } 
        func callAPIOTP(mobile_number:String,OTP:String,mob_key:String,mobile_type:String,login_type:String,login_portal:String,onSuccess successCallback: ((_ login: OTPModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
       // Build URL
           let url = APIURL.BaseUrl_Dev+APIFunctionName.mobileOtpUrl
       // Set Parameters
       let parameters: Parameters =  ["mobile_number": mobile_number,"OTP": OTP,"mob_key": mob_key,"mobile_type": mobile_type,"login_type": login_type,"login_portal": login_portal]
       // call API
       self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
       // Create dictionary
       print(responseObject)
         
       guard let msg = responseObject["msg"].string, msg == "Login Successfully" else{
             failureCallback?(responseObject["msg"].string!)
             return
        }
           
           let address_id =  responseObject["userData"]["address_id"].string
           let birth_date =  responseObject["userData"]["birth_date"].string
           let customer_id =  responseObject["userData"]["customer_id"].string
           let first_name =  responseObject["userData"]["first_name"].string
           let last_login =  responseObject["userData"]["last_login"].string
           let last_name =  responseObject["userData"]["last_name"].string
           let newsletter_status =  responseObject["userData"]["newsletter_status"].string
           let phone_number =  responseObject["userData"]["phone_number"].string
           let profile_picture =  responseObject["userData"]["profile_picture"].string
           let status =  responseObject["status"].string
           let email =  responseObject["userData"]["email"].string
         
           let sendToModel = OTPModels()
           sendToModel.address_id = address_id
           sendToModel.birth_date = birth_date
           sendToModel.customer_id = customer_id
           sendToModel.first_name = first_name
           sendToModel.last_login = last_login
           sendToModel.status = status
           sendToModel.last_name = last_name
           sendToModel.newsletter_status = newsletter_status
           sendToModel.status = status
           sendToModel.phone_number = phone_number
           sendToModel.profile_picture = profile_picture
           sendToModel.status = status
           sendToModel.email = email
        
           successCallback?(sendToModel)
           
       },
       onFailure: {(errorMessage: String) -> Void in
           failureCallback?(errorMessage)
       }
     )
   } 
        
        func callAPIForgotEmail(email:String,onSuccess successCallback: ((_ login: ForgotPasswordModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
       // Build URL
           let url = APIURL.BaseUrl_Dev+APIFunctionName.forgotEmailPasswordUrl
       // Set Parameters
       let parameters: Parameters =  ["email": email]
       // call API
       self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
       // Create dictionary
       print(responseObject)
         
       guard let msg = responseObject["msg"].string, msg == "OTP Generated" else{
             failureCallback?(responseObject["msg"].string!)
             return
        }
           
           let address_id =  responseObject["userData"]["address_id"].string
           let birth_date =  responseObject["userData"]["birth_date"].string
           let customer_id =  responseObject["userData"]["customer_id"].string
           let first_name =  responseObject["userData"]["first_name"].string
           let last_login =  responseObject["userData"]["last_login"].string
           let last_name =  responseObject["userData"]["last_name"].string
           let newsletter_status =  responseObject["userData"]["newsletter_status"].string
           let phone_number =  responseObject["userData"]["phone_number"].string
           let profile_picture =  responseObject["userData"]["profile_picture"].string
           let status =  responseObject["userData"]["status"].string
    
         
           let sendToModel = ForgotPasswordModels()
           sendToModel.address_id = address_id
           sendToModel.birth_date = birth_date
           sendToModel.customer_id = customer_id
           sendToModel.first_name = first_name
           sendToModel.last_login = last_login
           sendToModel.status = status
           sendToModel.last_name = last_name
           sendToModel.newsletter_status = newsletter_status
           sendToModel.status = status
           sendToModel.phone_number = phone_number
           sendToModel.profile_picture = profile_picture
           sendToModel.status = status

           successCallback?(sendToModel)
       },
       onFailure: {(errorMessage: String) -> Void in
           failureCallback?(errorMessage)
       }
     )
   }
        func callAPISignUp(name:String,phone:String,email:String,password:String,onSuccess successCallback: ((_ login: SignUpModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
       // Build URL
           let url = APIURL.BaseUrl_Dev+APIFunctionName.signUpUrl
       // Set Parameters
       let parameters: Parameters =  ["name": name,"phone": phone,"email": email,"password": password]
       // call API
       self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
       // Create dictionary
       print(responseObject)
         
       guard let msg = responseObject["msg"].string, msg == "Signup Successfully" else{
             failureCallback?(responseObject["msg"].string!)
             return
        }
          
           let status =  responseObject["status"].string
           let sendToModel = SignUpModels()
           sendToModel.status = status

           successCallback?(sendToModel)
       },
       onFailure: {(errorMessage: String) -> Void in
           failureCallback?(errorMessage)
       }
     )
   }
        
        func callAPIGoogleIntegration(email:String,first_name:String,last_name:String,mobile_type:String,mob_key:String,login_type:String,login_portal:String,onSuccess successCallback: ((_ login: GoogleIntegrationModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
       // Build URL
           let url = APIURL.BaseUrl_Dev+APIFunctionName.socialLoginUrl
       // Set Parameters
       let parameters: Parameters =  ["email": email,"first_name": first_name,"last_name": last_name,"mobile_type": mobile_type,"login_type": login_type,"login_portal": login_portal]
       // call API
       self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
       // Create dictionary
       print(responseObject)
         
       guard let msg = responseObject["msg"].string, msg == "Login Successfully" else{
             failureCallback?(responseObject["msg"].string!)
             return
        }
           
           let address_id =  responseObject["userData"]["address_id"].string
           let birth_date =  responseObject["userData"]["birth_date"].string
           let customer_id =  responseObject["userData"]["customer_id"].string
           let first_name =  responseObject["userData"]["first_name"].string
           let last_login =  responseObject["userData"]["last_login"].string
           let last_name =  responseObject["userData"]["last_name"].string
           let newsletter_status =  responseObject["userData"]["newsletter_status"].string
           let phone_number =  responseObject["userData"]["phone_number"].string
           let profile_picture =  responseObject["userData"]["profile_picture"].string
           let status =  responseObject["userData"]["status"].string
           let email =  responseObject["userData"]["email"].string
         
           let sendToModel = GoogleIntegrationModels()
           sendToModel.address_id = address_id
           sendToModel.birth_date = birth_date
           sendToModel.customer_id = customer_id
           sendToModel.first_name = first_name
           sendToModel.last_login = last_login
           sendToModel.status = status
           sendToModel.last_name = last_name
           sendToModel.newsletter_status = newsletter_status
           sendToModel.status = status
           sendToModel.phone_number = phone_number
           sendToModel.profile_picture = profile_picture
           sendToModel.status = status
           sendToModel.email = email
        
           successCallback?(sendToModel)
           
       },
       onFailure: {(errorMessage: String) -> Void in
           failureCallback?(errorMessage)
       }
     )
   }
    
    func callAPIBestSellingDetails(user_id:String, onSuccess successCallback: ((_ resp: [BestSellingDetailModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.dashBoardUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["popular_product_list"]["data"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [BestSellingDetailModels]()
                  for item in toModel {
                      let single = BestSellingDetailModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
     }
    
    func callAPICategoryDetails(user_id:String, onSuccess successCallback: ((_ resp: [CategoryDetailModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.dashBoardUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["cat_list"]["category_list"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [CategoryDetailModels]()
                  for item in toModel {
                      let single = CategoryDetailModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
     }
    
            
    func callAPIDasboardDetails(user_id:String, onSuccess successCallback: ((_ resp: [DashBoardDetailModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.dashBoardUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["banner_list"]["data"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [DashBoardDetailModels]()
                  for item in toModel {
                      let single = DashBoardDetailModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
     }
    
    func callAPINewArrivalsDetails(user_id:String, onSuccess successCallback: ((_ resp: [NewArrivalsDetailModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.dashBoardUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["new_product"]["data"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [NewArrivalsDetailModels]()
                  for item in toModel {
                      let single = NewArrivalsDetailModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
     }
    
    func callAPIAdvertisementDetails(user_id:String, onSuccess successCallback: ((_ resp: [AdvertisementDetailModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.dashBoardUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["ads_list"]["data"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [AdvertisementDetailModels]()
                  for item in toModel {
                      let single = AdvertisementDetailModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
     }
    
    
    func callAPISearchList(user_id:String,search_name:String, onSuccess successCallback: ((_ resp: [SearchListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.serachProductUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id,"search_name": search_name]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["product_list"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [SearchListModels]()
                  for item in toModel {
                      let single = SearchListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
     }
    
    
    func callAPIRecentSearchList(user_id:String, onSuccess successCallback: ((_ resp: [RecentSearchListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.recentSearchListUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["search_keywords"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [RecentSearchListModels]()
                  for item in toModel {
                      let single = RecentSearchListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
     }
    
    func callAPICategorySelectDetails(cat_id:String, onSuccess successCallback: ((_ resp: [CategorySelectDetailModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.categoryListURL
         // Set Parameters
         let parameters: Parameters =  ["cat_id": cat_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["sub_category_list"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [CategorySelectDetailModels]()
                  for item in toModel {
                      let single = CategorySelectDetailModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
     }
    
    func callAPISubCategoryListDetails(cat_id:String,user_id:String,sub_cat_id:String, onSuccess successCallback: ((_ resp: [SubCategoryListDetailModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.subCatListDetailsURL
         // Set Parameters
         let parameters: Parameters =  ["cat_id": cat_id,"sub_cat_id": sub_cat_id,"user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["product_list"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [SubCategoryListDetailModels]()
                  for item in toModel {
                      let single = SubCategoryListDetailModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
     }
    
    
    func callAPIProductDetails(product_id:String,onSuccess successCallback: ((_ login: ProductDetailsModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
   // Build URL
       let url = APIURL.BaseUrl_Dev+APIFunctionName.productDetailsURL
   // Set Parameters
   let parameters: Parameters =  ["product_id": product_id]
   // call API
   self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
   // Create dictionary
   print(responseObject)
     
    
   guard let msg = responseObject["msg"].string, msg == "product details" else{
         failureCallback?(responseObject["msg"].string!)
         return
    }
    GlobalVariables.shared.product_detail_reviewCount = responseObject["product_review"]["product_review"]["average"].string!
    print(GlobalVariables.shared.product_detail_reviewCount)
       let id =  responseObject["product_details"]["product_details"]["id"].string
       let product_name =  responseObject["product_details"]["product_details"]["product_name"].string
       let sku_code =  responseObject["product_details"]["product_details"]["sku_code"].string
       let product_cover_img =  responseObject["product_details"]["product_details"]["product_cover_img"].string
       let prod_size_chart =  responseObject["product_details"]["product_details"]["prod_size_chart"].string
       let product_description =  responseObject["product_details"]["product_details"]["product_description"].string
       let prod_actual_price =  responseObject["product_details"]["product_details"]["prod_actual_price"].string
       let prod_mrp_price =  responseObject["product_details"]["product_details"]["prod_mrp_price"].string
       let offer_percentage =
        responseObject["product_details"]["product_details"]["offer_percentage"].string
       let product_meta_title =  responseObject["product_details"]["product_details"]["product_meta_title"].string
       let product_meta_desc =  responseObject["product_details"]["product_details"]["product_meta_desc"].string
       let stocks_left =  responseObject["product_details"]["product_details"]["stocks_left"].string
//       let product_review =  responseObject["product_details"]["product_details"]["product_review"].string
     
       let sendToModel = ProductDetailsModels()
       sendToModel.id = id
       sendToModel.product_name = product_name
       sendToModel.sku_code = sku_code
       sendToModel.product_cover_img = product_cover_img
       sendToModel.prod_size_chart = prod_size_chart
       sendToModel.product_description = product_description
       sendToModel.prod_actual_price = prod_actual_price
       sendToModel.prod_mrp_price = prod_mrp_price
       sendToModel.offer_percentage = offer_percentage
       sendToModel.product_meta_title = product_meta_title
       sendToModel.product_meta_desc = product_meta_desc
       sendToModel.stocks_left = stocks_left
//       sendToModel.product_review = product_review
    
       successCallback?(sendToModel)
       
   },
   onFailure: {(errorMessage: String) -> Void in
       failureCallback?(errorMessage)
   }
 )
}
    
    func callAPIProductSize(product_id:String, onSuccess successCallback: ((_ resp: [ProductSizeModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.ProductSizeUrl
         // Set Parameters
         let parameters: Parameters =  ["product_id": product_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["product_size"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [ProductSizeModels]()
                  for item in toModel {
                      let single = ProductSizeModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
     }
    
    func callAPIProductColour(product_id:String,size_id:String, onSuccess successCallback: ((_ resp: [ProductColourModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.productColourUrl
         // Set Parameters
         let parameters: Parameters =  ["product_id": product_id,"size_id": size_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["product_color"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [ProductColourModels]()
                  for item in toModel {
                      let single = ProductColourModels.build(item)
                      data.append(single)
                  }
            
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
     }
    
    func callAPIRelatedProduct(product_id:String, onSuccess successCallback: ((_ resp: [RelatedProductModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.productDetailsURL
         // Set Parameters
         let parameters: Parameters =  ["product_id": product_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["related_products"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [RelatedProductModels]()
                  for item in toModel {
                      let single = RelatedProductModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
     }
    
    func callAPIReviewList(product_id:String, onSuccess successCallback: ((_ resp: [ReviewListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.ProductReviewListUrl
         // Set Parameters
         let parameters: Parameters =  ["product_id": product_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["product_reviews"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [ReviewListModels]()
                  for item in toModel {
                      let single = ReviewListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
     }
    
    func callAPIListFilter(user_id:String,cat_id:String,sub_cat_id:String, onSuccess successCallback: ((_ resp: [ListFilterModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.listFilterDetailsUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id,"cat_id": cat_id,"sub_cat_id":sub_cat_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["sub_category_list"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [ListFilterModels]()
                  for item in toModel {
                      let single = ListFilterModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
     }
    
    func callAPISizeList(user_id:String,cat_id:String,sub_cat_id:String, onSuccess successCallback: ((_ resp: [SizeListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.resultFilterDetailsUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id,"cat_id": cat_id,"sub_cat_id":sub_cat_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["size_list"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [SizeListModels]()
                  for item in toModel {
                      let single = SizeListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
     }
    
    
    func callAPIResultFilter(user_id:String,cat_id:String,sub_cat_id:String,min_price_range:String,max_price_range:String,product_size_id:String,product_colour_id:String, onSuccess successCallback: ((_ resp: [ResultFilterModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.resultFilterDetailsUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id,"cat_id": cat_id,"sub_cat_id":sub_cat_id,"min_price_range": min_price_range,"max_price_range": max_price_range,"product_size_id":product_size_id,"product_colour_id":product_colour_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["election_result"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [ResultFilterModels]()
                  for item in toModel {
                      let single = ResultFilterModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
     }
    
    func callAPICheckPincode(pin_code:String,onSuccess successCallback: ((_ login: CheckPinCodeModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.checkPinCodeUrl
         // Set Parameters
         let parameters: Parameters =  ["pin_code": pin_code]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     
         guard let msg = responseObject["msg"].string, msg == "No Delivery for this Area" else{
          failureCallback?(responseObject["msg"].string!)
           return
         }
          let message =  responseObject["msg"].string
          let status =  responseObject["status"].string
     
          let sendToModel = CheckPinCodeModels()
           
           sendToModel.msg = message
           sendToModel.status = status

           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
    
    func callAPIAddToCart(product_id:String,product_comb_id:String,quantity:String,user_id:String,onSuccess successCallback: ((_ login: AddToCartModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.addToCartUrl
         // Set Parameters
         let parameters: Parameters =  ["product_id": product_id,"product_comb_id": product_comb_id,"quantity": quantity,"user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     
         guard let STATUS = responseObject["status"].string, STATUS == "success" else{
          failureCallback?(responseObject["status"].string!)
           return
         }
          let message =  responseObject["msg"].string
          let status =  responseObject["status"].string
     
          let sendToModel = AddToCartModels()
           
           sendToModel.msg = message
           sendToModel.status = status

           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
    
    func callAPIWishListAdd(product_id:String,user_id:String,onSuccess successCallback: ((_ login: WishListAddModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.wishListAddUrl
         // Set Parameters
         let parameters: Parameters =  ["product_id": product_id,"user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     
         guard let msg = responseObject["msg"].string, msg == "Wishlist Added" else{
          failureCallback?(responseObject["msg"].string!)
           return
         }
          let message =  responseObject["msg"].string
          let status =  responseObject["status"].string
     
          let sendToModel = WishListAddModels()
           
           sendToModel.msg = message
           sendToModel.status = status

           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
    
    func callAPIWishListDelete(product_id:String,user_id:String,onSuccess successCallback: ((_ login: WishListDeleteModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.wishListDeleteUrl
         // Set Parameters
         let parameters: Parameters =  ["product_id": product_id,"user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     
         guard let msg = responseObject["msg"].string, msg == "Wishlist Removed" else{
          failureCallback?(responseObject["msg"].string!)
           return
         }
          let message =  responseObject["msg"].string
          let status =  responseObject["status"].string
     
          let sendToModel = WishListDeleteModels()
           
           sendToModel.msg = message
           sendToModel.status = status

           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
    
    func callAPIWishList(user_id:String, onSuccess successCallback: ((_ resp: [WishListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.wishListListUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["product_list"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [WishListModels]()
                  for item in toModel {
                      let single = WishListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
    }
    
    func callAPIAddReview(product_id:String,user_id:String,comment:String,rating:String,onSuccess successCallback: ((_ login: AddReviewModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.productReviewAddUrl
         // Set Parameters
         let parameters: Parameters =  ["product_id": product_id,"user_id": user_id,"comment": comment,"rating": rating]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     
         guard let msg = responseObject["msg"].string, msg == "Review Added" || msg == "Review added already" else{
          failureCallback?(responseObject["msg"].string!)
           return
         }
          let message =  responseObject["msg"].string
          let status =  responseObject["status"].string
     
          let sendToModel = AddReviewModels()
           
           sendToModel.msg = message
           sendToModel.status = status

           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
    
    func callAPICheckReview(product_id:String,user_id:String,onSuccess successCallback: ((_ login: CheckReviewModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.productCheckReviewUrl
         // Set Parameters
         let parameters: Parameters =  ["product_id": product_id,"user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     
         guard let msg = responseObject["msg"].string, msg == "Reviews found" else{
          failureCallback?(responseObject["msg"].string!)
           return
         }
          let message =  responseObject["product_review"]["msg"].string
          let status =  responseObject["product_review"]["status"].string
          let id =  responseObject["product_review"]["id"].string
          let product_id =  responseObject["product_review"]["product_id"].string
          let rating =  responseObject["product_review"]["rating"].string
          let comment =  responseObject["product_review"]["comment"].string
     
          let sendToModel = CheckReviewModels()
           
           sendToModel.msg = message
           sendToModel.status = status
           sendToModel.id = id
           sendToModel.product_id = product_id
           sendToModel.rating = rating
           sendToModel.comment = comment
            
           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }

    func callAPIUpdateReview(product_id:String,user_id:String,review_id:String,comment:String,rating:String,onSuccess successCallback: ((_ login: UpdateReviewModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.productUpdateReviewUrl
         // Set Parameters
         let parameters: Parameters =  ["product_id": product_id,"user_id": user_id,"comment": comment,"rating": rating]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     
         guard let msg = responseObject["msg"].string, msg == "Review Updated" else{
          failureCallback?(responseObject["msg"].string!)
           return
         }
          let message =  responseObject["msg"].string
          let status =  responseObject["status"].string
     
          let sendToModel = UpdateReviewModels()
           
           sendToModel.msg = message
           sendToModel.status = status

           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
    
    
    func callAPICartList(user_id:String, onSuccess successCallback: ((_ resp: [CartListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.cartListUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
            
            GlobalVariables.shared.total_cart_payment = responseObject["cart_payment"]["cart_payment"].string!
            
          if let responseDict = responseObject["view_cart_items"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [CartListModels]()
                  for item in toModel {
                      let single = CartListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
    }
    
    
//    func callAPIUpdateReview(product_id:String,user_id:String,review_id:String,comment:String,rating:String,onSuccess successCallback: ((_ login: DeleteCartModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
//         // Build URL
//         let url = APIURL.BaseUrl_Dev+APIFunctionName.loginMobileUrl
//         // Set Parameters
//         let parameters: Parameters =  ["product_id": product_id,"user_id": user_id,"comment": comment,"rating": rating]
//         // call API
//         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
//         // Create dictionary
//         print(responseObject)
//
//         guard let msg = responseObject["msg"].string, msg == "OTP Generated" else{
//          failureCallback?(responseObject["msg"].string!)
//           return
//         }
//          let message =  responseObject["msg"].string
//          let status =  responseObject["status"].string
//
//          let sendToModel = DeleteCartModels()
//
//           sendToModel.msg = message
//           sendToModel.status = status
//
//           successCallback?(sendToModel)
//
//         },
//          onFailure: {(errorMessage: String) -> Void in
//          failureCallback?(errorMessage)
//        }
//      )
//    }
    
    
    func callAPIDeleteCart(cart_id:String,user_id:String,onSuccess successCallback: ((_ login: DeleteCartModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.DeleteCartUrl
         // Set Parameters
         let parameters: Parameters =  ["cart_id": cart_id,"user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     
         guard let msg = responseObject["msg"].string, msg == "Product removed from cart" else{
          failureCallback?(responseObject["msg"].string!)
           return
         }
          let message =  responseObject["msg"].string
          let status =  responseObject["status"].string
     
          let sendToModel = DeleteCartModels()
           
           sendToModel.msg = message
           sendToModel.status = status

           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
    
    func callAPIQuantityUpdate(cart_id:String,user_id:String,cart_quantity:String,onSuccess successCallback: ((_ login: QuantityUpdateModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.quantityUpdateUrl
         // Set Parameters
         let parameters: Parameters =  ["cart_id": cart_id,"user_id": user_id,"cart_quantity": cart_quantity]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     
         guard let msg = responseObject["msg"].string, msg == "Product Quantity Updated" else{
          failureCallback?(responseObject["msg"].string!)
           return
         }
          let message =  responseObject["msg"].string
          let status =  responseObject["status"].string
     
          let sendToModel = QuantityUpdateModels()
           
           sendToModel.msg = message
           sendToModel.status = status

           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
     
    func callAPIWalletApply(purchse_order_id:String,user_id:String,onSuccess successCallback: ((_ login: WalletApllyModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.walletApplyUrl
         // Set Parameters
         let parameters: Parameters =  ["purchse_order_id": purchse_order_id,"user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     
         guard let msg = responseObject["msg"].string, msg == "OTP Generated" else{
          failureCallback?(responseObject["msg"].string!)
           return
         }
          let message =  responseObject["msg"].string
          let status =  responseObject["status"].string
     
          let sendToModel = WalletApllyModels()
           
           sendToModel.msg = message
           sendToModel.status = status

           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
    
    
    func callAPIDeliveryAddress(user_id:String, onSuccess successCallback: ((_ resp: [DeliveryAddressModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.addressListUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["address_list"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [DeliveryAddressModels]()
                  for item in toModel {
                      let single = DeliveryAddressModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
    }
    
    func callAPIPromoCode(purchse_order_id:String,user_id:String,promo_code:String,onSuccess successCallback: ((_ login: PromoCodeModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.promoCodeApplyUrl
         // Set Parameters
         let parameters: Parameters =  ["purchse_order_id": purchse_order_id,"user_id": user_id,"promo_code": promo_code]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     
         guard let msg = responseObject["msg"].string, msg == "Promo Code Error" else{
          failureCallback?(responseObject["msg"].string!)
           return
         }
          let message =  responseObject["msg"].string
          let status =  responseObject["status"].string
     
          let sendToModel = PromoCodeModels()
           
           sendToModel.msg = message
           sendToModel.status = status

           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
    
    func callAPIPlaceOrder(cus_notes:String,user_id:String,address_id:String,onSuccess successCallback: ((_ login: PlaceOrderModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.placeOrderUrl
         // Set Parameters
         let parameters: Parameters =  ["cus_notes": cus_notes,"user_id": user_id,"address_id": address_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
            
            GlobalVariables.shared.order_id = responseObject["order_id"].string!
            print(GlobalVariables.shared.order_id)
            
         guard let msg = responseObject["msg"].string, msg == "Order Successfully Placed" else{
          failureCallback?(responseObject["msg"].string!)
           return
            
            
         }
          let message =  responseObject["msg"].string
          let status =  responseObject["status"].string
          let order_id =  responseObject["order_id"].string
     
          let sendToModel = PlaceOrderModels()
           
           sendToModel.msg = message
           sendToModel.status = status
           sendToModel.order_id = order_id

           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
    
    func callAPIOrderDetails(user_id:String,order_id:String, onSuccess successCallback: ((_ resp: [OrderDetailsModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.orderDetailsUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id,"order_id": order_id]
        print(user_id)
        print(order_id)
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["order_details"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [OrderDetailsModels]()
                  for item in toModel {
                      let single = OrderDetailsModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
    }
    
    func callAPIRemovePromoCode(promo_code_id:String,user_id:String,purchse_order_id:String,onSuccess successCallback: ((_ login: RemovePromoCodeModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.removePromoCodeUrl
         // Set Parameters
         let parameters: Parameters =  ["promo_code_id": promo_code_id,"user_id": user_id,"purchse_order_id": purchse_order_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     
         guard let msg = responseObject["msg"].string, msg == "OTP Generated" else{
          failureCallback?(responseObject["msg"].string!)
           return
         }
          let message =  responseObject["msg"].string
          let status =  responseObject["status"].string
          let order_id =  responseObject["order_id"].string
     
          let sendToModel = RemovePromoCodeModels()
           
           sendToModel.msg = message
           sendToModel.status = status
           sendToModel.order_id = order_id

           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
    
    func callAPIAddressList(user_id:String,onSuccess successCallback: ((_ resp: [AddressListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.addressListUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["address_list"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [AddressListModels]()
                  for item in toModel {
                    let single = AddressListModels.build(item)
                    data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
    }
 
    func callAPIAddAddress(user_id:String,country_id:String,state:String,city:String,pincode:String,house_no:String,street:String,landmark:String,full_name:String,mobile_number:String,email_address:String,alternative_mobile_number:String,address_type:String,onSuccess successCallback: ((_ login: AddAddressModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
   // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.addAddressUrl
   // Set Parameters
        let parameters: Parameters =  ["user_id": user_id,"country_id": country_id,"state": state,"city": city,"pincode": pincode,"house_no": house_no,"street": street,"landmark": landmark,"full_name": full_name,"mobile_number": mobile_number,"email_address": email_address,"alternative_mobile_number": alternative_mobile_number,"address_type": address_type]
      // call API
      self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
       // Create dictionary
       print(responseObject)
     
        guard let msg = responseObject["msg"].string, msg == "Address Added" else{
          failureCallback?(responseObject["msg"].string!)
          return
       }
        let message =  responseObject["msg"].string
        let status =  responseObject["status"].string
        let address_id =  responseObject["address_id"].string

       let sendToModel = AddAddressModels()
     
        sendToModel.msg = message
        sendToModel.status = status
        sendToModel.address_id = address_id
  
           successCallback?(sendToModel)
       
        },
        onFailure: {(errorMessage: String) -> Void in
        failureCallback?(errorMessage)
        }
       )
    }
    
    func callAPIDeleteAddress(user_id:String,address_id:String,onSuccess successCallback: ((_ login: DeleteAddressModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.deleteAddressUrl
         // Set Parameters
         let parameters: Parameters =  ["address_id": address_id,"user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     
         guard let status = responseObject["status"].string, status == "success" else{
          failureCallback?(responseObject["msg"].string!)
           return
         }
    
          let sendToModel = DeleteAddressModels()
           
           sendToModel.status = status
         
           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
    
    func callAPIUpdateAddress(user_id:String,country_id:String,state:String,city:String,pincode:String,house_no:String,street:String,landmark:String,full_name:String,mobile_number:String,email_address:String,alternative_mobile_number:String,address_type:String,address_id:String,status:String,onSuccess successCallback: ((_ login: UpdateAddressModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
   // Build URL
       let url = APIURL.BaseUrl_Dev+APIFunctionName.updateAddressUrl
   // Set Parameters
   let parameters: Parameters =  ["user_id": user_id,"country_id": country_id,"state": state,"city": city,"pincode": pincode,"house_no": house_no,"street": street,"landmark": landmark,"full_name": full_name,"mobile_number": mobile_number,"email_address": email_address,"alternative_mobile_number": alternative_mobile_number,"address_type": address_type,"status": status]
   // call API
   self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
   // Create dictionary
   print(responseObject)
     
   guard let msg = responseObject["msg"].string, msg == "Address Update" else{
         failureCallback?(responseObject["msg"].string!)
         return
    }
    
       let message =  responseObject["msg"].string
       let status =  responseObject["status"].string
       let order_id =  responseObject["order_id"].string
     
       let sendToModel = UpdateAddressModels()
       sendToModel.msg = message
       sendToModel.status = status
       sendToModel.order_id = order_id
      
       successCallback?(sendToModel)
       
       },
         onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
    
    func callAPIDefaultAddress(user_id:String,address_id:String,onSuccess successCallback: ((_ login: DefaultAddressModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.setDefaultAddressUrl
         // Set Parameters
         let parameters: Parameters =  ["address_id": address_id,"user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     
         guard let msg = responseObject["msg"].string, msg == "Address Default Update" else{
          failureCallback?(responseObject["msg"].string!)
           return
         }
          let status =  responseObject["status"].string
     
          let sendToModel = DefaultAddressModels()
           
           sendToModel.status = status
         
           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
    
    func callAPIWalletDetails(user_id:String,onSuccess successCallback: ((_ resp: [WalletDetailsModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.walletDetailsUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
            GlobalVariables.shared.wallet_amount = responseObject["wallet_amount"].string!
            
          if let responseDict = responseObject["wallet_history"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [WalletDetailsModels]()
                  for item in toModel {
                      let single = WalletDetailsModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
    }
    
    func callAPIAddMoneyToWallet(user_id:String,amount:String,onSuccess successCallback: ((_ login: AddMoneyToWalletModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.addMoneyToWalletUrl
         // Set Parameters
         let parameters: Parameters =  ["amount": amount,"user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     
         guard let msg = responseObject["msg"].string, msg == "Add Money to Wallet" else{
          failureCallback?(responseObject["msg"].string!)
           return
         }
           
             let order_id =  responseObject["order_id"].string
             let amount =  responseObject["amount"].string
             let status =  responseObject["status"].string
             let message =  responseObject["msg"].string
     
          let sendToModel = AddMoneyToWalletModels()
           
            sendToModel.order_id = order_id
            sendToModel.amount = amount
            sendToModel.status = status
            sendToModel.msg = message
            
           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
    
    func callAPIReviewOrder(user_id:String,order_id:String,onSuccess successCallback: ((_ resp: [ReviewOrderModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.orderDetailsUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id,"order_id": order_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["election_result"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [ReviewOrderModels]()
                  for item in toModel {
                      let single = ReviewOrderModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
    }
    
    
    func callAPIPayCOD(order_id:String,user_id:String,onSuccess successCallback: ((_ login: PayCODModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.payCODUrl
         // Set Parameters
         let parameters: Parameters =  ["order_id": order_id,"user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     
         guard let msg = responseObject["msg"].string, msg == "OTP Generated" else{
          failureCallback?(responseObject["msg"].string!)
           return
         }
          let status =  responseObject["status"].string
     
          let sendToModel = PayCODModels()
            
           sendToModel.status = status
         
           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
    
    func callAPIProfileDetails(user_id:String,onSuccess successCallback: ((_ login: ProfileDetailsModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.profileDetailsUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     
         guard let msg = responseObject["msg"].string, msg == "Profile found" else{
          failureCallback?(responseObject["msg"].string!)
           return
         }
            
            let first_name =  responseObject["get_profile_details"]["first_name"].string
            let profile_picture =  responseObject["get_profile_details"]["profile_picture"].string
            let gender =  responseObject["get_profile_details"]["gender"].string
            let email =  responseObject["get_profile_details"]["email"].string
            let newsletter_status =  responseObject["get_profile_details"]["newsletter_status"].string
            let birth_date =  responseObject["get_profile_details"]["birth_date"].string
            let id =  responseObject["get_profile_details"]["id"].string
            let last_name =  responseObject["get_profile_details"]["last_name"].string
            let phone_number =  responseObject["get_profile_details"]["phone_number"].string
     
          let sendToModel = ProfileDetailsModels()
           
            sendToModel.first_name = first_name
            sendToModel.profile_picture = profile_picture
            sendToModel.gender = gender
            sendToModel.email = email
            sendToModel.newsletter_status = newsletter_status
            sendToModel.birth_date = birth_date
            sendToModel.id = id
            sendToModel.last_name = last_name
            sendToModel.phone_number = phone_number
         
           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
    
    func callAPIProfileUpdate(email:String,user_id:String,phone_number:String,gender:String,dob:String,newsletter_status:String,first_name:String,last_name:String,onSuccess successCallback: ((_ login: ProfileUpdateModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.profileUpdateUrl
         // Set Parameters
         let parameters: Parameters =  ["email": email,"user_id": user_id,"phone_number": phone_number,"gender": gender,"dob": dob,"newsletter_status": newsletter_status,"first_name": first_name,"last_name": last_name]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     
         guard let msg = responseObject["msg"].string, msg == "Profile Updated Successfully" else{
          failureCallback?(responseObject["msg"].string!)
           return
         }
          let status =  responseObject["status"].string
     
          let sendToModel = ProfileUpdateModels()
           
            sendToModel.status = status
            sendToModel.msg = msg
         
           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
    
    func callAPIDeliveredOrders(user_id:String,status:String,onSuccess successCallback: ((_ resp: [DeliveredOrdersModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.deliveredOrdersUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id,"status": status]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
            GlobalVariables.shared.orderCount = responseObject["order_count"].int!
          if let responseDict = responseObject["order_details"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [DeliveredOrdersModels]()
                  for item in toModel {
                      let single = DeliveredOrdersModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
    }
    
    func callAPIOrderCartDetails(user_id:String,order_id:String,onSuccess successCallback: ((_ resp: [OrderCartDetailsModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.orderCartDetailsUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id,"order_id": order_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["cart_details"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [OrderCartDetailsModels]()
                  for item in toModel {
                      let single = OrderCartDetailsModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
    }
    
    func callAPIReturnReasonList(user_id:String,onSuccess successCallback: ((_ resp: [ReturnReasonListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.returnReasonList
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["reason_list"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [ReturnReasonListModels]()
                  for item in toModel {
                    let single = ReturnReasonListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
    }
    
    func callAPICheckPassword(password:String,user_id:String,onSuccess successCallback: ((_ login: CheckPasswordModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.checkPasswordUrl
         // Set Parameters
         let parameters: Parameters =  ["password": password,"user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     

            guard let msg = responseObject["msg"].string, msg == "" else{
          failureCallback?(responseObject["msg"].string!)
           return
         }
          let status =  responseObject["status"].string
     
          let sendToModel = CheckPasswordModels()
           
            sendToModel.status = status
            sendToModel.msg = msg
         
           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
    
    func callAPIChangePassword(password:String,user_id:String,onSuccess successCallback: ((_ login: ChangePasswordModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.changePasswordUrl
         // Set Parameters
         let parameters: Parameters =  ["password": password,"user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     
         guard let msg = responseObject["msg"].string, msg == "OTP Generated" else{
          failureCallback?(responseObject["msg"].string!)
           return
         }
          let status =  responseObject["status"].string
     
          let sendToModel = ChangePasswordModels()
           
            sendToModel.status = status
            sendToModel.msg = msg
         
           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }
    
    func callAPINotificationList(user_id:String,onSuccess successCallback: ((_ resp: [NotificationListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.notificationListUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["offer_list"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [NotificationListModels]()
                  for item in toModel {
                      let single = NotificationListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
    }
    
    func callAPIColourList(user_id:String,cat_id:String,sub_cat_id:String,onSuccess successCallback: ((_ resp: [ColourListModels]) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.listFilterDetailsUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id,"cat_id": cat_id,"sub_cat_id": sub_cat_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)

           guard let status = responseObject["status"].string, status == "success" else{
               failureCallback?(responseObject["msg"
               ].string!)
               return
         }
          if let responseDict = responseObject["colour_list"].arrayObject
          {
                  let toModel = responseDict as! [[String:AnyObject]]
                  // Create object
                  var data = [ColourListModels]()
                  for item in toModel {
                      let single = ColourListModels.build(item)
                      data.append(single)
                  }
                  // Fire callback
                  successCallback?(data)
          } else {
              failureCallback?("An error has occured.")
          }
         },
         onFailure: {(errorMessage: String) -> Void in
             failureCallback?(errorMessage)
         }
      )
    }
    
    func callAPIReturnOrderRequest(user_id:String,purchase_order_id:String,reason_question_id:String,answer_text:String,onSuccess successCallback: ((_ login: ReturnOrderRequestsModels) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
         // Build URL
         let url = APIURL.BaseUrl_Dev+APIFunctionName.deleteAddressUrl
         // Set Parameters
         let parameters: Parameters =  ["user_id": user_id,"purchase_order_id": purchase_order_id,"answer_text": answer_text,"reason_question_id": reason_question_id]
         // call API
         self.createRequest(url, method: .post, headers: nil, parameters: parameters as? [String : String], onSuccess: {(responseObject: JSON) -> Void in
         // Create dictionary
         print(responseObject)
     
         guard let status = responseObject["status"].string, status == "success" else{
          failureCallback?(responseObject["msg"].string!)
           return
         }
    
          let sendToModel = ReturnOrderRequestsModels()
           
           sendToModel.status = status
         
           successCallback?(sendToModel)
       
         },
          onFailure: {(errorMessage: String) -> Void in
          failureCallback?(errorMessage)
        }
      )
    }

}

