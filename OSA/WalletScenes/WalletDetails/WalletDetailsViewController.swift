//
//  WalletDetailsViewController.swift
//  
//
//  Created by Happy Sanz Tech on 12/03/21.
//

import UIKit

protocol WalletDetailsDisplayLogic: class
{
    func successFetchedItems(viewModel: WalletDetailsModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: WalletDetailsModel.Fetch.ViewModel)
}

class WalletDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, WalletDetailsDisplayLogic {
   
    @IBOutlet weak var walletListTableView: UITableView!
    @IBOutlet weak var walletAmountLbl: UILabel!
    
    
    var interactor: WalletDetailsBusinessLogic?
    var displayedWalletDetailsData: [WalletDetailsModel.Fetch.ViewModel.DisplayedWalletDetailsData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.fetchItems(request: WalletDetailsModel.Fetch.Request(user_id:"3"))
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup()
    {
        let viewController = self
        let interactor = WalletDetailsInteractor()
        let presenter = WalletDetailsPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    func successFetchedItems(viewModel: WalletDetailsModel.Fetch.ViewModel) {
        
        displayedWalletDetailsData = viewModel.displayedWalletDetailsData
        self.walletAmountLbl.text = "₹\(GlobalVariables.shared.wallet_amount)"
        self.walletListTableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: WalletDetailsModel.Fetch.ViewModel) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedWalletDetailsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = walletListTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WalletListTableViewCell
        
        let data = displayedWalletDetailsData[indexPath.row]
        cell.titleTextLbl.text = data.status
        cell.descriptionLbl.text = data.notes
        cell.dateLbl.text = data.created_at
        cell.priceLbl.text = "₹ \(data.transaction_amt!)"
        
        return cell
    }
    
    
}
