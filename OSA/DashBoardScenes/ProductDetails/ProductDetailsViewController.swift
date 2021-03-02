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

    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    
    var router: (NSObjectProtocol & ProductDetailsRoutingLogic & ProductDetailsDataPassing)?
    var product_id = String()
    var interactor: ProductDetailsBusinessLogic?
    
    override func viewDidLoad() {
        
        super.viewDidLoad() 
        print(product_id)
        self.productDetails()
        interactor?.fetchItems(request: ProductDetailsModel.Fetch.Request(product_id:self.product_id))
        // Do any additional setup after loading the view.
    }
     
    func productDetails () {
        
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
        print(viewModel.id!)
    }
    
    func errorFetchingItems(viewModel: ProductDetailsModel.Fetch.ViewModel) {
        
    }
}
//var id : String?
//var product_name : String?
//var sku_code: String?
//var product_cover_img : String?
//var prod_size_chart : String?
//var product_description: String?
//var prod_actual_price : String?
//var prod_mrp_price : String?
//var offer_percentage: String?
//var product_meta_title : String?
//var product_meta_desc : String?
//var stocks_left: String?
//var isError: Bool
//var message: String?
