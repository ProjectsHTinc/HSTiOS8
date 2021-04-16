//
//  ProductDetailsPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 27/02/21.
//

import Foundation
import UIKit

protocol ProductDetailsPresentationLogic
{
  func presentFetchResults(resp: ProductDetailsModel.Fetch.Response)
}

class ProductDetailsPresenter: ProductDetailsPresentationLogic
{
    weak var viewController: ProductDetailsDisplayLogic?
      
      // MARK: - Presentation logic
      func presentFetchResults(resp: ProductDetailsModel.Fetch.Response) {
          // NOTE: Format the response from the Interactor and pass the result back to the View Controller
          let viewModel = ProductDetailsModel.Fetch.ViewModel(id: resp.testObj?.id, product_name: resp.testObj?.product_name,sku_code: resp.testObj?.sku_code, product_cover_img: resp.testObj?.product_cover_img,prod_size_chart: resp.testObj?.prod_size_chart, product_description: resp.testObj?.product_description,prod_actual_price: resp.testObj?.prod_actual_price, prod_mrp_price: resp.testObj?.prod_mrp_price, offer_percentage: resp.testObj?.offer_percentage, product_meta_title: resp.testObj?.product_meta_title,product_meta_desc: resp.testObj?.product_meta_desc, stocks_left: resp.testObj?.stocks_left,isError: resp.isError, message: resp.message)
          
          if viewModel.isError{
              viewController?.errorFetchingItems(viewModel: viewModel)
          }else{
              viewController?.successFetchedItems(viewModel: viewModel)
          }
      }
}
