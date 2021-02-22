//
//  SignUpPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/02/21.
//

import Foundation
import UIKit


import Foundation

protocol SignupPresentationLogic
{
  func presentFetchResults(resp: SignupModel.Fetch.Response)
}

class SignupPresenter: SignupPresentationLogic
{
  weak var viewController: SignupDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: SignupModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = SignupModel.Fetch.ViewModel( status: resp.testObj?.status, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController?.successFetchedItems(viewModel: viewModel)
        }
    }
}
