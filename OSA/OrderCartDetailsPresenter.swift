//
//  OrderCartDetailsPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 24/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

protocol OrderCartDetailsPresentationLogic
{
  func presentFetchResults(resp: OrderCartDetailsModel.Fetch.Response)
}

class OrderCartDetailsPresenter: OrderCartDetailsPresentationLogic
{
  weak var viewController: OrderCartDetailsDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:OrderCartDetailsModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedOrderCartDetailsData: [OrderCartDetailsModel.Fetch.ViewModel.DisplayedOrderCartDetailsData] = []
       
        for data in resp.testObj {
            let displayedOrderCartDetailsDatas = OrderCartDetailsModel.Fetch.ViewModel.DisplayedOrderCartDetailsData(quantity: data.quantity!,price: data.price!, product_cover_img: data.product_cover_img!, product_id: data.product_id!, id: data.id!, product_name: data.product_name!)
            displayedOrderCartDetailsData.append(displayedOrderCartDetailsDatas)
        }
        let viewModel = OrderCartDetailsModel.Fetch.ViewModel(displayedOrderCartDetailsData: displayedOrderCartDetailsData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
