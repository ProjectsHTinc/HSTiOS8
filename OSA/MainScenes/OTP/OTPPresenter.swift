//
//  OTPPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/02/21.
//

import Foundation
import UIKit

protocol  OTPPresentationLogic
{
  func presentFetchResults(resp:  OTPModel.Fetch.Response)
}

class  OTPPresenter:  OTPPresentationLogic
{
  weak var viewController:  OTPDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:  OTPModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel =  OTPModel.Fetch.ViewModel(status: resp.testObj?.status,address_id: resp.testObj?.address_id, birth_date: resp.testObj?.birth_date,customer_id: resp.testObj?.customer_id,first_name: resp.testObj?.first_name,last_login: resp.testObj?.last_login,last_name: resp.testObj?.last_name,newsletter_status: resp.testObj?.newsletter_status,phone_number: resp.testObj?.phone_number,profile_picture: resp.testObj?.profile_picture, email: resp.testObj?.email, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController?.successFetchedItems(viewModel: viewModel)
        }
    }
}

