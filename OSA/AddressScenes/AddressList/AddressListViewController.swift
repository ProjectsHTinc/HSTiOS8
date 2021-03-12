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
protocol DeleteAddressDisplayLogic: class
{
    func successFetchedItems(viewModel: DeleteAddressModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: DeleteAddressModel.Fetch.ViewModel)
}

protocol DefaultAddressDisplayLogic: class
{
    func successFetchedItems(viewModel: DefaultAddressModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: DefaultAddressModel.Fetch.ViewModel)
}

class AddressListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,AddressListDisplayLogic,DeleteAddressDisplayLogic,DefaultAddressDisplayLogic {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    var router: (NSObjectProtocol & AddressListRoutingLogic &
                 AddressListDataPassing)?
    var displayedAddressListData: [AddressListModel.Fetch.ViewModel.DisplayedAddressListData] = []
    
    var interactor: AddressListBusinessLogic?
    var interactor1: DeleteAddressBusinessLogic?
    var interactor2: UpdateAddressBusinessLogic?
    var interactor3: DefaultAddressBusinessLogic?
    
    var idArr = [String]()
    var address_type = [String]()
    var alternative_mobile_number = [String]()
    var city = [String]()
    var email_address = [String]()
    var full_name = [String]()
    var house_no = [String]()
    var landmark = [String]()
    var mobile_number = [String]()
    var pincode = [String]()
    var state = [String]()
    var street = [String]()
    var dataTo_edit = String()
    
    var deleteAddressId = String()
    var slectedFullName = String()
    var slectedAddress_type = String()
    var slectedAlternative_mobile_number = String()
    var slectedcity = String()
    var slectedemail_address = String()
    var slectedhouse_no = String()
    var slectedId = String()
    var slectedLandmark = String()
    var slectedState = String()
    var slectedStreet = String()
    var slectedPincode = String()
    var slectedMobile_number = String()
    var indexArray : [NSIndexPath]?
    var selectedDefaultAdressId = String()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataTo_edit = "dataFromList"
        
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
        
        let viewController1 = self
        let interactor1 = DeleteAddressInteractor()
        let presenter1 = DeleteAddressPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
        
        let viewController3 = self
        let interactor3 = DefaultAddressInteractor()
        let presenter3 = DefaultAddressPresenter()
        viewController3.interactor3 = interactor3
        interactor3.presenter3 = presenter3
        presenter3.viewController3 = viewController3
    }
    
    func successFetchedItems(viewModel: AddressListModel.Fetch.ViewModel) {
        
        displayedAddressListData = viewModel.displayedAddressListData
        self.idArr.removeAll()
        
        for datas in displayedAddressListData {
            let id = datas.id
            let address_type = datas.address_type
            let alternative_mobile_number = datas.alternative_mobile_number
            let city = datas.city
            let email_address = datas.email_address
            let full_name = datas.full_name
            let house_no = datas.house_no
            let landmark = datas.landmark
            let mobile_number = datas.mobile_number
            let pincode = datas.pincode
            let state = datas.state
            let street = datas.street
            
            self.idArr.append(id!)
            self.address_type.append(address_type!)
            self.alternative_mobile_number.append(alternative_mobile_number!)
            self.email_address.append(email_address!)
            self.full_name.append(full_name!)
            self.house_no.append(house_no!)
            self.landmark.append(landmark!)
            self.mobile_number.append(mobile_number!)
            self.pincode.append(pincode!)
            self.state.append(state!)
            self.street.append(street!)
            self.city.append(city!)
        }
        
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: AddressListModel.Fetch.ViewModel) {
        
    }
    
//    Delete Address
    func successFetchedItems(viewModel: DeleteAddressModel.Fetch.ViewModel) {
        
        interactor?.fetchItems(request: AddressListModel.Fetch.Request(user_id:GlobalVariables.shared.customer_id))
    }
    
    func errorFetchingItems(viewModel: DeleteAddressModel.Fetch.ViewModel) {
        
    }
    
