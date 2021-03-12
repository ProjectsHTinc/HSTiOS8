//
//  AddMoneyWalletViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/03/21.
//

import UIKit

protocol AddMoneyToWalletDisplayLogic: class
{
    func successFetchedItems(viewModel: AddMoneyToWalletModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: AddMoneyToWalletModel.Fetch.ViewModel)
}

class AddMoneyWalletViewController: UIViewController, AddMoneyToWalletDisplayLogic {
   
    @IBOutlet weak var walletAmountTextField: UITextField!
    
    var interactor: AddMoneyToWalletBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
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
        let interactor = AddMoneyToWalletInteractor()
        let presenter = AddMoneyToWalletPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    @IBAction func addMoneyAction(_ sender: Any) {

        if self.walletAmountTextField.text!.count == 0 {
            
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "Field is Empty", complition: {
              })
        }
        
        interactor?.fetchItems(request: AddMoneyToWalletModel.Fetch.Request(amount:self.walletAmountTextField.text!, user_id:GlobalVariables.shared.customer_id))
    }

    func successFetchedItems(viewModel: AddMoneyToWalletModel.Fetch.ViewModel) {
        
        GlobalVariables.shared.order_id = viewModel.order_id!
    }
    
    func errorFetchingItems(viewModel: AddMoneyToWalletModel.Fetch.ViewModel) {
        
    }
}
