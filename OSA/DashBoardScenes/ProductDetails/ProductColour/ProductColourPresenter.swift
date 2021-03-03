//
//  ProductColourPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 02/03/21.
//

import Foundation

protocol ProductColourPresentationLogic
{
  func presentFetchResults(resp: ProductColourModel.Fetch.Response)
}

class ProductColourPresenter: ProductColourPresentationLogic
{
  weak var viewController2: ProductColourDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:ProductColourModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedProductColourData: [ProductColourModel.Fetch.ViewModel.DisplayedProductColourData] = []
       
        for data in resp.testObj {
            let displayedProductColourDatas = ProductColourModel.Fetch.ViewModel.DisplayedProductColourData(id: data.id!,product_id: data.product_id!,mas_color_id: data.mas_color_id!,color_name: data.color_name!,color_code: data.color_code!, prod_mrp_price: data.prod_mrp_price!, prod_default: data.prod_default!, stocks_left: data.stocks_left!, prod_actual_price: data.prod_actual_price!)
            displayedProductColourData.append(displayedProductColourDatas)
        }
        let viewModel = ProductColourModel.Fetch.ViewModel(displayedProductColourData: displayedProductColourData)
        viewController2?.successFetchedItems(viewModel: viewModel)
    }
}
