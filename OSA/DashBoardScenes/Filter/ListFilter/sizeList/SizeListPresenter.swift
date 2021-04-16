//
//  SizeListPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 01/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

protocol SizeListPresentationLogic
{
  func presentFetchResults(resp: SizeListModel.Fetch.Response)
}

class SizeListPresenter: SizeListPresentationLogic
{
  weak var viewController2: SizeListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:SizeListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedSizeListData: [SizeListModel.Fetch.ViewModel.DisplayedSizeListData] = []
       
        for data in resp.testObj {
            let displayedSizeListDatas = SizeListModel.Fetch.ViewModel.DisplayedSizeListData(mas_size_id: data.mas_size_id!,size: data.size!,cat_id: data.cat_id!,sub_cat_id: data.sub_cat_id!)
            displayedSizeListData.append(displayedSizeListDatas)
        }
        let viewModel = SizeListModel.Fetch.ViewModel(displayedSizeListData: displayedSizeListData)
        viewController2?.successFetchedItems(viewModel: viewModel)
    }
}
