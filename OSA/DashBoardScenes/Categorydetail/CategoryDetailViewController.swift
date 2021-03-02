//
//  CategoryDetailViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 24/02/21.
//

import UIKit

class CategoryDetailViewController: UIViewController,CategoryDisplayLogic,UICollectionViewDelegate,UICollectionViewDataSource {
   
    @IBOutlet weak var allCategoryCollectionview: UICollectionView!
    @IBOutlet weak var searchBarView: UIView!
    
    var interactor1: CategoryBusinessLogic?
    var displayedCategoryData: [CategoryModel.Fetch.ViewModel.DisplayedCategoryData] = []
    var router: (NSObjectProtocol & CategoryRoutingLogic & CategoryDataPassing)?
    
    var id = String()
    var parent_id = String()
    var category_image = String()
    var category_desc = String()
    var category_name = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.callInteractor ()
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.navigationBar.shadowImage = UIImage()
        if let navigationbar = self.navigationController?.navigationBar {
            navigationbar.setGradientBackground(colors: [UIColor(red: 189.0/255.0, green: 6.0/255.0, blue: 33.0/255.0, alpha: 1.0), UIColor(red: 95.0/255.0, green: 3.0/255.0, blue: 17.0/255.0, alpha: 1.0)], startPoint: .left, endPoint: .right)
        }
    }
    
    override func viewDidLayoutSubviews(){

        searchBarView.layerGradient(startPoint: .left, endPoint: .right, colorArray: [UIColor(red: 189.0/255.0, green: 6.0/255.0, blue: 33.0/255.0, alpha: 1.0).cgColor, UIColor(red: 95.0/255.0, green: 3.0/255.0, blue: 17.0/255.0, alpha: 1.0).cgColor], type: .axial)
    }
    
    func callInteractor () {
        interactor1?.fetchItems(request: CategoryModel.Fetch.Request(user_id:"1"))
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
        let viewController1 = self
        let interactor1 = CategoryInteractor()
        let presenter1 = CategoryPresenter()
        let router = CategoryRouter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
        router.viewController = viewController1
        router.dataStore = interactor1
    }
    
    func successFetchedItems(viewModel: CategoryModel.Fetch.ViewModel) {
        displayedCategoryData = viewModel.displayedCategoryData
        print("123456")
        print(displayedCategoryData.count)
        self.allCategoryCollectionview.reloadData()
    }
    
    func errorFetchingItems(viewModel: CategoryModel.Fetch.ViewModel) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedCategoryData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = allCategoryCollectionview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryAllCollectionViewCell
            let categoryData = displayedCategoryData[indexPath.row]
            cell.CategoryImg.sd_setImage(with: URL(string: categoryData.category_image!), placeholderImage: UIImage(named: ""))
            cell.catLabel.text = categoryData.category_name
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let data = displayedCategoryData[indexPath.row]
        self.id = data.id!
        self.parent_id = data.parent_id!
        self.category_image = data.category_image!
        self.category_desc = data.category_desc!
        self.category_name = data.category_name!

        self.performSegue(withIdentifier: "to-Category", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "to-Category")
        {
            let vc = segue.destination as! CategorySelectViewController
            vc.id = id
            vc.parent_id = parent_id
            vc.category_image = category_image
            vc.category_desc = category_desc
            vc.category_name = category_name
        }
    }
 }
//var id : String?
//var parent_id : String?
//var category_image : String?
//var category_desc : String?
//var category_name : String?
