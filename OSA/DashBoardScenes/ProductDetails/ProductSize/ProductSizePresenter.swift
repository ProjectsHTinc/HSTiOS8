//
//  ProductSizePresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 02/03/21.
//

import Foundation

protocol ProductSizePresentationLogic
{
  func presentFetchResults(resp: ProductSizeModel.Fetch.Response)
}

class ProductSizePresenter: ProductSizePresentationLogic
{
  weak var viewController1: ProductSizeDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: ProductSizeModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedProductSizeData: [ProductSizeModel.Fetch.ViewModel.DisplayedProductSizeData] = []
       
        for data in resp.testObj {
        let displayedProductSizeDatas = ProductSizeModel.Fetch.ViewModel.DisplayedProductSizeData(id: data.id!,product_id: data.product_id!,mas_size_id: data.mas_size_id!,size: data.size!,prod_actual_price: data.prod_actual_price!,prod_mrp_price: data.prod_mrp_price!,prod_default: data.prod_default!,stocks_left: data.stocks_left!)
            displayedProductSizeData.append(displayedProductSizeDatas)
        }
        let viewModel = ProductSizeModel.Fetch.ViewModel(displayedProductSizeData: displayedProductSizeData)
        viewController1?.successFetchedItems(viewModel: viewModel)
    }
}
