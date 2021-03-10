//
//  OrderDetailsPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 09/03/21.
//

import Foundation


protocol OrderDetailsPresentationLogic
{
  func presentFetchResults(resp: OrderDetailsModel.Fetch.Response)
}

class OrderDetailsPresenter: OrderDetailsPresentationLogic
{
  weak var viewController3: OrderDetailsDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:OrderDetailsModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedOrderDetailsData: [OrderDetailsModel.Fetch.ViewModel.DisplayedOrderDetailsData] = []
       
        for data in resp.testObj {
            let displayedOrderDetailsDatas = OrderDetailsModel.Fetch.ViewModel.DisplayedOrderDetailsData(promo_amount: data.promo_amount!,paid_amount: data.paid_amount!,total_amount: data.total_amount!,wallet_amount: data.wallet_amount!)
            displayedOrderDetailsData.append(displayedOrderDetailsDatas)
        }
        let viewModel = OrderDetailsModel.Fetch.ViewModel(displayedOrderDetailsData: displayedOrderDetailsData)
        viewController3?.successFetchedItems(viewModel: viewModel)
    }
}
