//
//  CartListViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 04/03/21.
//

import UIKit
import GMStepper
import SDWebImage

protocol CartListDisplayLogic: class
{
    func successFetchedItems(viewModel: CartListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: CartListModel.Fetch.ViewModel)
}

protocol DeleteCartDisplayLogic: class
{
    func successFetchedItems(viewModel:DeleteCartModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: DeleteCartModel.Fetch.ViewModel)
}
protocol QuantityUpdateDisplayLogic: class
{
    func successFetchedItems(viewModel:QuantityUpdateModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: QuantityUpdateModel.Fetch.ViewModel)
}

class CartListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, CartListDisplayLogic, DeleteCartDisplayLogic,QuantityUpdateDisplayLogic {
     
 
    @IBOutlet weak var cartListTableView: UITableView!
    @IBOutlet weak var totalAmountLbl: UILabel!
    
    var router: (NSObjectProtocol & CartListRoutingLogic & CartListDataPassing)?
    var interactor: CartListBusinessLogic?
    var interactor1: DeleteCartBusinessLogic?
    var interactor2: QuantityUpdateBusinessLogic?
    var deletedCartId = String()
    var selectedCartId = String()
    var idArr = [String]()
    var quantityArr = [Double]()
    
    var displayedCartListData: [CartListModel.Fetch.ViewModel.DisplayedCartListData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.fetchItems(request: CartListModel.Fetch.Request(user_id:"1"))
        // Do any additional setup after loading the view.
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
        let interactor = CartListInteractor()
        let presenter = CartListPresenter()
        let router = CartListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        let viewController1 = self
        let interactor1 = DeleteCartInteractor()
        let presenter1 = DeleteCartPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
        
        let viewController2 = self
        let interactor2 = QuantityUpdateInteractor()
        let presenter2 = QuantityUpdatePresenter()
        viewController2.interactor2 = interactor2
        interactor2.presenter2 = presenter2
        presenter2.viewController2 = viewController2
    }
    
//    Cart List
    func successFetchedItems(viewModel: CartListModel.Fetch.ViewModel) {
        displayedCartListData = viewModel.displayedCartListData
        self.totalAmountLbl.text = "₹\(GlobalVariables.shared.total_cart_payment)"
        self.idArr.removeAll()
        self.quantityArr.removeAll()
        for data in displayedCartListData {
            let id = data.id
            let quantity = Double(data.quantity!)
            
            self.quantityArr.append(quantity!)
            self.idArr.append(id!)
        }
        self.cartListTableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: CartListModel.Fetch.ViewModel) {
        
    }
    
// Cart Delete
    func successFetchedItems(viewModel: DeleteCartModel.Fetch.ViewModel) {
        
        
        
        let alertController = UIAlertController(title: Globals.alertTitle, message: viewModel.msg, preferredStyle: .alert)
        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { [self]
            UIAlertAction in
            NSLog("OK Pressed")
            self.interactor?.fetchItems(request: CartListModel.Fetch.Request(user_id:"1"))
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
        self.cartListTableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: DeleteCartModel.Fetch.ViewModel) {
        
    }
    
//    Quantity Update
    func successFetchedItems(viewModel: QuantityUpdateModel.Fetch.ViewModel) {
        if viewModel.msg == "Product Quantity Updated" {
           
        interactor?.fetchItems(request: CartListModel.Fetch.Request(user_id:"1"))
        }
    }
    
    func errorFetchingItems(viewModel: QuantityUpdateModel.Fetch.ViewModel) {
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedCartListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartListTableViewCell
        let cartData = displayedCartListData[indexPath.row]
        
        cell.productImage.sd_setImage(with: URL(string: cartData.product_cover_img!), placeholderImage: UIImage(named: ""))
        cell.MrpPrice.text = cartData.price
        cell.productName.text = cartData.product_name
        cell.stepper.value = quantityArr[indexPath.row]
        cell.deleteCart.tag = indexPath.row
        cell.stepper.tag = indexPath.row
        cell.deleteCart.addTarget(self, action: #selector(deleteButtonClicked(sender:)), for: .touchUpInside)
        cell.stepper.addTarget(self, action: #selector(CartListViewController.stepperValueChanged), for: .valueChanged)

           return cell
        
      
    }
    
    @objc func deleteButtonClicked(sender: UIButton){
      let buttonClicked = sender.tag
        print(buttonClicked)
        let selectedIndex = Int(buttonClicked)
        let sel = self.idArr[selectedIndex]
        self.deletedCartId = String(sel)
        interactor1?.fetchItems(request: DeleteCartModel.Fetch.Request(cart_id:self.deletedCartId, user_id:"1"))
    }
    
    @objc func stepperValueChanged(stepper: GMStepper) {
        let buttonClicked = stepper.tag
          print(buttonClicked)
          let selectedIndex = Int(buttonClicked)
          let sel = self.idArr[selectedIndex]
         self.selectedCartId = String(sel)
        
        let Quantity = stepper.value
        let quantityValue = String(Quantity)
        print(quantityValue)
        interactor2?.fetchItems(request: QuantityUpdateModel.Fetch.Request(cart_id:self.selectedCartId, user_id:"1",cart_quantity:quantityValue))
    }
}



