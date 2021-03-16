//
//  APIFuctionName.swift
//  OSA
//
//  Created by Happy Sanz Tech on 16/02/21.
//

import Foundation
import UIKit

struct APIFunctionName {
    
    static let loginMobileUrl = "mobileapi/login_mobile"
    static let loginEmailUrl = "mobileapi/login"
    static let mobileOtpUrl = "mobileapi/login_mobileotp"
    static let forgotEmailPasswordUrl = "mobileapi/forgot_password"
    static let signUpUrl = "mobileapi/registration"
    
    static let dashBoardUrl = "mobileapi/home_page"
    static let categoryListURL = "mobileapi/sub_cat_list"
    static let subCatListDetailsURL = "mobileapi/product_list"
    static let productDetailsURL = "mobileapi/product_details"
    static let productColourUrl = "mobileapi/get_product_color"
    static let ProductSizeUrl = "mobileapi/get_product_size"
    static let ProductReviewListUrl = "mobileapi/product_reviews"
    static let addToCartUrl = "mobileapi/product_cart"
    static let cartListUrl = "mobileapi/view_cart_items"
    static let DeleteCartUrl = "mobileapi/product_cart_remove"
    static let checkPinCodeUrl = "mobileapi/check_pincode"
    static let quantityUpdateUrl = "mobileapi/cart_quantity"
    
    static let addressListUrl = "mobileapi/address_list"
    static let promoCodeApplyUrl = "mobileapi/apply_promo_code"
    static let placeOrderUrl = "mobileapi/place_order"
    static let orderDetailsUrl = "mobileapi/order_details"
    static let addAddressUrl = "mobileapi/address_create"
    static let deleteAddressUrl = "mobileapi/address_delete"
    static let updateAddressUrl = "mobileapi/address_update"
    static let setDefaultAddressUrl = "mobileapi/address_set_default"
    
    static let walletDetailsUrl = "mobileapi/customer_wallet_history"
    static let addMoneyToWalletUrl = "mobileapi/add_money_wallet"
    static let removePromoCodeUrl = "mobileapi/remove_promo_code"
    static let ccWebViewUrl = "ccavenue_app/adding_money_to_wallet.php"
    
    
}

