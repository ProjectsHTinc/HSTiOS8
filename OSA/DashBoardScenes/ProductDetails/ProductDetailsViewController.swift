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
protocol RelatedProductDisplayLogic: class
{
    func successFetchedItems(viewModel: RelatedProductModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: RelatedProductModel.Fetch.ViewModel)
}
protocol ReviewListDisplayLogic: class
{
    func successFetchedItems(viewModel: ReviewListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ReviewListModel.Fetch.ViewModel)
}
protocol AddToCartDisplayLogic: class
{
    func successFetchedItems(viewModel: AddToCartModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: AddToCartModel.Fetch.ViewModel)
}
protocol CheckPincodeDisplayLogic: class
{
    func successFetchedItems(viewModel: CheckPincodeModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: CheckPincodeModel.Fetch.ViewModel)
}

class ProductDetailsViewController: UIViewController, ProductSizeDisplayLogic, ProductDetailsDisplayLogic,ProductColourDisplayLogic, RelatedProductDisplayLogic, ReviewListDisplayLogic, AddToCartDisplayLogic, CheckPincodeDisplayLogic {
 
       
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productSizeCollectionView: UICollectionView!
    @IBOutlet weak var productColourCollectionView: UICollectionView!
    @IBOutlet weak var relatedProductsCollectionView: UICollectionView!
    @IBOutlet weak var stepper: GMStepper!
    @IBOutlet weak var productPriceMrpLbl: UILabel!
    @IBOutlet weak var productDetailLbl: UILabel!
    @IBOutlet weak var reviewListTableView: UITableView!
    @IBOutlet weak var mrpPriceLbl: UILabel!
    @IBOutlet weak var pinCodeTextField: UITextField!
    @IBOutlet weak var pinCodeAvilableLbl: UILabel!
    @IBOutlet weak var QuantityAvailableLbl: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    
    var router: (NSObjectProtocol & ProductDetailsRoutingLogic & ProductDetailsDataPassing)?
    var product_id = String()
    var interactor: ProductDetailsBusinessLogic?
    var interactor1: ProductSizeBusinessLogic?
    var interactor2: ProductColourBusinessLogic?
    var interactor3: RelatedProductBusinessLogic?
    var interactor4: ReviewListBusinessLogic?
    var interactor5: AddToCartBusinessLogic?
    var interactor6: CheckPincodeBusinessLogic?
    
    var displayedProductSizeData: [ProductSizeModel.Fetch.ViewModel.DisplayedProductSizeData] = []
    var displayedProductColourData: [ProductColourModel.Fetch.ViewModel.DisplayedProductColourData] = []
    var displayedRelatedProductData: [RelatedProductModel.Fetch.ViewModel.DisplayedRelatedProductData] = []
    var displayedReviewListData: [ReviewListModel.Fetch.ViewModel.DisplayedReviewListData] = []
    
    var sizeIdArr = [String]()
    var selectedsizeId = String()
    var colourIdArr = [String]()
    var selectedcolourId = String()
    var colourCodeArr = [String]()
    var quantity = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(product_id)
        print("Karann\(GlobalVariables.shared.customer_id)")
        stepper.addTarget(self, action: #selector(ProductDetailsViewController.stepperValueChanged), for: .valueChanged)
        self.callInteractor()
        self.selectedcolourId = "0"
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    func callInteractor () {
        
        interactor?.fetchItems(request: ProductDetailsModel.Fetch.Request(product_id:product_id))
        interactor1?.fetchItems(request: ProductSizeModel.Fetch.Request(product_id:product_id))
        interactor3?.fetchItems(request: RelatedProductModel.Fetch.Request(product_id:product_id))
        interactor4?.fetchItems(request: ReviewListModel.Fetch.Request(product_id:product_id))
    }
    
    @objc func stepperValueChanged(stepper: GMStepper) {
        let Quantity = stepper.value
        self.quantity = String(Quantity)
        print(quantity)
    }

    @IBAction func addToCartAction(_ sender: Any) {
        
        let user_Id = UserDefaults.standard.object(forKey: UserDefaultsKey.customer_idkey.rawValue) ?? ""
        
        if user_Id as! String == ""
        {
            let alertController = UIAlertController(title: Globals.alertTitle, message: "Sign in to Continue", preferredStyle: .alert)

            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                UIAlertAction in
                NSLog("OK Pressed")
                self.navigateToLogin ()
                
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
                UIAlertAction in
                NSLog("Cancel Pressed")
            }

            // Add the actions
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)

            // Present the controller
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            GlobalVariables.shared.customer_id = UserDefaults.standard.object(forKey: UserDefaultsKey.customer_idkey.rawValue) as! String
            GlobalVariables.shared.phone_number = UserDefaults.standard.object(forKey: UserDefaultsKey.phone_numberKey.rawValue) as! String
            
            interactor5?.fetchItems(request: AddToCartModel.Fetch.Request(product_id:self.product_id,product_comb_id:self.selectedcolourId,quantity:self.quantity,user_id:GlobalVariables.shared.customer_id))
        }
    }
                                                                                       
    func navigateToLogin () {
        UIApplication.shared.keyWindow?.rootViewController = storyboard!.instantiateViewController(withIdentifier: "nav")
    }
    
    @IBAction func checkPincodeAction(_ sender: Any) {
        interactor6?.fetchItems(request: CheckPincodeModel.Fetch.Request(pin_code:self.pinCodeTextField.text))
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
        
        let viewController3 = self
        let interactor3 = RelatedProductInteractor()
        let presenter3 = RelatedProductPresenter()
        viewController3.interactor3 = interactor3
        interactor3.presenter3 = presenter3
        presenter3.viewController3 = viewController3
                
        let viewController4 = self
        let interactor4 = ReviewListInteractor()
        let presenter4 = ReviewListPresenter()
        viewController4.interactor4 = interactor4
        interactor4.presenter4 = presenter4
        presenter4.viewController4 = viewController4
        
        let viewController5 = self
        let interactor5 = AddToCartInteractor()
        let presenter5 = AddToCartPresenter()
        viewController5.interactor5 = interactor5
        interactor5.presenter5 = presenter5
        presenter5.viewController5 = viewController5
        
        let viewController6 = self
        let interactor6 = CheckPincodeInteractor()
        let presenter6 = CheckPincodePresenter()
        viewController6.interactor6 = interactor6
        interactor6.presenter6 = presenter6
        presenter6.viewController6 = viewController6
    }
    
