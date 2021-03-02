//
//  NewArrivalsPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 23/02/21.
//

import Foundation
import UIKit

protocol NewArrivalsPresentationLogic
{
  func presentFetchResults(resp: NewArrivalsModel.Fetch.Response)
}

class NewArrivalsPresenter: NewArrivalsPresentationLogic
{
  weak var viewController3: NewArrivalsDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: NewArrivalsModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedNewArrivalsData: [NewArrivalsModel.Fetch.ViewModel.DisplayedNewArrivalsData] = []
       
        for data in resp.testObj {
        let displayedNewArrivalsDatas = NewArrivalsModel.Fetch.ViewModel.DisplayedNewArrivalsData(id: data.id!,product_name: data.product_name!,sku_code: data.sku_code!,product_cover_img: data.product_cover_img!,prod_size_chart: data.prod_size_chart!,product_description: data.product_description!,offer_status: data.offer_status!,specification_status: data.specification_status!,combined_status: data.combined_status!,prod_actual_price: data.prod_actual_price!,prod_mrp_price: data.prod_mrp_price!,offer_percentage: data.offer_percentage!,delivery_fee_status: data.delivery_fee_status!,prod_return_policy: data.prod_return_policy!,prod_cod: data.prod_cod!,product_meta_title: data.product_meta_title!,product_meta_desc: data.product_meta_desc!,product_meta_keywords: data.product_meta_keywords!,stocks_left: data.stocks_left!,review_average: data.review_average!,wishlisted: data.wishlisted!)
            
            displayedNewArrivalsData.append(displayedNewArrivalsDatas)
        }
        let viewModel = NewArrivalsModel.Fetch.ViewModel(displayedNewArrivalsData: displayedNewArrivalsData)
        viewController3?.successFetchedItems(viewModel: viewModel)
    }
}

