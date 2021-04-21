//
//  ChangePasswordViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 26/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import UIKit

protocol CheckPasswordDisplayLogic: class
{
    func successFetchedItems(viewModel: CheckPasswordModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: CheckPasswordModel.Fetch.ViewModel)
}
protocol ChangePasswordDisplayLogic: class
{
    func successFetchedItems(viewModel: ChangePasswordModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ChangePasswordModel.Fetch.ViewModel)
}

class ChangePasswordViewController: UIViewController, CheckPasswordDisplayLogic,ChangePasswordDisplayLogic {
    
    var interactor: CheckPasswordBusinessLogic?
    var interactor1: ChangePasswordBusinessLogic?

    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var NewPasswordTextfield: UITextField!
    @IBOutlet weak var ConfirmPasswordTextfield: UITextField!
    
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
        let interactor = CheckPasswordInteractor()
        let presenter = CheckPasswordPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        let viewController1 = self
        let interactor1 = ChangePasswordInteractor()
        let presenter1 = ChangePasswordPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
    }
    
    @IBAction func resetPasswordAction(_ sender: Any) {

        if passwordTextfield.text!.count == 0 
        {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Password cannot be empty", complition: {
              })
        }
        else if NewPasswordTextfield.text!.count < 7
        {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Minimum 7 charaters required", complition: {
              })
        }
        else if ConfirmPasswordTextfield.text!.count < 7
        {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Minimum 7 charaters required", complition: {
              })
        }
        else
        {
        interactor?.fetchItems(request: CheckPasswordModel.Fetch.Request( user_id:GlobalVariables.shared.customer_id,password:self.passwordTextfield.text!))
        }
    }
    
//   CheckPasswordDisplayLogic
    func successFetchedItems(viewModel: CheckPasswordModel.Fetch.ViewModel) {
        
        if viewModel.msg == "Password Verified"
        {
        let newPassword = String(self.NewPasswordTextfield.text!)
        let confirmPassword = String(self.ConfirmPasswordTextfield.text!)
        
           if newPassword == confirmPassword {
            
            interactor1?.fetchItems(request: ChangePasswordModel.Fetch.Request( user_id:GlobalVariables.shared.customer_id,password:self.ConfirmPasswordTextfield.text!))
            }
            else
            {
                AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Password does not match", complition: {
               })
            }
         }
         else
        {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Password is wrong", complition: {
                
              })
        }
    }
      
    func errorFetchingItems(viewModel: CheckPasswordModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:viewModel.msg!, complition: {
            
          })
    }
    
//   ChangePasswordDisplayLogic
    func successFetchedItems(viewModel: ChangePasswordModel.Fetch.ViewModel) {
        
    }
    
    func errorFetchingItems(viewModel: ChangePasswordModel.Fetch.ViewModel) {
        
    }
}
