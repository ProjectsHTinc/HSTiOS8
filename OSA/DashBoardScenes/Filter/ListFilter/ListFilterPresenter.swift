//
//  ListFilterPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 01/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

protocol ListFilterPresentationLogic
{
  func presentFetchResults(resp: ListFilterModel.Fetch.Response)
}

class ListFilterPresenter: ListFilterPresentationLogic
{
  weak var viewController1: ListFilterDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:ListFilterModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedListFilterData: [ListFilterModel.Fetch.ViewModel.DisplayedListFilterData] = []
       
        for data in resp.testObj {
            let displayedListFilterDatas = ListFilterModel.Fetch.ViewModel.DisplayedListFilterData(id: data.id!,parent_id: data.parent_id!,category_name: data.category_name!,category_image: data.category_image!,category_thumbnail: data.category_thumbnail!,category_desc: data.category_desc!,category_meta_title: data.category_meta_title!,category_keywords: data.category_keywords!,status: data.status!,created_at: data.created_at!,created_by: data.created_by!,updated_at: data.updated_at!,updated_by: data.updated_by!)
            displayedListFilterData.append(displayedListFilterDatas)
        }
        let viewModel = ListFilterModel.Fetch.ViewModel(displayedListFilterData: displayedListFilterData)
        viewController1?.successFetchedItems(viewModel: viewModel)
    }
}
