//
//  OTPViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/02/21.
//

import UIKit

protocol OTPDisplayLogic: class
{
    func successFetchedItems(viewModel: OTPModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: OTPModel.Fetch.ViewModel)
}

class OTPViewController: UIViewController, UITextFieldDelegate, OTPDisplayLogic {
  
    var interactor: OTPBusinessLogic?
    var router: (NSObjectProtocol & OTPRoutingLogic & OTPDataPassing)?
    var otp = String()
    var mobileNumber = String()
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setTextfieldDelegates()
        self.hideKeyboardWhenTappedAround()
        self.otp = GlobalVariables.shared.Otp
        print(otp)
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
        let interactor = OTPInteractor()
        let presenter = OTPPresenter()
        let router = OTPRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    @IBAction func signInAction(_ sender: Any) {
        
        guard CheckValuesAreEmpty () else {
                  return
        }
            
        interactor?.fetchItems(request: OTPModel.Fetch.Request(mobile_number :"6379559776",OTP:self.otp,mob_key:"5352eefa98e3d96b0b77bd0cb35ac455f9fc62ad8fda3ddc10542efcc67b8ce4" ,mobile_type:"2",login_type:"Mobile",login_portal:"App"))
    }
  
    func successFetchedItems(viewModel: OTPModel.Fetch.ViewModel) {
        print(viewModel.phone_number!)
        if viewModel.status == "success" {
            GlobalVariables.shared.Otp = viewModel.phone_number!
        self.performSegue(withIdentifier: "to_dashBoard1", sender: self)
        }
    }
    
    func errorFetchingItems(viewModel: OTPModel.Fetch.ViewModel) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // On inputing value to textfield
        if ((textField.text?.count)! < 1  && string.count > 0){
            if(textField1 == textField1)
            {
                textField2.becomeFirstResponder()
            }
            if(textField == textField2)
            {
                textField3.becomeFirstResponder()
            }
            if(textField == textField3)
            {
                textField4.becomeFirstResponder()
            }

            textField.text = string
            return false
        }
        else if ((textField.text?.count)! >= 1  && string.count == 0){
          
            textField1.text = ""
            textField2.text = ""
            textField3.text = ""
            textField4.text = ""
            textField1.becomeFirstResponder()
            return false
        }
        else if ((textField.text?.count)! >= 1  )
        {
            textField.text = string
            return false
        }
        return true
    }
    
    func setTextfieldDelegates ()
    {
        /*Set Delegates*/
        self.textField1.delegate = self
        self.textField2.delegate = self
        self.textField3.delegate = self
        self.textField4.delegate = self
    }
    
    func CheckValuesAreEmpty () -> Bool{
           
           let attchedText = "\(textField1.text ?? "")\(textField2.text ?? "")\(textField3.text ?? "")\(textField4.text ?? "")"
          
           guard Reachability.isConnectedToNetwork() == true else{
                 AlertController.shared.offlineAlert(targetVc: self, complition: {
                   //Custom action code
                })
                return false
           }
           
           guard self.textField1.text?.count != 0 && self.textField2.text?.count != 0 && self.textField3.text?.count != 0 && self.textField4.text?.count != 0 else {
               AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "empty", complition: {
                   
                })
                return false
            }
           
           guard attchedText == self.otp else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.OTPAlertMessage, complition: {

                })
                return false
            }
           
             return true
       }
}
