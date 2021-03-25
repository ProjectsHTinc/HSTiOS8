//
//  ReturnReasonListPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 24/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

protocol ReturnReasonListPresentationLogic
{
  func presentFetchResults(resp: ReturnReasonListModel.Fetch.Response)
}

class ReturnReasonListPresenter: ReturnReasonListPresentationLogic
{
  weak var viewController: ReturnReasonListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:ReturnReasonListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedReturnReasonListData: [ReturnReasonListModel.Fetch.ViewModel.DisplayedReturnReasonListData] = []
       
        for data in resp.testObj {
            let displayedReturnReasonListDatas = ReturnReasonListModel.Fetch.ViewModel.DisplayedReturnReasonListData(id: data.id!,question: data.question!, user_type: data.user_type!, status: data.status!, created_at: data.created_at!, updated_at: data.updated_at!)
            displayedReturnReasonListData.append(displayedReturnReasonListDatas)
        }
        let viewModel = ReturnReasonListModel.Fetch.ViewModel(displayedReturnReasonListData: displayedReturnReasonListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