//    Set Default address
    func successFetchedItems(viewModel: DefaultAddressModel.Fetch.ViewModel) {
        
        if viewModel.status == "success"
        {
            
            interactor?.fetchItems(request: AddressListModel.Fetch.Request(user_id:GlobalVariables.shared.customer_id))
        }
    }
    
    func errorFetchingItems(viewModel: DefaultAddressModel.Fetch.ViewModel) {
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedAddressListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AddressListTableViewCell
        
        cell.radioButImage.isHidden = false
        cell.tickRadioButtonImage.isHidden = true
        let data = displayedAddressListData[indexPath.row]
        cell.addressLbl.text = data.street
        cell.nameLbl.text = data.full_name
        cell.phoneNumber.text = data.mobile_number
        cell.cityLbl.text = data.city! + "-" + data.pincode!
        cell.phoneNumber.text = data.mobile_number
        
        cell.deleteAddress.tag = indexPath.row
        cell.deleteAddress.addTarget(self, action: #selector(deleteButtonClicked(sender:)), for: .touchUpInside)
        
        cell.editAddress.tag = indexPath.row
        cell.editAddress.addTarget(self, action: #selector(editButtonClicked(sender:)), for: .touchUpInside)
  
        cell.radioButton.tag = indexPath.row
        cell.radioButton.addTarget(self, action: #selector(radioButtonClicked(sender:)), for: .touchUpInside)
        
        if data.address_mode == "1"{
            
            cell.radioButImage.isHidden = true
            cell.tickRadioButtonImage.isHidden = false
        }
        
           return cell
    }
    
    @objc func deleteButtonClicked(sender: UIButton){
         let buttonClicked = sender.tag
         print(buttonClicked)
         let selectedIndex = Int(buttonClicked)
         let sel = self.idArr[selectedIndex]
         self.deleteAddressId = String(sel)
        
            interactor1?.fetchItems(request: DeleteAddressModel.Fetch.Request( user_id:GlobalVariables.shared.customer_id,address_id:self.deleteAddressId))
    }
    
    @objc func radioButtonClicked(sender: UIButton){
        
         let buttonClicked = sender.tag
         print(buttonClicked)
         let selectedIndex = Int(buttonClicked)
         let sel = self.idArr[selectedIndex]
         self.selectedDefaultAdressId = String(sel)
         let myIndexPath = NSIndexPath(row: sender.tag, section: 0)
        
         let cell = tableView.cellForRow(at: myIndexPath as IndexPath) as! AddressListTableViewCell
            cell.radioButImage.isHidden = true
            cell.tickRadioButtonImage.isHidden = false
        interactor3?.fetchItems(request: DefaultAddressModel.Fetch.Request( user_id:GlobalVariables.shared.customer_id,address_id:self.selectedDefaultAdressId))
    }
    
    @objc func editButtonClicked(sender: UIButton){

        print(sender.tag)
        let buttonClicked = sender.tag
        print(buttonClicked)
        let selectedIndex = Int(buttonClicked)
        let slectedFullName = self.full_name[selectedIndex]
        let slectedAddress_type = self.address_type[selectedIndex]
        let slectedAlternative_mobile_number = self.alternative_mobile_number[selectedIndex]
        let slectedcity = self.city[selectedIndex]
        let slectedemail_address = self.email_address[selectedIndex]
        let slectedhouse_no = self.house_no[selectedIndex]
        let slectedId = self.idArr[selectedIndex]
        let slectedLandmark = self.landmark[selectedIndex]
        let slectedState = self.state[selectedIndex]
        let slectedStreet = self.street[selectedIndex]
        let slectedPincode = self.pincode[selectedIndex]
        let slectedMobile_number = self.mobile_number[selectedIndex]
        
        self.slectedFullName = String(slectedFullName)
        self.slectedAddress_type = String(slectedAddress_type)
        self.slectedAlternative_mobile_number = String(slectedAlternative_mobile_number)
        self.slectedcity = String(slectedcity)
        self.slectedemail_address = String(slectedemail_address)
        self.slectedhouse_no = String(slectedhouse_no)
        self.slectedId = String(slectedId)
        self.slectedLandmark = String(slectedLandmark)
        self.slectedState = String(slectedState)
        self.slectedStreet = String(slectedStreet)
        self.slectedPincode = String(slectedPincode)
        self.slectedMobile_number = String(slectedMobile_number)
        
        self.performSegue(withIdentifier: "to_edit", sender: self)
            
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "to_edit")
        {
        let vc = segue.destination as! AddAddressViewController
            
            vc.slectedFullName = self.slectedFullName
            vc.slectedAddress_type = self.slectedAddress_type
            vc.slectedAlternative_mobile_number = self.slectedAlternative_mobile_number
            vc.slectedcity = self.slectedcity
            vc.slectedemail_address = self.slectedemail_address
            vc.slectedhouse_no = self.slectedhouse_no
            vc.slectedId = self.slectedId
            vc.slectedLandmark = self.slectedLandmark
            vc.slectedState = self.slectedState
            vc.slectedStreet = self.slectedStreet
            vc.slectedPincode = self.slectedPincode
            vc.slectedMobile_number = self.slectedMobile_number
            vc.dataFromList = self.dataTo_edit
        }
     }
}
