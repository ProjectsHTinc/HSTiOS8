//
//  ReturnOrderViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 24/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import UIKit
import SDWebImage

protocol ReturnReasonListDisplayLogic: class
{
    func successFetchedItems(viewModel: ReturnReasonListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ReturnReasonListModel.Fetch.ViewModel)
}

class ReturnOrderViewController: UIViewController, ReturnReasonListDisplayLogic {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var displayedReturnReasonListData: [ReturnReasonListModel.Fetch.ViewModel.DisplayedReturnReasonListData] = []
    
    var interactor: ReturnReasonListBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.fetchItems(request: ReturnReasonListModel.Fetch.Request(user_id:GlobalVariables.shared.customer_id))
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
        let interactor = ReturnReasonListInteractor()
        let presenter = ReturnReasonListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
       
    }
    
    func successFetchedItems(viewModel: ReturnReasonListModel.Fetch.ViewModel) {
        
        displayedReturnReasonListData = viewModel.displayedReturnReasonListData
        self.tableView.reloadData()
        
    }
    
    func errorFetchingItems(viewModel: ReturnReasonListModel.Fetch.ViewModel) {
        
    }
}


extension ReturnOrderViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedReturnReasonListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ReturnReasonListTableViewCell
        
        let data = displayedReturnReasonListData[indexPath.row]
//        cell.status.text = data.order_id
        cell.reasonText.text = data.question
        cell.selectButton.tag = indexPath.row
        cell.selectButton.addTarget(self, action: #selector(returnOrderButtonClicked(sender:)), for: .touchUpInside)
        
        return cell
    }
    @objc func returnOrderButtonClicked(sender: UIButton){
        
         let buttonClicked = sender.tag
         print(buttonClicked)
         let selectedIndex = Int(buttonClicked)
         print(selectedIndex)
            
    }
}
