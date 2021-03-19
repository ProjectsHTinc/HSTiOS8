//
//  ReviewOrderPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 15/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//import Foundation


protocol ReviewOrderPresentationLogic
{
  func presentFetchResults(resp: ReviewOrderModel.Fetch.Response)
}

class ReviewOrderPresenter: ReviewOrderPresentationLogic
{
  weak var viewController: ReviewOrderDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:ReviewOrderModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedReviewOrderData: [ReviewOrderModel.Fetch.ViewModel.DisplayedReviewOrderData] = []
       
        for data in resp.testObj {
            let displayedReviewOrderDatas = ReviewOrderModel.Fetch.ViewModel.DisplayedReviewOrderData(product_cover_img: data.product_cover_img!,category_name: data.category_name!,total_amount: data.total_amount!,product_id: data.product_id!,product_description: data.product_description!,quantity: data.quantity!)
            displayedReviewOrderData.append(displayedReviewOrderDatas)
        }
        let viewModel = ReviewOrderModel.Fetch.ViewModel(displayedReviewOrderData: displayedReviewOrderData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
