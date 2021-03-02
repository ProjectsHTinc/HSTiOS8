//
//  BestSellingPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 23/02/21.
//

import Foundation
import UIKit

protocol BestSellingPresentationLogic
{
  func presentFetchResults(resp: BestSellingModel.Fetch.Response)
}

class BestSellingPresenter: BestSellingPresentationLogic
{
  weak var viewController2: BestSellingDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: BestSellingModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedBestSellingData: [BestSellingModel.Fetch.ViewModel.DisplayedBestSellingData] = []
       
        for data in resp.testObj {
        let displayedBestSellingDatas = BestSellingModel.Fetch.ViewModel.DisplayedBestSellingData(id: data.id!,product_name: data.product_name!,sku_code: data.sku_code!,product_cover_img: data.product_cover_img!,prod_size_chart: data.prod_size_chart!,product_description: data.product_description!,offer_status: data.offer_status!,specification_status: data.specification_status!,combined_status: data.combined_status!,prod_actual_price: data.prod_actual_price!,prod_mrp_price: data.prod_mrp_price!,offer_percentage: data.offer_percentage!,delivery_fee_status: data.delivery_fee_status!,prod_return_policy: data.prod_return_policy!,prod_cod: data.prod_cod!,product_meta_title: data.product_meta_title!,product_meta_desc: data.product_meta_desc!,product_meta_keywords: data.product_meta_keywords!,stocks_left: data.stocks_left!,review_average: data.review_average!,wishlisted: data.wishlisted!)
            
            displayedBestSellingData.append(displayedBestSellingDatas)
        }
        let viewModel = BestSellingModel.Fetch.ViewModel(displayedBestSellingData: displayedBestSellingData)
        viewController2?.successFetchedItems(viewModel: viewModel)
    }
}

