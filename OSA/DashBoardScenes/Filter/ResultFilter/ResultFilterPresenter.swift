//
//  ResultFilterPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 01/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

protocol ResultFilterPresentationLogic
{
  func presentFetchResults(resp: ResultFilterModel.Fetch.Response)
}

class ResultFilterPresenter: ResultFilterPresentationLogic
{
  weak var viewController4: ResultFilterDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:ResultFilterModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedResultFilterData: [ResultFilterModel.Fetch.ViewModel.DisplayedResultFilterData] = []
       
        for data in resp.testObj {
            let displayedResultFilterDatas = ResultFilterModel.Fetch.ViewModel.DisplayedResultFilterData(id: data.id!,parent_id: data.parent_id!,category_name: data.category_name!,category_image: data.category_image!,category_thumbnail: data.category_thumbnail!,category_desc: data.category_desc!,category_meta_title: data.category_meta_title!,category_keywords: data.category_keywords!,status: data.status!,created_at: data.created_at!,created_by: data.created_by!,updated_at: data.updated_at!,updated_by: data.updated_by!)
            displayedResultFilterData.append(displayedResultFilterDatas)
        }
        let viewModel = ResultFilterModel.Fetch.ViewModel(displayedResultFilterData: displayedResultFilterData)
        viewController4?.successFetchedItems(viewModel: viewModel)
    }
}
