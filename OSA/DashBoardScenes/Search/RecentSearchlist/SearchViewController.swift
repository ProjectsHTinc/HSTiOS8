//
//  SearchViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 30/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import UIKit

protocol RecentSearchListDelegate
{
    func saveText(searchName : String)
}


protocol RecentSearchListDisplayLogic: class
{
    func successFetchedItems(viewModel: RecentSearchListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: RecentSearchListModel.Fetch.ViewModel)
}

class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, RecentSearchListDisplayLogic {
   
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: RecentSearchListBusinessLogic?
    var displayedRecentSearchListData: [RecentSearchListModel.Fetch.ViewModel.DisplayedRecentSearchListData] = []
   
    var delegate : RecentSearchListDelegate?
    var strSearchName : NSString!
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.fetchItems(request: RecentSearchListModel.Fetch.Request(user_id:"0"))
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
        let interactor = RecentSearchListInteractor()
        let presenter = RecentSearchListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
//    RecentSearchListDisplayLogic
    func successFetchedItems(viewModel: RecentSearchListModel.Fetch.ViewModel) {
        displayedRecentSearchListData = viewModel.displayedRecentSearchListData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: RecentSearchListModel.Fetch.ViewModel) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
           return displayedRecentSearchListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecentSearchListTableViewCell
        let data = displayedRecentSearchListData[indexPath.row]
        cell.searchNameLbl.text = data.search_text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
        selectedIndex = indexPath.row;
        let data = displayedRecentSearchListData[selectedIndex]
        self.strSearchName = String (data.search_text!) as NSString
        (delegate?.saveText(searchName:(strSearchName as NSString) as String))!
        self.dismiss(animated: true, completion: nil)
        
    }
}
//
//user_id,cat_id,sub_cat_id,min_price_range,max_price_range,product_size_id,product_colour_id
