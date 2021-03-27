//
//  CheckPasswordPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 26/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

protocol ChangePasswordPresentationLogic
{
  func presentFetchResults(resp: ChangePasswordModel.Fetch.Response)
}

class ChangePasswordPresenter: ChangePasswordPresentationLogic
{
  weak var viewController1: ChangePasswordDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: ChangePasswordModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = ChangePasswordModel.Fetch.ViewModel(msg: resp.testObj?.msg, status: resp.testObj?.status, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController1?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController1?.successFetchedItems(viewModel: viewModel)
        }
    }
}
