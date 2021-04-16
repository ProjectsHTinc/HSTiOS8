//
//  WebViewPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 13/03/21.
////
//
//import Foundation
//
//protocol CCWebViewPresentationLogic
//{
//  func presentFetchResults(resp: CCWebViewModel.Fetch.Response)
//}
//
//class CCWebViewPresenter: CCWebViewPresentationLogic
//{
//  weak var viewController: CCWebViewDisplayLogic?
//
//    // MARK: - Presentation logic
//    func presentFetchResults(resp: CCWebViewModel.Fetch.Response) {
//        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
//        let viewModel = CCWebViewModel.Fetch.ViewModel(msg: resp.testObj?.msg, status: resp.testObj?.status, isError: resp.isError, message: resp.message)
//
//        if viewModel.isError{
//            viewController?.errorFetchingItems(viewModel: viewModel)
//        }else{
//            viewController?.successFetchedItems(viewModel: viewModel)
//        }
//    }
//}
