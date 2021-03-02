//
//  AdvertisementPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 23/02/21.
//

import Foundation
import UIKit

protocol AdvertisementPresentationLogic
{
  func presentFetchResults(resp: AdvertisementModel.Fetch.Response)
}

class AdvertisementPresenter: AdvertisementPresentationLogic
{
  weak var viewController4: AdvertisementDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: AdvertisementModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedAdvertisementData: [AdvertisementModel.Fetch.ViewModel.DisplayedAdvertisementData] = []
       
        for data in resp.testObj {
        let displayedAdvertisementDatas = AdvertisementModel.Fetch.ViewModel.DisplayedAdvertisementData(id: data.id!,ad_title: data.ad_title!,sub_cat_id: data.sub_cat_id!,ad_img: data.ad_img!)
            
            displayedAdvertisementData.append(displayedAdvertisementDatas)
        }
        let viewModel = AdvertisementModel.Fetch.ViewModel(displayedAdvertisementData: displayedAdvertisementData)
        viewController4?.successFetchedItems(viewModel: viewModel)
    }
}

