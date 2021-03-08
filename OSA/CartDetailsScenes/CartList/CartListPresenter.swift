//
//  CartListPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 04/03/21.
//

import Foundation

protocol CartListPresentationLogic
{
  func presentFetchResults(resp: CartListModel.Fetch.Response)
}

class CartListPresenter: CartListPresentationLogic
{
  weak var viewController: CartListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:CartListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedCartListData: [CartListModel.Fetch.ViewModel.DisplayedCartListData] = []
       
        for data in resp.testObj {
            let displayedCartListDatas = CartListModel.Fetch.ViewModel.DisplayedCartListData(category_name: data.category_name!,status: data.status!,color_name: data.color_name!,total_amount: data.total_amount!,product_cover_img: data.product_cover_img!,price: data.price!,color_code: data.color_code!,size: data.size!,stocks_left: data.stocks_left!,product_description: data.product_description!,product_id: data.product_id!,product_name: data.product_name!,id: data.id!,quantity: data.quantity!)
            displayedCartListData.append(displayedCartListDatas)
        }
        let viewModel = CartListModel.Fetch.ViewModel(displayedCartListData: displayedCartListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}

var quantity : String?
