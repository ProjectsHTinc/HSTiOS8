//
//  RelatedProductsPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 03/03/21.
//

import Foundation

protocol RelatedProductPresentationLogic
{
  func presentFetchResults(resp: RelatedProductModel.Fetch.Response)
}

class RelatedProductPresenter: RelatedProductPresentationLogic
{
  weak var viewController3: RelatedProductDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:RelatedProductModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedRelatedProductData: [RelatedProductModel.Fetch.ViewModel.DisplayedRelatedProductData] = []
       
        for data in resp.testObj {
            let displayedRelatedProductDatas = RelatedProductModel.Fetch.ViewModel.DisplayedRelatedProductData(product_name: data.product_name!,product_cover_img: data.product_cover_img!,product_description: data.product_description!,offer_percentage: data.offer_percentage!, prod_mrp_price: data.prod_mrp_price!, offer_status: data.offer_status!, stocks_left: data.stocks_left!, prod_actual_price: data.prod_actual_price!)
            displayedRelatedProductData.append(displayedRelatedProductDatas)
        }
        let viewModel = RelatedProductModel.Fetch.ViewModel(displayedRelatedProductData: displayedRelatedProductData)
        viewController3?.successFetchedItems(viewModel: viewModel)
    }
}
