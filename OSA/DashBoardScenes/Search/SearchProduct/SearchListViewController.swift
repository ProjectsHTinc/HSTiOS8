//
//  SearchListViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 31/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import UIKit

protocol SearchListDisplayLogic: class
{
    func successFetchedItems(viewModel: SearchListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: SearchListModel.Fetch.ViewModel)
}


class SearchListViewController: UIViewController,SearchListDisplayLogic,UICollectionViewDelegate,UICollectionViewDataSource{

    @IBOutlet weak var searchListCollectionViewCell: UICollectionView!
    
    var searchText = String()
    var fromSearchText = String()
    var interactor2: SearchListBusinessLogic?
    var displayedSearchListData: [SearchListModel.Fetch.ViewModel.DisplayedSearchListData] = []
    var idArr = [String]()
    var product_id = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor2?.fetchItems(request: SearchListModel.Fetch.Request(user_id:"1",search_name:self.searchText))
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
        
        let viewController2 = self
        let interactor2 = SearchListInteractor()
        let presenter2 = SearchListPresenter()
        viewController2.interactor2 = interactor2
        interactor2.presenter2 = presenter2
        presenter2.viewController2 = viewController2
    }
    
    func successFetchedItems(viewModel: SearchListModel.Fetch.ViewModel) {
        displayedSearchListData = viewModel.displayedSearchListData
        print(displayedSearchListData.count)
        self.searchListCollectionViewCell.reloadData()
    }
    
    func errorFetchingItems(viewModel: SearchListModel.Fetch.ViewModel) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return displayedSearchListData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = searchListCollectionViewCell.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SearchListCollectionViewCell
            let data = displayedSearchListData[indexPath.row]
            cell.productTitlelabel.text = data.product_name
            cell.MrpPriceLabel.text = "₹\(data.prod_mrp_price!)"
            cell.categoryImage.sd_setImage(with: URL(string: data.product_cover_img!), placeholderImage: UIImage(named: ""))
        
        if data.review_average == "1"{
            
            cell.image1.image = UIImage(named:"star (3)")
            cell.image2.image = UIImage(named:"star (3)-1")
            cell.image3.image = UIImage(named:"star (3)-1")
            cell.image4.image = UIImage(named:"star (3)-1")
            cell.image5.image = UIImage(named:"star (3)-1")
        }
        else if data.review_average == "2"{
            
            cell.image1.image = UIImage(named:"star (3)")
            cell.image2.image = UIImage(named:"star (3)")
            cell.image3.image = UIImage(named:"star (3)-1")
            cell.image4.image = UIImage(named:"star (3)-1")
            cell.image5.image = UIImage(named:"star (3)-1")
        }
        else if data.review_average == "3"{
            
            cell.image1.image = UIImage(named:"star (3)")
            cell.image2.image = UIImage(named:"star (3)")
            cell.image3.image = UIImage(named:"star (3)")
            cell.image4.image = UIImage(named:"star (3)-1")
            cell.image5.image = UIImage(named:"star (3)-1")
        }
        else if data.review_average == "4"{
            
            cell.image1.image = UIImage(named:"star (3)")
            cell.image2.image = UIImage(named:"star (3)")
            cell.image3.image = UIImage(named:"star (3)")
            cell.image4.image = UIImage(named:"star (3)")
            cell.image5.image = UIImage(named:"star (3)-1")
        }
        else if data.review_average == "5"{
            
            cell.image1.image = UIImage(named:"star (3)")
            cell.image2.image = UIImage(named:"star (3)")
            cell.image3.image = UIImage(named:"star (3)")
            cell.image4.image = UIImage(named:"star (3)")
            cell.image5.image = UIImage(named:"star (3)")
        }
        
              return cell
        }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
            let data = displayedSearchListData[indexPath.row]
            self.product_id = data.id!
            self.performSegue(withIdentifier: "to_productDeatails", sender: self)
    }

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if (segue.identifier == "to_productDeatails")
         {
         let vc = segue.destination as! ProductDetailsViewController
            vc.product_id = self.product_id
     }
   }
}
