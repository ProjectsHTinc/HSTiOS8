//
//  ProfileDetailsPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 18/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

protocol ProfileDetailsPresentationLogic
{
  func presentFetchResults(resp: ProfileDetailsModel.Fetch.Response)
}

class ProfileDetailsPresenter: ProfileDetailsPresentationLogic
{
  weak var viewController1: ProfileDetailsDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: ProfileDetailsModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = ProfileDetailsModel.Fetch.ViewModel(first_name: resp.testObj?.first_name, profile_picture: resp.testObj?.profile_picture,gender: resp.testObj?.gender, email: resp.testObj?.email,newsletter_status: resp.testObj?.newsletter_status, birth_date: resp.testObj?.birth_date,id: resp.testObj?.id, last_name: resp.testObj?.last_name, phone_number: resp.testObj?.phone_number, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController1?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController1?.successFetchedItems(viewModel: viewModel)
        }
    }
}
