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
protocol RemovePromoCodeDisplayLogic: class
{
    func successFetchedItems(viewModel: RemovePromoCodeModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: RemovePromoCodeModel.Fetch.ViewModel)
}
protocol WalletApplyDisplayLogic: class
{
    func successFetchedItems(viewModel: WalletApplyModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: WalletApplyModel.Fetch.ViewModel)
}

class CheckOutViewController: UIViewController,DeliveryAddressDisplayLogic, PromoCodeDisplayLogic,PlaceOrderDisplayLogic,OrderDetailsDisplayLogic, RemovePromoCodeDisplayLogic, WalletApplyDisplayLogic {
  
    @IBOutlet weak var promoCodeTextField: UITextField!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var itemsLbl: UILabel!
    @IBOutlet weak var deliveryLbl: UILabel!
    @IBOutlet weak var offerLbl: UILabel!
    @IBOutlet weak var totalPriceLbl: UILabel!
    @IBOutlet weak var walletSelectImage: UIImageView!
    @IBOutlet weak var cashOnDeliveryImage: UIImageView!
    @IBOutlet weak var pincodeLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    
    var router: (NSObjectProtocol & DeliveryAddressRoutingLogic & DeliveryAddressDataPassing)?
    var displayedDeliveryAddressData: [DeliveryAddressModel.Fetch.ViewModel.DisplayedDeliveryAddressData] = []
    var displayedOrderDetailsData: [OrderDetailsModel.Fetch.ViewModel.DisplayedOrderDetailsData] = []
    
    var interactor:  DeliveryAddressBusinessLogic?
    var interactor1: PromoCodeBusinessLogic?
    var interactor2: PlaceOrderBusinessLogic?
    var interactor3: OrderDetailsBusinessLogic?
    var interactor4: RemovePromoCodeBusinessLogic?
    var interactor5: WalletApplyBusinessLogic?

    var userCity  = [String]()
    var userName = [String]()
    var userPhoneNumber = [String]()
    var pincode = [String]()
    var city = [String]()
    var houseNum = [String]()
//    var addressId = [String]()
    
    var addressId = String()
    var orderId = String()
    var items = String()
    var offer = String()
    var totalPrice = String()
    var selectedPaymentMethod = String()
    
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

        let viewController4 = self
        let interactor4 = RemovePromoCodeInteractor()
        let presenter4 = RemovePromoCodePresenter()
        viewController4.interactor4 = interactor4
        interactor4.presenter4 = presenter4
        presenter4.viewController4 = viewController4
        
        let viewController5 = self
        let interactor5 = WalletApplyInteractor()
        let presenter5 = WalletApplyPresenter()
        viewController5.interactor5 = interactor5
        interactor5.presenter5 = presenter5
        presenter5.viewController5 = viewController5
        
    }
    
    @IBAction func applyPromoCodeAction(_ sender: Any) {
       
        if self.promoCodeTextField.text?.isEmpty == true {
           
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message: "Field is Empty", complition: {
            })
        }
        else
        {
        interactor1?.fetchItems(request: PromoCodeModel.Fetch.Request(purchse_order_id:self.orderId, user_id:GlobalVariables.shared.customer_id,promo_code:self.promoCodeTextField.text!))
        }
    }
    
    @IBAction func reviewOrderAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "to_reviewOrder", sender:self)
        
    }
    
    
    @IBAction func walletSelectAction(_ sender: Any) {
        self.selectedPaymentMethod = "wallet"
        self.walletSelectImage.image = UIImage(named: "check-mark")
        self.cashOnDeliveryImage.image = UIImage(named: "Ellipse 4")

    }
    
    @IBAction func cashOnDelevirySelectAction(_ sender: Any) {
        self.selectedPaymentMethod = "cashOnDelivery"
        self.cashOnDeliveryImage.image = UIImage(named: "check-mark")
        self.walletSelectImage.image = UIImage(named: "Ellipse 4")
        
    }
    
//    Address List DisplayLogic
    func successFetchedItems(viewModel: DeliveryAddressModel.Fetch.ViewModel) {
        displayedDeliveryAddressData = viewModel.displayedDeliveryAddressData

        self.userCity.removeAll()
        self.userName.removeAll()
        self.userPhoneNumber.removeAll()
        self.addressId.removeAll()
        self.pincode.removeAll()
        
        for data in displayedDeliveryAddressData {
            let name = data.full_name
            let phoneNumber = data.mobile_number
            let city = data.city
            let id = data.id
            let pincode = data.pincode
            let houseNum = data.house_no
      
            
            self.houseNum.append(houseNum!)
            self.userCity.append(city!)
            self.pincode.append(pincode!)
            self.userName.append(name!)
            self.userPhoneNumber.append(phoneNumber!)
            self.addressId.append(id!)
            
        }
         print("Project\(addressId)")
         self.nameLbl.text = userName[0]
         self.addressLbl.text = houseNum[0]
         self.pincodeLbl.text = pincode[0]
         self.cityLbl.text = userCity[0]
         self.phoneNumberLbl.text = userPhoneNumber[0]
        
        interactor2?.fetchItems(request: PlaceOrderModel.Fetch.Request(cus_notes:"", user_id:GlobalVariables.shared.customer_id,address_id:"94"))
        
    }
    
    func errorFetchingItems(viewModel: DeliveryAddressModel.Fetch.ViewModel) {
        
    }
    
//    Apply Promo Code DisplayLogic
    func successFetchedItems(viewModel: PromoCodeModel.Fetch.ViewModel) {
//
    }
    
    func errorFetchingItems(viewModel: PromoCodeModel.Fetch.ViewModel) {
        
    }
    
//    Place Order DisplayLogic
    func successFetchedItems(viewModel: PlaceOrderModel.Fetch.ViewModel) {
        
        GlobalVariables.shared.order_id = viewModel.order_id!
        self.orderId = viewModel.order_id!
        interactor3?.fetchItems(request: OrderDetailsModel.Fetch.Request( user_id:GlobalVariables.shared.customer_id,order_id:GlobalVariables.shared.order_id))
    }
    
    func errorFetchingItems(viewModel: PlaceOrderModel.Fetch.ViewModel) {
        
    }

//    Order Details DisplayLogic
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
            GlobalVariables.shared.total_price = self.totalPrice
        }
    }
    
    func errorFetchingItems(viewModel: OrderDetailsModel.Fetch.ViewModel) {
        
    }
    
//    Remove PromoCode DisplayLogic
    func successFetchedItems(viewModel: RemovePromoCodeModel.Fetch.ViewModel) {
        
    }
    
    func errorFetchingItems(viewModel: RemovePromoCodeModel.Fetch.ViewModel) {
        
    }
    
//    Wallet Aplly DisplayLogic
    func successFetchedItems(viewModel: WalletApplyModel.Fetch.ViewModel) {
        
    }
    
    func errorFetchingItems(viewModel: WalletApplyModel.Fetch.ViewModel) {
        
    }
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "to_reviewOrder")
        {
           let vc = segue.destination as! ReviewOrderViewController
            vc.selectedPaymentMethod = self.selectedPaymentMethod
            vc.offer = self.offerLbl.text!
            vc.totalPrice = self.totalPriceLbl.text!
            vc.items = self.itemsLbl.text!
            vc.order_id = self.orderId
          
        }
//        if (segue.identifier == "place_ovar items = String()
   
//        {
//        let vc = segue.destination as! OTPViewController
//
//       }
    }
}

//self.performSegue(withIdentifier: "place_order", sender: self)
