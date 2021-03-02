//
//  EmailPasswordViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 15/02/21.
//

import UIKit

protocol ForgotPasswordDisplayLogic: class
{
    func successFetchedItems(viewModel: ForgotPasswordModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ForgotPasswordModel.Fetch.ViewModel)
}

class ForgotPasswordViewController: UIViewController, ForgotPasswordDisplayLogic {
    
    @IBOutlet weak var emailIdtextField: UITextField!
    
    var interactor: ForgotPasswordBusinessLogic?
    var router: (NSObjectProtocol & ForgotPasswordRoutingLogic & ForgotPasswordDataPassing)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        view.bindToKeyboard()
        // Do any additional setup after loading the view.
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
        let interactor = ForgotPasswordInteractor()
        let presenter = ForgotPasswordPresenter()
        let router = ForgotPasswordRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    @IBAction func sendAction(_ sender: Any) {
        if emailIdtextField.text!.isEmpty == true
        {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "EmailId is Empty", complition: {
             })
        }
        else
        {
            interactor?.fetchItems(request: ForgotPasswordModel.Fetch.Request(email :self.emailIdtextField.text))
        }
    }
    
    func successFetchedItems(viewModel: ForgotPasswordModel.Fetch.ViewModel) {
        
    }
    
    func errorFetchingItems(viewModel: ForgotPasswordModel.Fetch.ViewModel) {
        
    }
    
}
