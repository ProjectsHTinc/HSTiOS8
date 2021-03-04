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

class CartListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, CartListDisplayLogic {
 
    @IBOutlet weak var cartListTableView: UITableView!
    @IBOutlet weak var totalAmountLbl: UILabel!
    
    var router: (NSObjectProtocol & CartListRoutingLogic & CartListDataPassing)?
    var interactor: CartListBusinessLogic?
    
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
    }
    
    func successFetchedItems(viewModel: CartListModel.Fetch.ViewModel) {
        displayedCartListData = viewModel.displayedCartListData
//        self.totalAmountLbl.text = displayedCartListData
        self.cartListTableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: CartListModel.Fetch.ViewModel) {
        
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
           return cell
    }
    
//    @IBOutlet weak var productImage: UIImageView!
//    @IBOutlet weak var actualPrice: UILabel!
//    @IBOutlet weak var productName: UILabel!
//    @IBOutlet weak var stockLabel: UILabel!
//    @IBOutlet weak var MrpPrice: UILabel!
//    @IBOutlet weak var deleteCart: UIButton!
//    @IBOutlet weak var stepper: GMStepper!
//
}
