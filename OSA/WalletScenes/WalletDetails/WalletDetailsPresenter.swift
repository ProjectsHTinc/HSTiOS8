//
//  WalletDetailsPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/03/21.
//

protocol WalletDetailsPresentationLogic
{
  func presentFetchResults(resp: WalletDetailsModel.Fetch.Response)
}

class WalletDetailsPresenter: WalletDetailsPresentationLogic
{
  weak var viewController: WalletDetailsDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:WalletDetailsModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedWalletDetailsData: [WalletDetailsModel.Fetch.ViewModel.DisplayedWalletDetailsData] = []
       
        for data in resp.testObj {
            let displayedWalletDetailsDatas = WalletDetailsModel.Fetch.ViewModel.DisplayedWalletDetailsData(created_at: data.created_at!,id: data.id!, transaction_amt: data.transaction_amt!, status: data.status!, created_by: data.created_by!, customer_id: data.customer_id!, notes: data.notes!, order_id: data.order_id!)
            displayedWalletDetailsData.append(displayedWalletDetailsDatas)
        }
        let viewModel = WalletDetailsModel.Fetch.ViewModel(displayedWalletDetailsData: displayedWalletDetailsData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
