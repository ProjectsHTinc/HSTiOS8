//
//  DashBoardPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 17/02/21.
//

import Foundation
import UIKit

//
//import Foundation
//
//protocol DashBoardPresentationLogic
//{
//  func presentFetchResults(resp: DashBoardModel.Fetch.Response)
//}
//
//class DashBoardPresenter: DashBoardPresentationLogic
//{
//  weak var viewController: DashBoardDisplayLogic?
//
//    // MARK: - Presentation logic
//    func presentFetchResults(resp: DashBoardModel.Fetch.Response) {
//        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
//        let viewModel = DashBoardModel.Fetch.ViewModel( status: resp.testObj?.status, isError: resp.isError, message: resp.message)
//
//        if viewModel.isError{
//            viewController?.errorFetchingItems(viewModel: viewModel)
//        }else{
//            viewController?.successFetchedItems(viewModel: viewModel)
//        }
//    }
//}


protocol DashBoardPresentationLogic
{
  func presentFetchResults(resp: DashBoardModel.Fetch.Response)
}

class DashBoardPresenter: DashBoardPresentationLogic
{
  weak var viewController: DashBoardDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: DashBoardModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedDashBoardData: [DashBoardModel.Fetch.ViewModel.DisplayedDashBoardData] = []
       
        for data in resp.testObj {
        let displayedDasboardDatas = DashBoardModel.Fetch.ViewModel.DisplayedDashBoardData(id: data.id!,banner_title: data.banner_title!,banner_desc: data.banner_desc!,banner_image: data.banner_image!,product_id: data.product_id!)
            displayedDashBoardData.append(displayedDasboardDatas)
        }
        let viewModel = DashBoardModel.Fetch.ViewModel(displayedDashBoardData: displayedDashBoardData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}