//    productDetails
    func successFetchedItems(viewModel: ProductDetailsModel.Fetch.ViewModel) {
        print(viewModel.id!)
        self.productImage.sd_setImage(with: URL(string:viewModel.product_cover_img!), placeholderImage: UIImage(named: ""))
        productName.text = viewModel.product_name!
        productPriceMrpLbl.text = "₹\(viewModel.prod_mrp_price!)"
        productDetailLbl.text = viewModel.product_description!
        mrpPriceLbl.text = "₹\(viewModel.prod_mrp_price!)"
        print(viewModel.product_description!)
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
        self.colourCodeArr.removeAll()
        for items in displayedProductColourData{
        let id = items.id
        let colourCode = items.color_code
        self.colourIdArr.append(id!)
        self.colourCodeArr.append(colourCode!)
        self.productColourCollectionView.reloadData()
        }
    }
    
    func errorFetchingItems(viewModel: ProductColourModel.Fetch.ViewModel) {
        
    }
    
//    Related Products
    func successFetchedItems(viewModel: RelatedProductModel.Fetch.ViewModel) {
        displayedRelatedProductData = viewModel.displayedRelatedProductData
        self.relatedProductsCollectionView.reloadData()
    }
    
    func errorFetchingItems(viewModel: RelatedProductModel.Fetch.ViewModel) {
        
    }
    
//    Review List
    func successFetchedItems(viewModel: ReviewListModel.Fetch.ViewModel) {
        displayedReviewListData = viewModel.displayedReviewListData
        self.reviewListTableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: ReviewListModel.Fetch.ViewModel) {
        
    }

//    Add To Cart
    func successFetchedItems(viewModel: AddToCartModel.Fetch.ViewModel) {
        
        let alertController = UIAlertController(title: Globals.alertTitle, message: viewModel.msg, preferredStyle: .alert)
        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            NSLog("OK Pressed")
            self.navigateTocartList()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    func errorFetchingItems(viewModel: AddToCartModel.Fetch.ViewModel) {
     
    }
    
//   Check Pincode
    func successFetchedItems(viewModel: CheckPincodeModel.Fetch.ViewModel) {
        if viewModel.msg == "No Delivery for this Area"{
            pinCodeAvilableLbl.textColor = UIColor.red
            self.pinCodeAvilableLbl.text = "No Delivery for this Area"
        }
        else {
            pinCodeAvilableLbl.textColor = UIColor(red: 70.0/255.0, green: 171.0/255.0, blue: 98.0/255.0, alpha: 1.0)
            self.pinCodeAvilableLbl.text = "pin code area is deliverable"
        }
    }
    
    func errorFetchingItems(viewModel: CheckPincodeModel.Fetch.ViewModel) {
        
    }
    
    func navigateTocartList() {
        self.performSegue(withIdentifier: "to_cartList", sender: self)
    }
}
    

extension ProductDetailsViewController :  UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedReviewListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ReviewListTableViewCell
        let newArrivaldata = displayedReviewListData[indexPath.row]
//        cell.reviewerImage.sd_setImage(with: URL(string: newArrivaldata.product_cover_img!), placeholderImage: UIImage(named: ""))
        cell.reviewerName.text = newArrivaldata.customer_name
        cell.reviewText.text = newArrivaldata.comment
           return cell
    }
                                
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.productSizeCollectionView
        {
            return displayedProductSizeData.count
        }
        else if collectionView == self.productColourCollectionView
        {
            return displayedProductColourData.count
        }
        else
        {
            return displayedRelatedProductData.count
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
        
        else  if collectionView == self.productColourCollectionView {
            let cell = productColourCollectionView.dequeueReusableCell(withReuseIdentifier: "colourCell", for: indexPath) as! ProductColourCollectionViewCell
            _ = displayedProductColourData[indexPath.row]
            let colourCode = colourCodeArr[indexPath.row]
            cell.backgroundColor = UIColor(hexString: colourCode)
            return cell
        }
        
        else {
            let cell = relatedProductsCollectionView.dequeueReusableCell(withReuseIdentifier: "relatedCell", for: indexPath) as! RelatedProductsCollectionViewCell
            let data = displayedRelatedProductData[indexPath.row]
            cell.productTitlelabel.text = data.product_name
            cell.MrpPriceLabel.text = data.prod_mrp_price
            cell.productImage.sd_setImage(with: URL(string: data.product_cover_img!), placeholderImage: UIImage(named: ""))
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
        
        else if collectionView == self.productColourCollectionView{
            print("You selected cell #\(indexPath.item)!")
            let selectedIndex = Int(indexPath.item)
            let sel = self.colourIdArr[selectedIndex]
            self.selectedcolourId = String (sel)
            print(selectedcolourId)
        }
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "to_cartList")
        {
            _ = segue.destination as! CartListViewController
            
        }
    }
}
