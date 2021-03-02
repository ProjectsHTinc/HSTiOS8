//
//  ProductDetailsViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 27/02/21.
//

import UIKit

protocol ProductDetailsDisplayLogic: class
{
    func successFetchedItems(viewModel: ProductDetailsModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ProductDetailsModel.Fetch.ViewModel)
}

class ProductDetailsViewController: UIViewController, ProductDetailsDisplayLogic {

    var router: (NSObjectProtocol & ProductDetailsRoutingLogic & ProductDetailsDataPassing)?
    var product_id = String()
    var interactor: ProductDetailsBusinessLogic?
 
    override func viewDidLoad() {
        super.viewDidLoad() 
        print(product_id)
        interactor?.fetchItems(request: ProductDetailsModel.Fetch.Request(product_id:self.product_id))
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
        let interactor = ProductDetailsInteractor()
        let presenter = ProductDetailsPresenter()
        let router = ProductDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    func successFetchedItems(viewModel: ProductDetailsModel.Fetch.ViewModel) {
        
    }
    
    func errorFetchingItems(viewModel: ProductDetailsModel.Fetch.ViewModel) {
        
    }
}
