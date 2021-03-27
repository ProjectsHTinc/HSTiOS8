//
//  NewArrivalViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 24/02/21.
//

import UIKit

class NewArrivalViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,NewArrivalsDisplayLogic {
      
    @IBOutlet weak var newArrivalCollectionView: UICollectionView!
    
    var interactor3: NewArrivalsBusinessLogic?
    var displayedNewArrivalsData: [NewArrivalsModel.Fetch.ViewModel.DisplayedNewArrivalsData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor3?.fetchItems(request: NewArrivalsModel.Fetch.Request(user_id:"1"))
       
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
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return displayedNewArrivalsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = newArrivalCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewArrivalALlCollectionViewCell
        let newArrivaldata = displayedNewArrivalsData[indexPath.row]
        cell.newArrivalImage.sd_setImage(with: URL(string: newArrivaldata.product_cover_img!), placeholderImage: UIImage(named: ""))
        cell.productTitlelabel.text = newArrivaldata.product_name
        cell.MrpPriceLabel.text = "₹\(newArrivaldata.prod_actual_price!)"
        cell.actualPriceLabel.text = "₹\(newArrivaldata.prod_mrp_price!)"
        
           return cell
    }
    
    
    func successFetchedItems(viewModel: NewArrivalsModel.Fetch.ViewModel) {
        displayedNewArrivalsData = viewModel.displayedNewArrivalsData
        self.newArrivalCollectionView.reloadData()
    }
    
    func errorFetchingItems(viewModel: NewArrivalsModel.Fetch.ViewModel) {
        
    }
    
   
}
