//
//  loginPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 05/02/21.
//

import Foundation

protocol LoginPresentationLogic
{
  func presentFetchResults(resp: LoginModel.Fetch.Response)
}

class LoginPresenter: LoginPresentationLogic
{
  weak var viewController: LoginDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: LoginModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = LoginModel.Fetch.ViewModel(OTP: resp.testObj?.OTP, status: resp.testObj?.status, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController?.successFetchedItems(viewModel: viewModel)
        }
    }
}
