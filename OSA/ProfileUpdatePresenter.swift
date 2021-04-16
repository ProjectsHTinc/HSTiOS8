//
//  ProfileUpdatePresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 18/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

protocol ProfileUpdatePresentationLogic
{
  func presentFetchResults(resp: ProfileUpdateModel.Fetch.Response)
}

class ProfileUpdatePresenter: ProfileUpdatePresentationLogic
{
  weak var viewController: ProfileUpdateDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: ProfileUpdateModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = ProfileUpdateModel.Fetch.ViewModel(msg: resp.testObj?.msg, status: resp.testObj?.status, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController?.successFetchedItems(viewModel: viewModel)
        }
    }
}
