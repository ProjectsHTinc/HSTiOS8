//
//  InTransitViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 22/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import UIKit
import MBProgressHUD

class InTransitViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,DeliveredOrdersDisplayLogic {
  
    @IBOutlet weak var inTransitTableView: UITableView!
    
    var displayedDeliveredOrdersData: [DeliveredOrdersModel.Fetch.ViewModel.DisplayedDeliveredOrdersData] = []
    var interactor: DeliveredOrdersBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        MBProgressHUD.hide(for: self.view, animated: true)
        interactor?.fetchItems(request: DeliveredOrdersModel.Fetch.Request(user_id:GlobalVariables.shared.customer_id,status:"Transit"))
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
        let interactor = DeliveredOrdersInteractor()
        let presenter = DeliveredOrdersPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
      
    }
    
    func successFetchedItems(viewModel: DeliveredOrdersModel.Fetch.ViewModel) {
        displayedDeliveredOrdersData = viewModel.displayedDeliveredOrdersData
        self.inTransitTableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: DeliveredOrdersModel.Fetch.ViewModel) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedDeliveredOrdersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InTransitTableViewCell
        let data = displayedDeliveredOrdersData[indexPath.row]
        cell.orderId.text = data.order_id
        cell.date.text = data.total_amount
        cell.price.text = data.street
        cell.status.text = data.status
        cell.viewProducts.tag = indexPath.row
       return cell
        
    }
}
