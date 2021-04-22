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

class OrderHistoryDetailsViewController: UIViewController, OrderCartDetailsDisplayLogic {
    
    @IBOutlet weak var tableView: UITableView!
    
    var displayedOrderCartDetailsData: [OrderCartDetailsModel.Fetch.ViewModel.DisplayedOrderCartDetailsData] = []
    
    var interactor: OrderCartDetailsBusinessLogic?
    var order_id = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(order_id)
        interactor?.fetchItems(request: OrderCartDetailsModel.Fetch.Request(user_id:GlobalVariables.shared.customer_id,order_id:self.order_id))

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
       
    }
    
    func successFetchedItems(viewModel: OrderCartDetailsModel.Fetch.ViewModel) {
  
        displayedOrderCartDetailsData = viewModel.displayedOrderCartDetailsData
        self.tableView.reloadData()
        
    }
    
    func errorFetchingItems(viewModel: OrderCartDetailsModel.Fetch.ViewModel) {
        
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
        cell.returnOrder.addTarget(self, action: #selector(returnOrderButtonClicked(sender:)), for: .touchUpInside)
        
        return cell
    }
    @objc func returnOrderButtonClicked(sender: UIButton){
        
         let buttonClicked = sender.tag
         print(buttonClicked)
         let selectedIndex = Int(buttonClicked)
         print(selectedIndex)
        self.performSegue(withIdentifier: "return_order", sender: self)
            
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "return_order")
        {
//        let vc = segue.destination as! OrderHistoryDetailsViewController
//
            
        }
    }
}

