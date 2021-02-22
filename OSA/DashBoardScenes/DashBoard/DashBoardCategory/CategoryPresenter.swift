//
//  CategoryPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 22/02/21.
//

import Foundation
import UIKit

protocol CategoryPresentationLogic
{
  func presentFetchResults(resp: CategoryModel.Fetch.Response)
}

class CategoryPresenter: CategoryPresentationLogic
{
  weak var viewController1: CategoryDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: CategoryModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedCategoryData: [CategoryModel.Fetch.ViewModel.DisplayedCategoryData] = []
       
        for data in resp.testObj {
        let displayedCategoryDatas = CategoryModel.Fetch.ViewModel.DisplayedCategoryData(id: data.id!,parent_id: data.parent_id!,category_image: data.category_image!,category_desc: data.category_desc!,category_name: data.category_name!)
            displayedCategoryData.append(displayedCategoryDatas)
        }
        let viewModel = CategoryModel.Fetch.ViewModel(displayedCategoryData: displayedCategoryData)
        viewController1?.successFetchedItems(viewModel: viewModel)
    }
}

