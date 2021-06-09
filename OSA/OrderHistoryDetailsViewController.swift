//
//  OrderHistoryDetailsViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 24/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import UIKit

protocol OrderCartDetailsDisplayLogic: class
{
    func successFetchedItems(viewModel: OrderCartDetailsModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: OrderCartDetailsModel.Fetch.ViewModel)
}

class OrderHistoryDetailsViewController: UIViewController, OrderCartDetailsDisplayLogic, DeliveredOrdersDisplayLogic {
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var orderIdlbl: UILabel!
    @IBOutlet weak var orderDatelbl: UILabel!
    @IBOutlet weak var orderTotalLbl: UILabel!
    @IBOutlet weak var cusNameLbl: UILabel!
    @IBOutlet weak var phoneNumlbl: UILabel!
    @IBOutlet weak var streetlbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var pincodelbl: UILabel!
    @IBOutlet weak var itemsLbl: UILabel!
    @IBOutlet weak var walletLbl: UILabel!
    @IBOutlet weak var offerLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    
    var displayedOrderCartDetailsData: [OrderCartDetailsModel.Fetch.ViewModel.DisplayedOrderCartDetailsData] = []
    var displayedDeliveredOrdersData: [DeliveredOrdersModel.Fetch.ViewModel.DisplayedDeliveredOrdersData] = []
    
    var interactor: OrderCartDetailsBusinessLogic?
    var interactor1: DeliveredOrdersBusinessLogic?
    var order_id = String()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(order_id)
        interactor?.fetchItems(request: OrderCartDetailsModel.Fetch.Request(user_id:GlobalVariables.shared.customer_id,order_id:self.order_id))
        interactor1?.fetchItems(request: DeliveredOrdersModel.Fetch.Request(user_id:GlobalVariables.shared.customer_id,status:"Transit"))

    }
    
    @IBAction func returnOrderAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "return_order", sender: self)
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
        let interactor = OrderCartDetailsInteractor()
        let presenter = OrderCartDetailsPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        let viewController1 = self
        let interactor1 = DeliveredOrdersInteractor()
        let presenter1 = DeliveredOrdersPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
       
    }
    
    func successFetchedItems(viewModel: OrderCartDetailsModel.Fetch.ViewModel) {
  
        displayedOrderCartDetailsData = viewModel.displayedOrderCartDetailsData
        self.tableView.reloadData()
        
    }
    
    func errorFetchingItems(viewModel: OrderCartDetailsModel.Fetch.ViewModel) {
        
    }
    
    func successFetchedItems(viewModel: DeliveredOrdersModel.Fetch.ViewModel) {
        
        displayedDeliveredOrdersData = viewModel.displayedDeliveredOrdersData
        for data in displayedDeliveredOrdersData {
            let order_Id = data.order_id
//            let promoAmount = data.
//            let pincode = data.pincode
//            let street = data.street
//            let total_amount = data.total_amount
//            let house_no = data.house_no
//            let purchase_date = data.purchase_date
//            let wallet_amount = data.wallet_amount
//            let state = data.state
//            let country_name = data.country_name
//            let mobile_number = data.mobile_number
//            let city = data.city
//            let purchase_order_status = data.purchase_order_status
//            let paid_amount = data.paid_amount
//            let payment_status = data.payment_status
//            let full_name = data.full_name
//            let email_address = data.email_address
//            let landmark = data.landmark
//
                self.orderIdlbl.text = data.order_id
                self.orderDatelbl.text = data.purchase_date
                self.orderTotalLbl.text = data.total_amount
                self.cusNameLbl.text = data.full_name
                self.phoneNumlbl.text = data.mobile_number
                self.streetlbl.text = data.street
                self.cityLbl.text = data.city
                self.pincodelbl.text = data.pincode
                self.itemsLbl.text = data.paid_amount
                self.walletLbl.text = data.wallet_amount
                self.offerLbl.text = data.promo_amount
                self.totalLbl.text = data.total_amount
            
            self.order_id.append(order_Id!)
            
        }
    }
    
    func errorFetchingItems(viewModel: DeliveredOrdersModel.Fetch.ViewModel) {
        
    }
}

extension OrderHistoryDetailsViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedOrderCartDetailsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrderCartDetailsTableViewCell
        
        let data = displayedOrderCartDetailsData[indexPath.row]
//        cell.status.text = data.order_id
        cell.productName.text = data.product_name
        cell.MrpPrice.text = data.price
        cell.productImage.sd_setImage(with: URL(string: data.product_cover_img!), placeholderImage: UIImage(named: ""))
        cell.returnOrder.tag = indexPath.row
        cell.returnOrder.addTarget(self, action: #selector(writeReviewButtonClick(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func writeReviewButtonClick(sender: UIButton){
        
         let buttonClicked = sender.tag
         print(buttonClicked)
         let selectedIndex = Int(buttonClicked)
         print(selectedIndex)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "return_order")
        {
            _ = segue.destination as! ReturnOrderViewController
//
        }
    }
}

