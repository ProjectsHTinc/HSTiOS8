//
//  NewArrivalViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 24/02/21.
//

import UIKit

class NewArrivalViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,NewArrivalsDisplayLogic, BestSellingDisplayLogic {
      
    @IBOutlet weak var newArrivalCollectionView: UICollectionView!
    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var searchBarView: UIView!
    
    var interactor3: NewArrivalsBusinessLogic?
    var interactor2: BestSellingBusinessLogic?
    var displayedNewArrivalsData: [NewArrivalsModel.Fetch.ViewModel.DisplayedNewArrivalsData] = []
    var displayedBestSellingData: [BestSellingModel.Fetch.ViewModel.DisplayedBestSellingData] = []
    
    var product_id = String()
    var fromDashboardData = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if fromDashboardData == "to_newArrival" {
            interactor2?.fetchItems(request: BestSellingModel.Fetch.Request(user_id:"1"))
        }
        else
        {
            interactor3?.fetchItems(request: NewArrivalsModel.Fetch.Request(user_id:"1"))
        }
        
        searchTextfield.setCorner(radius: 25)
    }
    
    override func viewDidLayoutSubviews() {

        searchBarView.layerGradient(startPoint: .left, endPoint: .right, colorArray: [UIColor(red: 189.0/255.0, green: 6.0/255.0, blue: 33.0/255.0, alpha: 1.0).cgColor, UIColor(red: 95.0/255.0, green: 3.0/255.0, blue: 17.0/255.0, alpha: 1.0).cgColor], type: .axial)
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
        let viewController3 = self
        let interactor3 = NewArrivalsInteractor()
        let presenter3 = NewArrivalsPresenter()
        viewController3.interactor3 = interactor3
        interactor3.presenter3 = presenter3
        presenter3.viewController3 = viewController3
        
        let viewController2 = self
        let interactor2 = BestSellingInteractor()
        let presenter2 = BestSellingPresenter()
        viewController2.interactor2 = interactor2
        interactor2.presenter2 = presenter2
        presenter2.viewController2 = viewController2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if fromDashboardData == "to_newArrival" {
            
            return displayedBestSellingData.count
            
        }
        else {
            return displayedNewArrivalsData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if fromDashboardData == "to_newArrival" {
        let cell = newArrivalCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewArrivalALlCollectionViewCell
        let newArrivaldata = displayedBestSellingData[indexPath.row]
        cell.newArrivalImage.sd_setImage(with: URL(string: newArrivaldata.product_cover_img!), placeholderImage: UIImage(named: ""))
        cell.productTitlelabel.text = newArrivaldata.product_name
        cell.MrpPriceLabel.text = "₹\(newArrivaldata.prod_actual_price!)"
        cell.actualPriceLabel.text = "₹\(newArrivaldata.prod_mrp_price!)"
            return cell
        }
        else {
            let cell = newArrivalCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewArrivalALlCollectionViewCell
            let newArrivaldata = displayedNewArrivalsData[indexPath.row]
            cell.newArrivalImage.sd_setImage(with: URL(string: newArrivaldata.product_cover_img!), placeholderImage: UIImage(named: ""))
            cell.productTitlelabel.text = newArrivaldata.product_name
            cell.MrpPriceLabel.text = "₹\(newArrivaldata.prod_actual_price!)"
            cell.actualPriceLabel.text = "₹\(newArrivaldata.prod_mrp_price!)"
            return cell
        }
          
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        if fromDashboardData == "to_newArrival" {
            
            let data = displayedBestSellingData[indexPath.row]
            self.product_id = data.id!
            self.performSegue(withIdentifier: "to_productDetails", sender: self)
        }
        else {
            let data = displayedNewArrivalsData[indexPath.row]
            self.product_id = data.id!
            self.performSegue(withIdentifier: "to_productDetails", sender: self)
        }
    }
    
    
    func successFetchedItems(viewModel: NewArrivalsModel.Fetch.ViewModel) {
        displayedNewArrivalsData = viewModel.displayedNewArrivalsData
        self.newArrivalCollectionView.reloadData()
    }
    
    func errorFetchingItems(viewModel: NewArrivalsModel.Fetch.ViewModel) {
        
    }
    
    func successFetchedItems(viewModel: BestSellingModel.Fetch.ViewModel) {
        displayedBestSellingData = viewModel.displayedBestSellingData
        self.newArrivalCollectionView.reloadData()
    }
    
    func errorFetchingItems(viewModel: BestSellingModel.Fetch.ViewModel) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "to_productDetails" {
        let vc = segue.destination as! ProductDetailsViewController
           vc.product_id = self.product_id
        }
    }
}
