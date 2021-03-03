//
//  ProductDetailsViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 27/02/21.
//

import UIKit
import SDWebImage
import GMStepper

protocol ProductDetailsDisplayLogic: class
{
    func successFetchedItems(viewModel: ProductDetailsModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ProductDetailsModel.Fetch.ViewModel)
}

protocol ProductSizeDisplayLogic: class
{
    func successFetchedItems(viewModel: ProductSizeModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ProductSizeModel.Fetch.ViewModel)
}

protocol ProductColourDisplayLogic: class
{
    func successFetchedItems(viewModel: ProductColourModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ProductColourModel.Fetch.ViewModel)
}

class ProductDetailsViewController: UIViewController, ProductSizeDisplayLogic, ProductDetailsDisplayLogic,ProductColourDisplayLogic {
     
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productSizeCollectionView: UICollectionView!
    @IBOutlet weak var productColourCollectionView: UICollectionView!
    @IBOutlet weak var stepper: GMStepper!
    @IBOutlet weak var productPriceMrpLbl: UILabel!
    @IBOutlet weak var productDetailLbl: UILabel!
    
    var router: (NSObjectProtocol & ProductDetailsRoutingLogic & ProductDetailsDataPassing)?
    var product_id = String()
    var interactor: ProductDetailsBusinessLogic?
    var interactor1: ProductSizeBusinessLogic?
    var interactor2: ProductColourBusinessLogic?
    
    var displayedProductSizeData: [ProductSizeModel.Fetch.ViewModel.DisplayedProductSizeData] = []
    var displayedProductColourData: [ProductColourModel.Fetch.ViewModel.DisplayedProductColourData] = []
    
    var sizeIdArr = [String]()
    var selectedsizeId = String()
    var colourIdArr = [String]()
    var selectedcolourId = String()
    
    override func viewDidLoad() {
        
        super.viewDidLoad() 
        print(product_id)
        
        interactor?.fetchItems(request: ProductDetailsModel.Fetch.Request(product_id:product_id))
        interactor1?.fetchItems(request: ProductSizeModel.Fetch.Request(product_id:product_id))
        stepper.addTarget(self, action: #selector(ProductDetailsViewController.stepperValueChanged), for: .valueChanged)
        // Do any additional setup after loading the view.
    }
    
    @objc func stepperValueChanged(stepper: GMStepper) {
//        print(stepper.value, terminator: "")
        let quantity = stepper.value
        print(quantity)
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
 
        let viewController1 = self
        let interactor1 = ProductSizeInteractor()
        let presenter1 = ProductSizePresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
        
        let viewController2 = self
        let interactor2 = ProductColourInteractor()
        let presenter2 = ProductColourPresenter()
        viewController2.interactor2 = interactor2
        interactor2.presenter2 = presenter2
        presenter2.viewController2 = viewController2
       
    }
    
//    productDetails
    func successFetchedItems(viewModel: ProductDetailsModel.Fetch.ViewModel) {
        print(viewModel.id!)
        self.productImage.sd_setImage(with: URL(string:viewModel.product_cover_img!), placeholderImage: UIImage(named: ""))
        productName.text = viewModel.product_name
        productPriceMrpLbl.text = "₹\(viewModel.prod_mrp_price!)"
        productDetailLbl.text = viewModel.product_description
        
    }
    
    func errorFetchingItems(viewModel: ProductDetailsModel.Fetch.ViewModel) {
        
    }
    
//    Product Size
    func successFetchedItems(viewModel: ProductSizeModel.Fetch.ViewModel) {
        displayedProductSizeData = viewModel.displayedProductSizeData
        
        self.sizeIdArr.removeAll()
        
        for items in displayedProductSizeData{
        let id = items.id
        
        self.sizeIdArr.append(id!)
            
        self.productSizeCollectionView.reloadData()
            
        }
    }
    
    func errorFetchingItems(viewModel: ProductSizeModel.Fetch.ViewModel) {
        
    }
    
//    Product Colour
    func successFetchedItems(viewModel: ProductColourModel.Fetch.ViewModel) {
        displayedProductColourData = viewModel.displayedProductColourData
        self.productColourCollectionView.reloadData()
        self.colourIdArr.removeAll()
        self.selectedcolourId.removeAll()
        for items in displayedProductColourData{
        let id = items.id
        self.colourIdArr.append(id!)
        self.productColourCollectionView.reloadData()
        }
    }
    
    func errorFetchingItems(viewModel: ProductColourModel.Fetch.ViewModel) {
        
    }
}

extension ProductDetailsViewController :  UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.productSizeCollectionView
        {
        return displayedProductSizeData.count
        }
        else
        {
        return displayedProductColourData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.productSizeCollectionView
        {
        let cell = productSizeCollectionView.dequeueReusableCell(withReuseIdentifier: "sizeCell", for: indexPath) as! ProductSizeCollectionViewCell
        let data = displayedProductSizeData[indexPath.row]
        
            cell.sizeLbl.text = data.size
            
            if(cell.isSelected)
            {
               cell.backgroundColor = UIColor.red
            }
            else
            {
               cell.backgroundColor = UIColor.clear
            }
        return cell
        }
        
        else {
            let cell = productColourCollectionView.dequeueReusableCell(withReuseIdentifier: "colourCell", for: indexPath) as! ProductColourCollectionViewCell
            let data = displayedProductColourData[indexPath.row]
            
            cell.backgroundColor = UIColor(hexString: data.color_code!)
           
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.productSizeCollectionView
        {
        print("You selected cell #\(indexPath.item)!")
        let selectedIndex = Int(indexPath.item)
        let sel = self.sizeIdArr[selectedIndex]
        self.selectedsizeId = String (sel)
        print(selectedsizeId)

        interactor2?.fetchItems(request: ProductColourModel.Fetch.Request(product_id:product_id,size_id:selectedsizeId))
        }
        else {
            print("You selected cell #\(indexPath.item)!")
            let selectedIndex = Int(indexPath.item)
            let sel = self.colourIdArr[selectedIndex]
            self.selectedcolourId = String (sel)
            print(selectedcolourId)

        }
    }
}
