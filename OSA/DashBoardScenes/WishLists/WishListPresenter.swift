//
//  WishListPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 19/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

protocol WishListPresentationLogic
{
  func presentFetchResults(resp: WishListModel.Fetch.Response)
}

class WishListPresenter: WishListPresentationLogic
{
  weak var viewController: WishListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: WishListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedWishListData: [WishListModel.Fetch.ViewModel.DisplayedWishListData] = []
       
        for data in resp.testObj {
        let displayedWishListDatas = WishListModel.Fetch.ViewModel.DisplayedWishListData(id: data.id!,product_name: data.product_name!,sku_code: data.sku_code!,product_cover_img: data.product_cover_img!,product_description: data.product_description!,offer_status: data.offer_status!,specification_status: data.specification_status!,combined_status: data.combined_status!,prod_actual_price: data.prod_actual_price!,prod_mrp_price: data.prod_mrp_price!,offer_percentage: data.offer_percentage!,delivery_fee_status: data.delivery_fee_status!,prod_return_policy: data.prod_return_policy!,prod_cod: data.prod_cod!,product_meta_title: data.product_meta_title!,product_meta_desc: data.product_meta_desc!,product_meta_keywords: data.product_meta_keywords!,stocks_left: data.stocks_left)
            
            displayedWishListData.append(displayedWishListDatas)
        }
        let viewModel = WishListModel.Fetch.ViewModel(displayedWishListData: displayedWishListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}

