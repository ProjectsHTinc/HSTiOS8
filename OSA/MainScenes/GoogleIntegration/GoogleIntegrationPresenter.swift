//
//  GoogleIntegrationPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 07/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit


import Foundation

protocol GoogleIntegrationPresentationLogic
{
  func presentFetchResults(resp: GoogleIntegrationModel.Fetch.Response)
}

class GoogleIntegrationPresenter: GoogleIntegrationPresentationLogic
{
  weak var viewController1: GoogleIntegrationDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: GoogleIntegrationModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = GoogleIntegrationModel.Fetch.ViewModel( status: resp.testObj?.status,address_id: resp.testObj?.address_id, birth_date: resp.testObj?.birth_date,customer_id: resp.testObj?.customer_id,first_name: resp.testObj?.first_name,last_login: resp.testObj?.last_login,last_name: resp.testObj?.last_name,newsletter_status: resp.testObj?.newsletter_status,phone_number: resp.testObj?.phone_number,profile_picture: resp.testObj?.profile_picture, email: resp.testObj?.email, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController1?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController1?.successFetchedItems(viewModel: viewModel)
        }
    }
}
