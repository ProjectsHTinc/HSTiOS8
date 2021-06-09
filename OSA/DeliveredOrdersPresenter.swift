//
//  DeliveredOrdersPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 22/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

protocol DeliveredOrdersPresentationLogic
{
  func presentFetchResults(resp: DeliveredOrdersModel.Fetch.Response)
}

class DeliveredOrdersPresenter: DeliveredOrdersPresentationLogic
{
  weak var viewController1: DeliveredOrdersDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:DeliveredOrdersModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedDeliveredOrdersData: [DeliveredOrdersModel.Fetch.ViewModel.DisplayedDeliveredOrdersData] = []
       
        for data in resp.testObj {
            let displayedDeliveredOrdersDatas = DeliveredOrdersModel.Fetch.ViewModel.DisplayedDeliveredOrdersData(total_amount: data.total_amount!,cus_id: data.cus_id!, city: data.city!, alternative_mobile_number: data.alternative_mobile_number!, house_no: data.house_no!, cus_notes: data.cus_notes!, state: data.state!, status: data.status!, pincode: data.pincode!, full_name: data.full_name!, mobile_number: data.mobile_number!, email_address: data.email_address!,purchase_date: data.purchase_date!,id: data.id!, order_status: data.order_status!, landmark: data.landmark!, order_cover_img: data.order_cover_img!, order_id: data.order_id!)
            
            displayedDeliveredOrdersData.append(displayedDeliveredOrdersDatas)
        }
        let viewModel = DeliveredOrdersModel.Fetch.ViewModel(displayedDeliveredOrdersData: displayedDeliveredOrdersData)
        viewController1?.successFetchedItems(viewModel: viewModel)
    }
}
//, promo_amount: data.promo_amount!, purchase_order_status: data.purchase_order_status!, paid_amount: data.paid_amount!, payment_status: data.payment_status!, country_name: data.country_name!, wallet_amount: data.wallet_amount!

