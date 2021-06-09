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
    var interactor1: DeliveredOrdersBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        MBProgressHUD.hide(for: self.view, animated: true)
//        interactor1?.fetchItems(request: DeliveredOrdersModel.Fetch.Request(user_id:GlobalVariables.shared.customer_id,status:"Transit"))
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
        let viewController1 = self
        let interactor1 = DeliveredOrdersInteractor()
        let presenter1 = DeliveredOrdersPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
      
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
        cell.productImage.sd_setImage(with: URL(string: data.order_cover_img!), placeholderImage: UIImage(named: ""))
       return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
//        tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!
        self.performSegue(withIdentifier: "to_deliveredOrderDetails1", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
          if (segue.identifier == "to_deliveredOrderDetails1")
          {
            _ = segue.destination as! OrderHistoryViewController
       
          }
     }
}
