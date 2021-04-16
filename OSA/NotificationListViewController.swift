//
//  NotificationListViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 07/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import UIKit

protocol NotificationListDisplayLogic: class
{
    func successFetchedItems(viewModel: NotificationListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: NotificationListModel.Fetch.ViewModel)
}

class NotificationListViewController: UIViewController, NotificationListDisplayLogic {
    
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: NotificationListBusinessLogic?
    var displayedNotificationListData: [NotificationListModel.Fetch.ViewModel.DisplayedNotificationListData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.fetchItems(request: NotificationListModel.Fetch.Request(user_id:GlobalVariables.shared.customer_id))
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
        let interactor = NotificationListInteractor()
        let presenter = NotificationListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    
    func successFetchedItems(viewModel: NotificationListModel.Fetch.ViewModel) {
        
        displayedNotificationListData = viewModel.displayedNotificationListData
        self.tableView.reloadData()
        
    }
    
    func errorFetchingItems(viewModel: NotificationListModel.Fetch.ViewModel) {
        
    }
}

extension NotificationListViewController: UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedNotificationListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationListTableViewCell
        
        let data = displayedNotificationListData[indexPath.row]
        cell.Titlelabel.text = data.product_name
//        cell.offerLabel.text = data.notes
//        cell.timeLbl.text = data.created_at
        cell.descLabel.text = data.product_description!
        cell.productImage.sd_setImage(with: URL(string: data.product_cover_img!), placeholderImage: UIImage(named: ""))
        return cell
    }
}

