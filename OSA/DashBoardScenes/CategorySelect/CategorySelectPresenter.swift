//
//  CategorySelectPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 25/02/21.
//



import Foundation
import UIKit

protocol CategorySelectPresentationLogic
{
  func presentFetchResults(resp: CategorySelectModel.Fetch.Response)
}

class CategorySelectPresenter: CategorySelectPresentationLogic
{
  weak var viewController: CategorySelectDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: CategorySelectModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedCategorySelectData: [CategorySelectModel.Fetch.ViewModel.DisplayedCategorySelectData] = []
       
        for data in resp.testObj {
        let displayedCategorySelectDatas = CategorySelectModel.Fetch.ViewModel.DisplayedCategorySelectData(id: data.id!,category_name: data.category_name!,parent_id: data.parent_id!,category_image: data.category_image!,category_desc: data.category_desc!)
            
            displayedCategorySelectData.append(displayedCategorySelectDatas)
        }
        let viewModel = CategorySelectModel.Fetch.ViewModel(displayedCategorySelectData: displayedCategorySelectData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}

