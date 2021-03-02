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

class LoginViewController: UIViewController, GIDSignInDelegate, LoginDisplayLogic {
    
    var interactor: LoginBusinessLogic?
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "to_otp")
        {
        let vc = segue.destination as! OTPViewController
            vc.mobileNumber = self.phoneNumTextField.text!
            vc.otp = self.Otp
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
