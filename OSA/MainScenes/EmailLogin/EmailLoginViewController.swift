//
//  EmailLoginViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 05/02/21.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn

protocol EmailLoginDisplayLogic: class
{
    func successFetchedItems(viewModel: EmailLoginModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: EmailLoginModel.Fetch.ViewModel)
}

class EmailLoginViewController: UIViewController,GIDSignInDelegate, EmailLoginDisplayLogic{
    
    var interactor: EmailLoginBusinessLogic?
    var router: (NSObjectProtocol & EmailLoginRoutingLogic & EmailLoginDataPassing)?
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var passwordTextField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
//        view.bindToKeyboard()
       
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
        let interactor = EmailLoginInteractor()
        let presenter = EmailLoginPresenter()
        let router = EmailLoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    func successFetchedItems(viewModel: EmailLoginModel.Fetch.ViewModel) {
        print(viewModel.status!)
        if viewModel.status == "success" {
            
            UserDefaults.standard.set(viewModel.customer_id!, forKey: UserDefaultsKey.customer_idkey.rawValue)
            GlobalVariables.shared.customer_id = UserDefaults.standard.object(forKey: UserDefaultsKey.customer_idkey.rawValue) as! String
            
            UserDefaults.standard.set(viewModel.profile_picture!, forKey: UserDefaultsKey.profile_picturekey.rawValue)
            GlobalVariables.shared.profile_picture = UserDefaults.standard.object(forKey: UserDefaultsKey.profile_picturekey.rawValue) as! String
            
            UserDefaults.standard.set(viewModel.phone_number!, forKey: UserDefaultsKey.phone_numberKey.rawValue)
            GlobalVariables.shared.phone_number = UserDefaults.standard.object(forKey: UserDefaultsKey.phone_numberKey.rawValue) as! String
            
            UserDefaults.standard.set(viewModel.first_name!, forKey: UserDefaultsKey.first_nameKey.rawValue)
            GlobalVariables.shared.first_name = UserDefaults.standard.object(forKey: UserDefaultsKey.first_nameKey.rawValue) as! String
            
            UserDefaults.standard.set(viewModel.last_name!, forKey: UserDefaultsKey.last_namekey.rawValue)
            GlobalVariables.shared.last_name = UserDefaults.standard.object(forKey: UserDefaultsKey.last_namekey.rawValue) as! String

            self.performSegue(withIdentifier: "to_dashBoard", sender: self)
        }
    }
    
    func errorFetchingItems(viewModel: EmailLoginModel.Fetch.ViewModel) {
        
    }
    
    @IBAction func continueAction(_ sender: Any) {
        guard CheckValuesAreEmpty () else {
                   return
        }
        interactor?.fetchItems(request: EmailLoginModel.Fetch.Request(email_id :self.emailTextfield.text,password:self.passwordTextField.text,mob_key:"5352eefa98e3d96b0b77bd0cb35ac455f9fc62ad8fda3ddc10542efcc67b8ce4" ,mobile_type:"2"))
    }
  
    @IBAction func continueWithGoogleAction(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    @IBAction func continueWithFacebookAction(_ sender: Any) {
        
    }
    
    @IBAction func forgotpasswordAction(_ sender: Any) {
        
    }
    
    func CheckValuesAreEmpty () -> Bool{
        
        guard Reachability.isConnectedToNetwork() == true else {
              AlertController.shared.offlineAlert(targetVc: self, complition: {
                //Custom action code
             })
             return false
        }
        
        guard self.emailTextfield.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: Globals.LoginAlertMessage, complition: {
                
              })
             return false
         }
            
          return true
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
              print("The user has not signed in before or they have since signed out.")
            } else {
              print("\(error.localizedDescription)")
            }
            return
          }
          // Perform any operations on signed in user here.
          let userId = user.userID                  // For client-side use only!
          let idToken = user.authentication.idToken // Safe to send to the server
          let fullName = user.profile.name
          let givenName = user.profile.givenName
          let familyName = user.profile.familyName
          let email = user.profile.email
         print(userId!)
         print(idToken!)
         print(fullName!)
         print(givenName!)
         print(familyName!)
         print(email!)
          // ...
    }
}
