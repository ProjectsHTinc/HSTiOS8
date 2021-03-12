//
//  AddMoneyToWalletPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/03/21.
//

import Foundation

protocol AddMoneyToWalletPresentationLogic
{
  func presentFetchResults(resp: AddMoneyToWalletModel.Fetch.Response)
}

class AddMoneyToWalletPresenter: AddMoneyToWalletPresentationLogic
{
  weak var viewController: AddMoneyToWalletDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: AddMoneyToWalletModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = AddMoneyToWalletModel.Fetch.ViewModel(msg: resp.testObj?.msg, status: resp.testObj?.status,order_id: resp.testObj?.order_id, amount: resp.testObj?.amount, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController?.successFetchedItems(viewModel: viewModel)
        }
    }
}
