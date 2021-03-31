//
//  RecentSearchPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 30/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation

protocol RecentSearchListPresentationLogic
{
  func presentFetchResults(resp: RecentSearchListModel.Fetch.Response)
}

class RecentSearchListPresenter: RecentSearchListPresentationLogic
{
  weak var viewController: RecentSearchListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:RecentSearchListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedRecentSearchListData: [RecentSearchListModel.Fetch.ViewModel.DisplayedRecentSearchListData] = []
       
        for data in resp.testObj {
            let displayedRecentSearchListDatas = RecentSearchListModel.Fetch.ViewModel.DisplayedRecentSearchListData(created_at: data.created_at!,search_text: data.search_text!,id: data.id!)
            displayedRecentSearchListData.append(displayedRecentSearchListDatas)
        }
        let viewModel = RecentSearchListModel.Fetch.ViewModel(displayedRecentSearchListData: displayedRecentSearchListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
