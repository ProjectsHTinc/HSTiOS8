//
//  WishListViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 19/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import UIKit
import SDWebImage

protocol WishListDisplayLogic: class
{
    func successFetchedItems(viewModel: WishListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: WishListModel.Fetch.ViewModel)
}

class WishListViewController: UIViewController, WishListDisplayLogic,UICollectionViewDelegate,UICollectionViewDataSource {
   
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var wishListCollectionView: UICollectionView!
    
    var displayedWishListData: [WishListModel.Fetch.ViewModel.DisplayedWishListData] = []
    
    var interactor: WishListBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: WishListModel.Fetch.Request(user_id:"1"))
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
        let interactor = WishListInteractor()
        let presenter = WishListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    override func viewDidLayoutSubviews(){

        searchBarView.layerGradient(startPoint: .left, endPoint: .right, colorArray: [UIColor(red: 189.0/255.0, green: 6.0/255.0, blue: 33.0/255.0, alpha: 1.0).cgColor, UIColor(red: 95.0/255.0, green: 3.0/255.0, blue: 17.0/255.0, alpha: 1.0).cgColor], type: .axial)
    }
    
    func successFetchedItems(viewModel: WishListModel.Fetch.ViewModel) {
        
        displayedWishListData = viewModel.displayedWishListData
        self.wishListCollectionView.reloadData()
    }
    
    func errorFetchingItems(viewModel: WishListModel.Fetch.ViewModel) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedWishListData.count
        
    }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath:    IndexPath) -> UICollectionViewCell {
        let cell = wishListCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! WishListCollectionViewCell
        let bestSellingData = displayedWishListData[indexPath.row]
        _ = "% off"
        cell.wishImage.sd_setImage(with: URL(string: bestSellingData.product_cover_img!), placeholderImage: UIImage(named: ""))
        cell.productTitleLabel.text = bestSellingData.product_name
        cell.actualPricelabel.text = "₹\(bestSellingData.prod_actual_price!)"
        cell.discoutPricelabel.text = "₹\(bestSellingData.prod_mrp_price!)"
        
        return cell
    }
}

