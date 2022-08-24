//
//  ReviewOrderViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 15/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import UIKit
import SDWebImage

protocol ReviewOrderDisplayLogic: class
{
    func successFetchedItems(viewModel: ReviewOrderModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ReviewOrderModel.Fetch.ViewModel)
}
protocol PayCODDisplayLogic: class
{
    func successFetchedItems(viewModel: PayCODModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: PayCODModel.Fetch.ViewModel)
}

class ReviewOrderViewController: UIViewController, ReviewOrderDisplayLogic, PayCODDisplayLogic {
 
    @IBOutlet weak var reviewOrderTableView: UITableView!
    @IBOutlet weak var itemsLbl: UILabel!
    @IBOutlet weak var deliveryLbl: UILabel!
    @IBOutlet weak var offerLbl: UILabel!
    @IBOutlet weak var totalPriceLbl: UILabel!
    
    var interactor: ReviewOrderBusinessLogic?
    var interactor1: PayCODBusinessLogic?
    var displayedReviewOrderData: [ReviewOrderModel.Fetch.ViewModel.DisplayedReviewOrderData] = []
    var selectedPaymentMethod = String()
    var items = String()
    var offer = String()
    var totalPrice = String()
    var order_id = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        interactor?.fetchItems(request: ReviewOrderModel.Fetch.Request( user_id:GlobalVariables.shared.customer_id,order_id:GlobalVariables.shared.order_id))
        print(selectedPaymentMethod)
        
        self.itemsLbl.text = self.items
        self.offerLbl.text = self.offer
        self.totalPriceLbl.text = self.totalPrice
    }
    
    override init (nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
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
        let interactor = ReviewOrderInteractor()
        let presenter = ReviewOrderPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        let viewController1 = self
        let interactor1 = PayCODInteractor()
        let presenter1 = PayCODPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
    }
    
    @IBAction func placeOrderAction(_ sender: Any) {
        
        if selectedPaymentMethod == "cashOnDelivery"
        {
            interactor1?.fetchItems(request: PayCODModel.Fetch.Request( user_id:GlobalVariables.shared.customer_id,order_id:self.order_id))
        }
        else
        {
            self.webRequestCCavenue ()
        }
    }
    
    func successFetchedItems(viewModel: ReviewOrderModel.Fetch.ViewModel) {
        displayedReviewOrderData = viewModel.displayedReviewOrderData
        self.reviewOrderTableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: ReviewOrderModel.Fetch.ViewModel) {
        
    }
    
//    PayCOD DisplayLogic
    func successFetchedItems(viewModel: PayCODModel.Fetch.ViewModel) {
        
        if viewModel.msg == "COD Completed"
        {
        self.performSegue(withIdentifier: "order_success", sender: self)
        }
    }
    
    func errorFetchingItems(viewModel: PayCODModel.Fetch.ViewModel) {
        
    }
}


extension ReviewOrderViewController: UITableViewDelegate,UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedReviewOrderData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = reviewOrderTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ReviewOrderTableViewCell
        let data = displayedReviewOrderData[indexPath.row]
        cell.productImage.sd_setImage(with: URL(string: data.product_cover_img!), placeholderImage: UIImage(named: ""))
//        cell.delivery.text = data.category_name
        cell.quantity.text = "Quantity - \(data.quantity!)"
        cell.MrpPrice.text = "₹\(data.total_amount!)"
        cell.productName.text = data.category_name
        
        return cell
    }
    
    func webRequestCCavenue ()
    {
//        let concordinateString = "\(GlobalVariables.shared.order_id)" + "-" + GlobalVariables.shared.customer_id
//        UserDefaults.standard.set("Ap", forKey: "Advance/customer")
//        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "CCWebViewController") as! CCWebViewViewController
//        viewController.accessCode = "AVAU84GD83BV10UAVB"
//        viewController.merchantId = "216134"
//        viewController.amount = GlobalVariables.shared.total_price
//        // advance_amount
//        viewController.currency = "INR"
//        viewController.orderId = concordinateString
//        viewController.redirectUrl = APIURL.BaseUrl_Dev + APIFunctionName.ccWebViewUrl
//        viewController.cancelUrl = APIURL.BaseUrl_Dev + "ccavenue_app/adding_money_to_wallet.php"
//        viewController.rsaKeyUrl = APIURL.BaseUrl_Dev + "ccavenue_app/GetRSA.php"
//
//        self.present(viewController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "order_success")
        {
            _ = segue.destination as! PayCODBookingSuccessViewController
          
        }
    }
}

