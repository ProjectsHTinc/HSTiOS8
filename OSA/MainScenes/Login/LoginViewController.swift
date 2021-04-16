//
//  Login.swift
//  OSA
//
//  Created by Happy Sanz Tech on 03/02/21.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn

protocol LoginDisplayLogic: class
{
    func successFetchedItems(viewModel: LoginModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: LoginModel.Fetch.ViewModel)
}
protocol GoogleIntegrationDisplayLogic: class
{
    func successFetchedItems(viewModel: GoogleIntegrationModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: GoogleIntegrationModel.Fetch.ViewModel)
}

class LoginViewController: UIViewController, GIDSignInDelegate, LoginDisplayLogic, GoogleIntegrationDisplayLogic {
  
    
    
    var interactor: LoginBusinessLogic?
    var interactor1: GoogleIntegrationBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    var Otp = String()
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var loginWithFbBtn: UIButton!
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var phoneNumTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        GIDSignIn.sharedInstance().delegate = self
        
//        let value = UserDefaults.standard.object(forKey: "getStartedKey") ?? ""
//        if value as! String == ""
//        {
//            self.performSegue(withIdentifier: "pop", sender: self)
//        }
        
    }
      
    @IBAction func gigninBtn(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
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
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        let viewController1 = self
        let interactor1 = GoogleIntegrationInteractor()
        let presenter1 = GoogleIntegrationPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
    }
    
    @IBAction func loginFbTapped(_ sender: Any) {
//           fbLogin()
    }
// 
    @IBAction func continueAction(_ sender: Any) {
       
        guard CheckValuesAreEmpty () else {
                   return
        }
        interactor?.fetchItems(request: LoginModel.Fetch.Request(mobile_number :self.phoneNumTextField.text))
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
        
        let deviceToken = UserDefaults.standard.object(forKey: UserDefaultsKey.deviceTokenKey.rawValue) ?? ""
        print("The device token is \(deviceToken)")
        
        interactor1?.fetchItems(request:GoogleIntegrationModel.Fetch.Request(email :email,first_name:fullName, last_name:"" ,mobile_type:"2",mob_key :deviceToken as? String,login_type:"Gplus", login_portal:"App"))

    }
    
    func successFetchedItems(viewModel: LoginModel.Fetch.ViewModel) {
        print(viewModel.OTP!)
        if viewModel.status == "success" {
        self.Otp = viewModel.OTP!
        self.performSegue(withIdentifier: "to_otp", sender: self)
        }
    }

    func errorFetchingItems(viewModel: LoginModel.Fetch.ViewModel) {
      print(viewModel.message!)
  
    }
    
    func successFetchedItems(viewModel: GoogleIntegrationModel.Fetch.ViewModel) {
        
        print(viewModel.phone_number!)
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
            
            UserDefaults.standard.set(viewModel.email!, forKey: UserDefaultsKey.email_idkey.rawValue)
            GlobalVariables.shared.email_Id = UserDefaults.standard.object(forKey: UserDefaultsKey.email_idkey.rawValue) as! String

        self.performSegue(withIdentifier: "to_dashBoard2", sender: self)
        }
    }
    
    func errorFetchingItems(viewModel: GoogleIntegrationModel.Fetch.ViewModel) {
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "to_otp")
        {
        let vc = segue.destination as! OTPViewController
            vc.mobileNumber = self.phoneNumTextField.text!
            vc.otp = self.Otp
        }
        else if (segue.identifier == "to_dashBoard2") {
            
            _ = segue.destination as! UINavigationController
            
        }
  }
    
    func CheckValuesAreEmpty () -> Bool{
        
        guard Reachability.isConnectedToNetwork() == true else {
              AlertController.shared.offlineAlert(targetVc: self, complition: {
                //Custom action code
             })
             return false
        }
        
        guard self.phoneNumTextField.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: Globals.LoginAlertMessage, complition: {
                
              })
             return false
         }
          return true
    }
}
 
