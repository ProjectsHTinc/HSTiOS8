//
//  SignupViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/02/21.
//

import UIKit

protocol SignupDisplayLogic: class
{
    func successFetchedItems(viewModel: SignupModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: SignupModel.Fetch.ViewModel)
}

class SignupViewController: UIViewController, SignupDisplayLogic {
        
      var interactor: SignupBusinessLogic?
      var router: (NSObjectProtocol & SignupRoutingLogic & SignupDataPassing)?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var mobileNumTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        let interactor = SignupInteractor()
        let presenter = SignupPresenter()
        let router = SignupRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    func successFetchedItems(viewModel: SignupModel.Fetch.ViewModel) {
        
        if viewModel.status == "success"{
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func errorFetchingItems(viewModel: SignupModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"User Already Register", complition: {
        })
    }
    
    @IBAction func continueAction(_ sender: Any) {
        
        interactor?.fetchItems(request: SignupModel.Fetch.Request(name :self.nameTextField.text,phone:self.mobileNumTextField.text, email:self.emailIdTextField.text ,password:self.passwordTextField.text))
    }
    
    @IBAction func googleAction(_ sender: Any) {
        
    }
    
    @IBAction func facebookAction(_ sender: Any) {
                
    }
    
}
