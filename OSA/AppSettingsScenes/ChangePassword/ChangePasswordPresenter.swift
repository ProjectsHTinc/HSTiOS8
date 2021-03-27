//
//  ChangePasswordPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 26/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

protocol CheckPasswordPresentationLogic
{
  func presentFetchResults(resp: CheckPasswordModel.Fetch.Response)
}

class CheckPasswordPresenter: CheckPasswordPresentationLogic
{
  weak var viewController: CheckPasswordDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: CheckPasswordModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = CheckPasswordModel.Fetch.ViewModel(msg: resp.testObj?.msg, status: resp.testObj?.status, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController?.successFetchedItems(viewModel: viewModel)
        }
    }
}
