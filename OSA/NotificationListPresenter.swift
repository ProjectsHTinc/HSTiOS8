//
//  NotificationListPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 07/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//


protocol NotificationListPresentationLogic
{
  func presentFetchResults(resp: NotificationListModel.Fetch.Response)
}

class NotificationListPresenter: NotificationListPresentationLogic
{
  weak var viewController: NotificationListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:NotificationListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedNotificationListData: [NotificationListModel.Fetch.ViewModel.DisplayedNotificationListData] = []
       
        for data in resp.testObj {
            let displayedNotificationListDatas = NotificationListModel.Fetch.ViewModel.DisplayedNotificationListData(offer_percentage: data.offer_percentage!,id: data.id!, prod_actual_price: data.prod_actual_price!, prod_mrp_price: data.prod_mrp_price!, product_cover_img: data.product_cover_img!, product_name: data.product_name!, review_average: data.review_average!, wishlisted: data.wishlisted!,product_meta_desc: data.product_meta_desc!, product_description: data.product_description!)
            displayedNotificationListData.append(displayedNotificationListDatas)
        }
        let viewModel = NotificationListModel.Fetch.ViewModel(displayedNotificationListData: displayedNotificationListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
//var offer_percentage : String?
//var id : String?
//var prod_actual_price : String?
//var prod_mrp_price : String?
//var product_cover_img : String?
//var product_name : String?
//var review_average : String?
//var wishlisted : String?
//var product_meta_desc : String?
//var product_description : String?
