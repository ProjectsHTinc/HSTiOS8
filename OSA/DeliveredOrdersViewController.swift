//
//  DeliveredOrdersViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 22/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import UIKit

protocol DeliveredOrdersDisplayLogic: class
{
    func successFetchedItems(viewModel: DeliveredOrdersModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: DeliveredOrdersModel.Fetch.ViewModel)
}

class DeliveredOrdersViewController: UIViewController, DeliveredOrdersDisplayLogic,UITableViewDelegate,UITableViewDataSource {

   
    @IBOutlet weak var deliveredOrderTableView: UITableView!
    
    var displayedDeliveredOrdersData: [DeliveredOrdersModel.Fetch.ViewModel.DisplayedDeliveredOrdersData] = []
    
    var interactor: DeliveredOrdersBusinessLogic?
    var order_id = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.fetchItems(request: DeliveredOrdersModel.Fetch.Request(user_id:GlobalVariables.shared.customer_id,status:"Deliverd"))

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
        let interactor = DeliveredOrdersInteractor()
        let presenter = DeliveredOrdersPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
      
    }
   
    func successFetchedItems(viewModel: DeliveredOrdersModel.Fetch.ViewModel) {
        displayedDeliveredOrdersData = viewModel.displayedDeliveredOrdersData
        for data in displayedDeliveredOrdersData {
            let order_id = data.order_id
            self.order_id.append(order_id!)
            
        }
        self.deliveredOrderTableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: DeliveredOrdersModel.Fetch.ViewModel) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedDeliveredOrdersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DeliveredOrdersTableViewCell
        
        let data = displayedDeliveredOrdersData[indexPath.row]
        cell.orderId.text = data.order_id
        cell.date.text = data.total_amount
        cell.price.text = data.street
        cell.status.text = data.status
        cell.viewProducts.tag = indexPath.row
        cell.viewProducts.addTarget(self, action: #selector(viewProductsButtonClicked(sender:)), for: .touchUpInside)
  
        
      return cell
    }
    
    @objc func viewProductsButtonClicked(sender: UIButton){
        
         let buttonClicked = sender.tag
         print(buttonClicked)
         let selectedIndex = Int(buttonClicked)
         print(selectedIndex)
        self.performSegue(withIdentifier: "to_deliveredOrderDetails", sender: self)
            
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "to_deliveredOrderDetails")
        {
        let vc = segue.destination as! OrderHistoryDetailsViewController
            vc.order_id = self.order_id
            
        }
    }
}
