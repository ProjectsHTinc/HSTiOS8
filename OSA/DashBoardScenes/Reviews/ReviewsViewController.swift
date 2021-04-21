
//
//  ReviewsViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 25/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//


import UIKit

protocol AddReviewDisplayLogic: class
{
    func successFetchedItems(viewModel: AddReviewModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: AddReviewModel.Fetch.ViewModel)
}

protocol CheckReviewDisplayLogic: class
{
    func successFetchedItems(viewModel: CheckReviewModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: CheckReviewModel.Fetch.ViewModel)
}

protocol UpdateReviewDisplayLogic: class
{
    func successFetchedItems(viewModel: UpdateReviewModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: UpdateReviewModel.Fetch.ViewModel)
}

class ReviewsViewController: UIViewController, AddReviewDisplayLogic, CheckReviewDisplayLogic,UpdateReviewDisplayLogic {
 
    @IBOutlet weak var buttonOneOutlet: UIButton!
    @IBOutlet weak var buttonTwoOutlet: UIButton!
    @IBOutlet weak var buttonThreeOutlet: UIButton!
    @IBOutlet weak var buttonFourOutlet: UIButton!
    @IBOutlet weak var buttonFiveOutlet: UIButton!
    @IBOutlet weak var submitOutlet: UIButton!
    @IBOutlet weak var reviewCommentTextField: UITextField!
    @IBOutlet weak var reviewLbl: UILabel!
    
    var interactor: AddReviewBusinessLogic?
    var interactor1: CheckReviewBusinessLogic?
    var interactor2: UpdateReviewBusinessLogic?
    var product_id = String()
    var selectedStars = "0"
    var ratingCount = String()
    var reviewId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
        view.bindToKeyboard()
        print(self.product_id)
        buttonOneOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
        buttonTwoOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
        buttonThreeOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
        buttonFourOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
        buttonFiveOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
        
        interactor1?.fetchItems(request: CheckReviewModel.Fetch.Request(product_id:self.product_id, user_id:GlobalVariables.shared.customer_id))
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
        let interactor = AddReviewInteractor()
        let presenter = AddReviewPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        let viewController1 = self
        let interactor1 = CheckReviewInteractor()
        let presenter1 = CheckReviewPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
        
        let viewController2 = self
        let interactor2 = UpdateReviewInteractor()
        let presenter2 = UpdateReviewPresenter()
        viewController2.interactor2 = interactor2
        interactor2.presenter2 = presenter2
        presenter2.viewController2 = viewController2
        
    }
        
    @IBAction func dismissAction(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func submitReviewAction(_ sender: Any) {
        
        if reviewId == ""
        {
        interactor?.fetchItems(request: AddReviewModel.Fetch.Request(product_id:self.product_id, user_id:GlobalVariables.shared.customer_id,comment:self.reviewCommentTextField.text!,rating:self.selectedStars))
        }
        else
        {
            interactor2?.fetchItems(request: UpdateReviewModel.Fetch.Request(product_id:self.product_id, user_id:GlobalVariables.shared.customer_id,comment:self.reviewCommentTextField.text!,rating:self.selectedStars,review_id:self.reviewId))
        }
    }
    
   //    AddReviewDisplayLogic
    func successFetchedItems(viewModel: AddReviewModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: Globals.LoginAlertMessage, complition: {
            
          })
    }
       
    func errorFetchingItems(viewModel: AddReviewModel.Fetch.ViewModel) {
           
    }
       
   //    CheckReviewDisplayLogic
    func successFetchedItems(viewModel: CheckReviewModel.Fetch.ViewModel) {
           
        self.ratingCount = viewModel.rating!
        self.reviewLbl.text = viewModel.comment
        self.reviewId = viewModel.id!
        setRating()
       
    }
       
    func errorFetchingItems(viewModel: CheckReviewModel.Fetch.ViewModel) {
           
    }
  
//    UpdateReviewDisplayLogic
    func successFetchedItems(viewModel: UpdateReviewModel.Fetch.ViewModel) {
        
        AlertController.shared.showAlert(targetVc: self, title: viewModel.msg!, message: "Success", complition: {
            
          })
    }
    
    func errorFetchingItems(viewModel: UpdateReviewModel.Fetch.ViewModel) {
        
    }
 
    
    @IBAction func buttonOne(_ sender: Any)
    {

        buttonOneOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
        buttonTwoOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
        buttonThreeOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
        buttonFourOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
        buttonFiveOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
        selectedStars = "1";

    }
    
    @IBAction func buttonTwo(_ sender: Any)
    {

        buttonOneOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
        buttonTwoOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
        buttonThreeOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
        buttonFourOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
        buttonFiveOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
        selectedStars = "2";

    }
    
    @IBAction func buttonThree(_ sender: Any)
    {
        
        buttonOneOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
        buttonTwoOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
        buttonThreeOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
        buttonFourOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
        buttonFiveOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
        selectedStars = "3";

    }
    
    @IBAction func buttonFour(_ sender: Any)
    {
        buttonOneOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
        buttonTwoOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
        buttonThreeOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
        buttonFourOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
        buttonFiveOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
        selectedStars = "4";

    }
    
    @IBAction func buttonFive(_ sender: Any)
    {

        buttonOneOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
        buttonTwoOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
        buttonThreeOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
        buttonFourOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
        buttonFiveOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
        selectedStars = "5";

     }
}

extension ReviewsViewController{
    
    func setRating() {
        
        if ratingCount == "1" {
            buttonOneOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
            buttonTwoOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
            buttonThreeOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
            buttonFourOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
            buttonFiveOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
        }
        if ratingCount == "2" {
            buttonOneOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
            buttonTwoOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
            buttonThreeOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
            buttonFourOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
            buttonFiveOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
        }
        if ratingCount == "3" {
            buttonOneOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
            buttonTwoOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
            buttonThreeOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
            buttonFourOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
            buttonFiveOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
        }
        if ratingCount == "4" {
            buttonOneOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
            buttonTwoOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
            buttonThreeOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
            buttonFourOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
            buttonFiveOutlet.setBackgroundImage(UIImage(named: "star (3)-1"), for: UIControl.State.normal)
        }
        if ratingCount == "5" {
            buttonOneOutlet.setBackgroundImage(UIImage(named: "star (3)1"), for: UIControl.State.normal)
            buttonTwoOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
            buttonThreeOutlet.setBackgroundImage(UIImage(named: "star (3)1"), for: UIControl.State.normal)
            buttonFourOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
            buttonFiveOutlet.setBackgroundImage(UIImage(named: "star (3)"), for: UIControl.State.normal)
        }
    }
}
