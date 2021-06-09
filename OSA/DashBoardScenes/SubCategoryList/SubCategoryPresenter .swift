//
//  SubCategoryPresenter .swift
//  OSA
//
//  Created by Happy Sanz Tech on 26/02/21.
//


import Foundation
import UIKit

protocol SubCategoryListPresentationLogic
{
  func presentFetchResults(resp: SubCategoryListModel.Fetch.Response)
}

class SubCategoryListPresenter: SubCategoryListPresentationLogic
{
  weak var viewController2: SubCategoryListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: SubCategoryListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedSubCategoryListData: [SubCategoryListModel.Fetch.ViewModel.DisplayedSubCategoryListData] = []
       
        for data in resp.testObj {
            let displayedSubCategoryListDatas = SubCategoryListModel.Fetch.ViewModel.DisplayedSubCategoryListData(id: data.id!,prod_mrp_price: data.prod_mrp_price!, stocks_left: data.stocks_left!, product_cover_img: data.product_cover_img!, product_meta_desc: data.product_meta_desc!, wishlisted: data.wishlisted!, product_name: data.product_name!,delivery_fee_status: data.delivery_fee_status!,product_description: data.product_description!,product_meta_keywords: data.product_meta_keywords!,review_average: data.review_average!)
            
            displayedSubCategoryListData.append(displayedSubCategoryListDatas)
        }
        let viewModel = SubCategoryListModel.Fetch.ViewModel(displayedSubCategoryListData: displayedSubCategoryListData)
        viewController2?.successFetchedItems(viewModel: viewModel)
    }
}


