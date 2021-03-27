//
//  ProfileViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 18/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import UIKit
import SDWebImage
import Alamofire

protocol ProfileUpdateDisplayLogic: class
{
    func successFetchedItems(viewModel: ProfileUpdateModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ProfileUpdateModel.Fetch.ViewModel)
}

protocol ProfileDetailsDisplayLogic: class
{
    func successFetchedItems(viewModel: ProfileDetailsModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ProfileDetailsModel.Fetch.ViewModel)
}

class ProfileViewController: UIViewController, ProfileUpdateDisplayLogic,ProfileDetailsDisplayLogic {
    
    @IBOutlet weak var backgrounView: UIView!
    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    var interactor: ProfileUpdateBusinessLogic?
    var interactor1: ProfileDetailsBusinessLogic?
    var imagePicker = UIImagePickerController()
    var uploadedImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
      
        interactor1?.fetchItems(request: ProfileDetailsModel.Fetch.Request( user_id:GlobalVariables.shared.customer_id))
    }
    
    override func viewDidLayoutSubviews(){

        backgrounView.layerGradient(startPoint: .left, endPoint: .right, colorArray: [UIColor(red: 189.0/255.0, green: 6.0/255.0, blue: 33.0/255.0, alpha: 1.0).cgColor, UIColor(red: 95.0/255.0, green: 3.0/255.0, blue: 17.0/255.0, alpha: 1.0).cgColor], type: .axial)
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
        let interactor = ProfileUpdateInteractor()
        let presenter = ProfileUpdatePresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        let viewController1 = self
        let interactor1 = ProfileDetailsInteractor()
        let presenter1 = ProfileDetailsPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
    }
    
    @IBAction func saveProfileAction(_ sender: Any) {
        
        guard CheckValuesAreEmpty () else {
                   return
        }
      
        interactor?.fetchItems(request: ProfileUpdateModel.Fetch.Request(email:self.emailIdTextField.text!, user_id:"3",phone_number:self.mobileNumberTextField.text!, gender:"",dob:"", newsletter_status:"",first_name:self.userNameTextField.text!, last_name:""))
    }
    
    @IBAction func selectImageAction(_ sender: Any) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
                self.openCamera()
        }))
            
        alert.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { _ in
                self.openGallary()
        }))
            
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
            
        //If you want work actionsheet on ipad then you have to use popoverPresentationController to present the actionsheet, otherwise app will crash in iPad
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            alert.popoverPresentationController?.sourceView = sender as? UIView
            alert.popoverPresentationController?.sourceRect = (sender as AnyObject).bounds
            alert.popoverPresentationController?.permittedArrowDirections = .up
        default:
            break
        }
            
        self.present(alert, animated: true, completion: nil)
    }
    
    
//    ProfileUpdate
    func successFetchedItems(viewModel: ProfileUpdateModel.Fetch.ViewModel) {
        
    }
    
    func errorFetchingItems(viewModel: ProfileUpdateModel.Fetch.ViewModel) {
        
    }
    
//    ProfileDetails
    func successFetchedItems(viewModel: ProfileDetailsModel.Fetch.ViewModel) {
        
        self.emailIdTextField.text = viewModel.email
        self.mobileNumberTextField.text = viewModel.phone_number
        self.userNameTextField.text = viewModel.first_name
        self.userImage.sd_setImage(with: URL(string: viewModel.profile_picture!), placeholderImage: UIImage(named: "profile"))
        GlobalVariables.shared.profile_picture = viewModel.profile_picture!
    
    }
    
    func errorFetchingItems(viewModel: ProfileDetailsModel.Fetch.ViewModel) {
        
    }
    
    func CheckValuesAreEmpty () -> Bool{

        guard self.emailIdTextField.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "EmailId is Empty", complition: {
                
              })
             return false
         }
        guard self.userNameTextField.text?.count != 0  else {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "User name is Empty", complition: {
                
              })
             return false
         }
        guard self.mobileNumberTextField.text?.count != 0  else  {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "MobileNumber is Empty", complition: {
                
              })
             return false
         }
          return true
    }
}

extension ProfileViewController : UIImagePickerControllerDelegate & UINavigationControllerDelegate  {
   
  
    func openCamera(){
            if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            //If you dont want to edit the photo then you can set allowsEditing to false
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        }
        else{
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
        
    //MARK: - Choose image from camera roll
        
    func openGallary(){
         imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
         //If you dont want to edit the photo then you can set allowsEditing to false
         imagePicker.allowsEditing = true
         imagePicker.delegate = self
         self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         uploadedImage = (info[.originalImage] as? UIImage)!
         if  let editedImage = info[.originalImage] as? UIImage
         {
             self.userImage.image = editedImage
             self.userImage.clipsToBounds = true
         }
         //Dismiss the UIImagePicker after selection
         self.picUploadAPI()
         picker.dismiss(animated: true, completion: nil)
    }
    
    func picUploadAPI() {
        
        let imgData = uploadedImage.jpegData(compressionQuality: 0.75)
        if imgData == nil
        {
              //self.performSegue(withIdentifier: "back_selectPage", sender: self)
        }
        else
        {
            let functionName = "mobileapi/update_profilepic/"
            let baseUrl = "https://happysanztech.com/shopping/" + functionName + "\(GlobalVariables.shared.customer_id)/"
            let url = URL(string: baseUrl)!
            Alamofire.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(imgData!, withName: "user_pic",fileName: "file.jpg", mimeType: "image/jpg")
            },
             to:url)
            { (result) in
                switch result {
                case .success(let upload, _, _):
                       upload.uploadProgress(closure: { (progress) in
                           print("Upload Progress: \(progress.fractionCompleted)")
                       })
                       upload.responseJSON { response in
                       print(response.result.value as Any)
                       //ActivityIndicator().hideActivityIndicator(uiView: self.view)
                       let JSON = response.result.value as? [String: Any]
                       let msg = JSON?["msg"] as? String
                       let status = JSON?["status"] as? String
                       GlobalVariables.shared.profile_picture = (JSON?["picture_url"] as? String)!
                       print(msg!,status!,GlobalVariables.shared.profile_picture)
                        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: msg!, complition: {
                            
                          })
                    }
                case .failure(let encodingError):
                    print(encodingError)
                }
            }
        }
    }
}

