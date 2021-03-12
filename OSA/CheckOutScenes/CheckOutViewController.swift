//
//  CheckOutViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 08/03/21.
//

import UIKit

protocol DeliveryAddressDisplayLogic: class
{
    func successFetchedItems(viewModel: DeliveryAddressModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: DeliveryAddressModel.Fetch.ViewModel)
}
protocol PromoCodeDisplayLogic: class
{
    func successFetchedItems(viewModel: PromoCodeModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: PromoCodeModel.Fetch.ViewModel)
}
protocol PlaceOrderDisplayLogic: class
{
    func successFetchedItems(viewModel: PlaceOrderModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: PlaceOrderModel.Fetch.ViewModel)
}
protocol OrderDetailsDisplayLogic: class
{
    func successFetchedItems(viewModel: OrderDetailsModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: OrderDetailsModel.Fetch.ViewModel)
}

class CheckOutViewController: UIViewController,DeliveryAddressDisplayLogic, PromoCodeDisplayLogic,PlaceOrderDisplayLogic,OrderDetailsDisplayLogic {
   
    
    @IBOutlet weak var promoCodeTextField: UITextField!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var itemsLbl: UILabel!
    @IBOutlet weak var deliveryLbl: UILabel!
    @IBOutlet weak var offerLbl: UILabel!
    @IBOutlet weak var totalPriceLbl: UILabel!
    
    var router: (NSObjectProtocol & DeliveryAddressRoutingLogic & DeliveryAddressDataPassing)?
    var displayedDeliveryAddressData: [DeliveryAddressModel.Fetch.ViewModel.DisplayedDeliveryAddressData] = []
    var displayedOrderDetailsData: [OrderDetailsModel.Fetch.ViewModel.DisplayedOrderDetailsData] = []
    
    var interactor: DeliveryAddressBusinessLogic?
    var interactor1: PromoCodeBusinessLogic?
    var interactor2: PlaceOrderBusinessLogic?
    var interactor3: OrderDetailsBusinessLogic?
    
    var userCity  = String()
    var userName = String()
    var userPhoneNumber = String()
    var addressId = String()
    var orderId = String()
    var items = String()
    var offer = String()
    var totalPrice = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(GlobalVariables.shared.customer_id)
        
      interactor?.fetchItems(request: DeliveryAddressModel.Fetch.Request(user_id:GlobalVariables.shared.customer_id))
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
        let interactor = DeliveryAddressInteractor()
        let presenter = DeliveryAddressPresenter()
        let router = DeliveryAddressRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        let viewController1 = self
        let interactor1 = PromoCodeInteractor()
        let presenter1 = PromoCodePresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
        
        let viewController2 = self
        let interactor2 = PlaceOrderInteractor()
        let presenter2 = PlaceOrderPresenter()
        viewController2.interactor2 = interactor2
        interactor2.presenter2 = presenter2
        presenter2.viewController2 = viewController2
        
        let viewController3 = self
        let interactor3 = OrderDetailsInteractor()
        let presenter3 = OrderDetailsPresenter()
        viewController3.interactor3 = interactor3
        interactor3.presenter3 = presenter3
        presenter3.viewController3 = viewController3
    }
    
    @IBAction func applyPromoCodeAction(_ sender: Any) {
       
        if self.promoCodeTextField.text?.isEmpty == true {
           
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "Field is Empty", complition: {
            })
        }
//        else
//        {
//        interactor1?.fetchItems(request: PromoCodeModel.Fetch.Request(purchse_order_id:self.orderId, user_id:GlobalVariables.shared.customer_id,promo_code:self.promoCodeTextField.text!))
//        }
    }
    
//    Address List
    func successFetchedItems(viewModel: DeliveryAddressModel.Fetch.ViewModel) {
        displayedDeliveryAddressData = viewModel.displayedDeliveryAddressData

        self.userCity.removeAll()
        self.userName.removeAll()
        self.userPhoneNumber.removeAll()
        self.addressId.removeAll()
        for data in displayedDeliveryAddressData {
            let name = data.full_name
            let phoneNumber = data.mobile_number
            let city = data.city
            let id = data.id
            
            self.userCity.append(city!)
            self.userName.append(name!)
            self.userPhoneNumber.append(phoneNumber!)
            self.addressId.append(id!)
            
        }
         self.nameLbl.text = userName
         self.addressLbl.text = userCity
         self.phoneNumberLbl.text = userPhoneNumber
        
//        interactor2?.fetchItems(request: PlaceOrderModel.Fetch.Request(cus_notes:"", user_id:GlobalVariables.shared.customer_id,address_id:self.addressId))
    }
    
    func errorFetchingItems(viewModel: DeliveryAddressModel.Fetch.ViewModel) {
        
    }
    
//    Apply Promo Code
    func successFetchedItems(viewModel: PromoCodeModel.Fetch.ViewModel) {
        
    }
    
    func errorFetchingItems(viewModel: PromoCodeModel.Fetch.ViewModel) {
        
    }
    
//    Place Order
    func successFetchedItems(viewModel: PlaceOrderModel.Fetch.ViewModel) {
        
        self.orderId = viewModel.order_id!
//        interactor3?.fetchItems(request: OrderDetailsModel.Fetch.Request( user_id:GlobalVariables.shared.customer_id,order_id:self.orderId))
    }
    
    func errorFetchingItems(viewModel: PlaceOrderModel.Fetch.ViewModel) {
        
    }
    
//    Order Details
    func successFetchedItems(viewModel: OrderDetailsModel.Fetch.ViewModel) {
        displayedOrderDetailsData = viewModel.displayedOrderDetailsData
        for data in displayedOrderDetailsData{
            
            let items = data.total_amount
            let offer = data.promo_amount
            let totalPrice = data.paid_amount
            
            self.items.append(items!)
            self.totalPrice.append(totalPrice!)
            self.offer.append(offer!)
            
            self.itemsLbl.text = "₹\(self.items)"
            self.offerLbl.text = "₹\(self.offer)"
            self.totalPriceLbl.text = "₹\(self.totalPrice)"
            
        }
    }
    
    func errorFetchingItems(viewModel: OrderDetailsModel.Fetch.ViewModel) {
        
    }
}
