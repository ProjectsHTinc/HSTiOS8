//
//  AddAddressViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 09/03/21.
//

import UIKit
import CoreLocation

protocol AddAddressDisplayLogic: class
{
    func successFetchedItems(viewModel: AddAddressModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: AddAddressModel.Fetch.ViewModel)
}
protocol UpdateAddressDisplayLogic: class
{
    func successFetchedItems(viewModel: UpdateAddressModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: UpdateAddressModel.Fetch.ViewModel)
}

class AddAddressViewController: UIViewController,CLLocationManagerDelegate, AddAddressDisplayLogic,UpdateAddressDisplayLogic {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var addressline1TextField: UITextField!
    @IBOutlet weak var addressline2TextField: UITextField!
    @IBOutlet weak var landMarkTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var pincodeTextField: UITextField!
    @IBOutlet weak var addressTypeTextField: UITextField!
    
    var interactor: AddAddressBusinessLogic?
    var interactor2: UpdateAddressBusinessLogic?
    let locationManager = CLLocationManager()
    var lat_ = String()
    var long_ = String()
    
    var slectedFullName = String()
    var slectedAddress_type = String()
    var slectedAlternative_mobile_number = String()
    var slectedcity = String()
    var slectedemail_address = String()
    var slectedhouse_no = String()
    var slectedId = String()
    var slectedLandmark = String()
    var slectedState = String()
    var slectedStreet = String()
    var slectedPincode = String()
    var slectedMobile_number = String()
    var dataFromList = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTextField.text = slectedFullName
        self.mobileNumberTextField.text = slectedMobile_number
        self.addressline1TextField.text = slectedhouse_no + "," + slectedStreet
        self.addressline2TextField.text = ""
        self.landMarkTextField.text = slectedLandmark
        self.stateTextField.text = slectedState
        self.cityTextField.text = slectedcity
        self.pincodeTextField.text = slectedPincode

//        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "Get current location to tap the button ", complition: {
//
//          }
//
        self.hideKeyboardWhenTappedAround()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nameTextField.text = GlobalVariables.shared.first_name
        self.mobileNumberTextField.text = GlobalVariables.shared.phone_number
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
        let interactor = AddAddressInteractor()
        let presenter = AddAddressPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        let viewController2 = self
        let interactor2 = UpdateAddressInteractor()
        let presenter2 = UpdateAddressPresenter()
        viewController2.interactor2 = interactor2
        interactor2.presenter2 = presenter2
        presenter2.viewController2 = viewController2
        
    }
    
    @IBAction func useCurrentLocationAction(_ sender: Any) {
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        lat_ = String(format:"%f", locValue.latitude)
        long_ = String(format:"%f", locValue.longitude)
        getAddressFromLatLon(pdblLatitude:lat_,withLongitude:long_)
    }
    
    @IBAction func saveAddressAction(_ sender: Any) {
        
        guard CheckValuesAreEmpty () else {
                   return
        }
        
        if dataFromList == "dataFromList" {
            
            interactor2?.fetchItems(request: UpdateAddressModel.Fetch.Request(user_id:GlobalVariables.shared.customer_id, country_id:"1",state:self.stateTextField.text!,city:self.cityTextField.text!,pincode:self.pincodeTextField.text!,house_no:self.addressline1TextField.text!,street:self.addressline2TextField.text!,landmark:self.landMarkTextField.text!,full_name:self.nameTextField.text!,mobile_number:self.mobileNumberTextField.text,email_address:GlobalVariables.shared.email_Id,alternative_mobile_number:"", address_type:"1",address_id:slectedId ,status:""))
      
        }
        else
        {
         interactor?.fetchItems(request: AddAddressModel.Fetch.Request(user_id:GlobalVariables.shared.customer_id, country_id:"1",state:self.stateTextField.text!,city:self.cityTextField.text!,pincode:self.pincodeTextField.text!,house_no:self.addressline1TextField.text!,street:self.addressline2TextField.text!,landmark:self.landMarkTextField.text!,full_name:self.nameTextField.text!,mobile_number:self.mobileNumberTextField.text,email_address:GlobalVariables.shared.email_Id,alternative_mobile_number:"", address_type:"1"))
        }
    }
    
    func successFetchedItems(viewModel: AddAddressModel.Fetch.ViewModel) {
        
        if viewModel.status == "success"
        {
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "Address Added Successfully", complition: {
                 })
        }
    }
    
    func errorFetchingItems(viewModel: AddAddressModel.Fetch.ViewModel){
        
    }
    
//    Update Address
    func successFetchedItems(viewModel: UpdateAddressModel.Fetch.ViewModel) {
            
    }
        
    func errorFetchingItems(viewModel: UpdateAddressModel.Fetch.ViewModel) {
            
    }
        

    func getAddressFromLatLon(pdblLatitude: String, withLongitude pdblLongitude: String)
    {
        
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let lat: Double = Double("\(pdblLatitude)")!
        let lon: Double = Double("\(pdblLongitude)")!
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon

        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
        ceo.reverseGeocodeLocation(loc, completionHandler:
                                    { [self](placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                }
                let pm = placemarks! as [CLPlacemark]
                
                if pm.count > 0 {
                    let pm = placemarks![0]
                    print(pm.country as Any)
                    print(pm.locality as Any)
                    print(pm.subLocality as Any)
                    print(pm.thoroughfare as Any)
                    print(pm.postalCode as Any)
                    print(pm.subThoroughfare as Any)
                    print(pm.administrativeArea as Any)
                    print(pm.subAdministrativeArea as Any)
                    print(pm.subThoroughfare as Any)
                    var addressString : String = ""
                    if pm.subLocality != nil {
                        addressString = addressString + pm.subLocality! + ", "
                    }
                    if pm.thoroughfare != nil {
                        addressString = addressString + pm.thoroughfare! + ", "
                        print(addressString)
                    }
                    if pm.locality != nil {
                        addressString = addressString + pm.locality! + ", "
                        print(addressString)
                    }
                    if pm.country != nil {
                        addressString = addressString + pm.country! + ", "
                        print(addressString)
                    }
                    self.stateTextField.text = (pm.administrativeArea)
                    self.pincodeTextField.text = (pm.postalCode)
                    self.addressline2TextField.text = pm.subLocality! + "," + pm.thoroughfare!
                    self.cityTextField.text = (pm.locality)
                }
          })
     }
    
    func CheckValuesAreEmpty () -> Bool{

        guard self.nameTextField.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "Name is Empty", complition: {
                
              })
             return false
         }
        guard self.addressline1TextField.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "address is Empty", complition: {
                
              })
             return false
         }
        guard self.mobileNumberTextField.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "MobileNumber is Empty", complition: {
                
              })
             return false
         }
        guard self.landMarkTextField.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "landmark is Empty", complition: {
                
              })
             return false
         }
        guard self.stateTextField.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "State is Empty", complition: {
                
              })
             return false
         }
        guard self.cityTextField.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "City is Empty", complition: {
                
              })
             return false
         }
        guard self.pincodeTextField.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "Pincode is Empty", complition: {
                
              })
             return false
         }
          return true
    }
}
