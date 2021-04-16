//
//  ColourListPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 01/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//


import Foundation

protocol ColourListPresentationLogic
{
  func presentFetchResults(resp: ColourListModel.Fetch.Response)
}

class ColourListPresenter: ColourListPresentationLogic
{
  weak var viewController3: ColourListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:ColourListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedColourListData: [ColourListModel.Fetch.ViewModel.DisplayedColourListData] = []
       
        for data in resp.testObj {
            let displayedColourListDatas = ColourListModel.Fetch.ViewModel.DisplayedColourListData(sub_cat_id: data.sub_cat_id!,cat_id: data.cat_id!,mas_color_id: data.mas_color_id!,attribute_value: data.attribute_value!,attribute_name: data.attribute_name!)
            displayedColourListData.append(displayedColourListDatas)
        }
        let viewModel = ColourListModel.Fetch.ViewModel(displayedColourListData: displayedColourListData)
        viewController3?.successFetchedItems(viewModel: viewModel)
    }
}
