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
        self.addToWalletByPaymemtGateway(amount: self.walletAmountTextField.text!)
    }
    
    func errorFetchingItems(viewModel: AddMoneyToWalletModel.Fetch.ViewModel) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       if (segue.identifier == "to_webView")
       {
        _ = segue.destination as! CCWebViewViewController
       
       }
    }
    
    func addToWalletByPaymemtGateway (amount:String)
    {
        
        let concordinateString = "\(GlobalVariables.shared.order_id)" + "-" + GlobalVariables.shared.customer_id
        print(concordinateString)
        UserDefaults.standard.set("MW", forKey: "Advance/customer")
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "CCWebViewController") as! CCWebViewViewController
        viewController.accessCode = "AVAU84GD83BV10UAVB"
        viewController.merchantId = "216134"
        viewController.amount = amount
        // advance_amount
        viewController.strAddMoneyToWallet = concordinateString
        viewController.currency = "INR"
        viewController.orderId = concordinateString
        viewController.redirectUrl = APIURL.BaseUrl_Dev + APIFunctionName.ccWebViewUrl
        viewController.cancelUrl = APIURL.BaseUrl_Dev + "ccavenue_app/adding_money_to_wallet.php"
        viewController.rsaKeyUrl = APIURL.BaseUrl_Dev + "ccavenue_app/GetRSA.php"
                
        self.present(viewController, animated: true, completion: nil)

    }
}



