//
//  PlaceOrderPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 08/03/21.
//

import Foundation

protocol PlaceOrderPresentationLogic
{
  func presentFetchResults(resp: PlaceOrderModel.Fetch.Response)
}

class PlaceOrderPresenter: PlaceOrderPresentationLogic
{
  weak var viewController2: PlaceOrderDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: PlaceOrderModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = PlaceOrderModel.Fetch.ViewModel(msg: resp.testObj?.msg, status: resp.testObj?.status,order_id: resp.testObj?.order_id, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController2?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController2?.successFetchedItems(viewModel: viewModel)
        }
    }
}
