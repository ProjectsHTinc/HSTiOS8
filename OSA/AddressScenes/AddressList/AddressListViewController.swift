//
//  AddressListViewController.swift
//  
//
//  Created by Happy Sanz Tech on 09/03/21.
//

import UIKit

protocol AddressListDisplayLogic: class
{
    func successFetchedItems(viewModel: AddressListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: AddressListModel.Fetch.ViewModel)
}

class AddressListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,AddressListDisplayLogic {

    @IBOutlet weak var tableView: UITableView!
    
    var router: (NSObjectProtocol & AddressListRoutingLogic &
                 AddressListDataPassing)?
    var displayedAddressListData: [AddressListModel.Fetch.ViewModel.DisplayedAddressListData] = []
    
    var interactor: AddressListBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.fetchItems(request: AddressListModel.Fetch.Request(user_id:GlobalVariables.shared.customer_id))
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
        let interactor = AddressListInteractor()
        let presenter = AddressListPresenter()
        let router = AddressListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    func successFetchedItems(viewModel: AddressListModel.Fetch.ViewModel) {
        
        displayedAddressListData = viewModel.displayedAddressListData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: AddressListModel.Fetch.ViewModel) {
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedAddressListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AddressListTableViewCell
        let data = displayedAddressListData[indexPath.row]
        cell.addressLbl.text = data.street
//        cell.addressLbl.text = newArrivaldata.comment
           return cell
    }
}
//@IBOutlet weak var addressLbl: UILabel!
//@IBOutlet weak var addressLbl: UILabel!
//@IBOutlet weak var cityLbl: UILabel!
//@IBOutlet weak var phoneNumber: UILabel!
//@IBOutlet weak var deleteAddress: UIButton!
//@IBOutlet weak var editAddress: UIButton!
