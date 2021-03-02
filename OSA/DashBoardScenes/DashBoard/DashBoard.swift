//
//  DashBoard.swift
//  OSA
//
//  Created by Happy Sanz Tech on 11/02/21.
//

import UIKit
import SideMenu
import SDWebImage

protocol DashBoardDisplayLogic: class
{
    func successFetchedItems(viewModel: DashBoardModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: DashBoardModel.Fetch.ViewModel)
}
protocol CategoryDisplayLogic: class
{
    func successFetchedItems(viewModel: CategoryModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: CategoryModel.Fetch.ViewModel)
}
protocol BestSellingDisplayLogic: class
{
    func successFetchedItems(viewModel: BestSellingModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: BestSellingModel.Fetch.ViewModel)
}
protocol NewArrivalsDisplayLogic: class
{
    func successFetchedItems(viewModel: NewArrivalsModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: NewArrivalsModel.Fetch.ViewModel)
}
protocol AdvertisementDisplayLogic: class
{
    func successFetchedItems(viewModel: AdvertisementModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: AdvertisementModel.Fetch.ViewModel)
}

class DashBoard: UIViewController, DashBoardDisplayLogic,CategoryDisplayLogic,BestSellingDisplayLogic,NewArrivalsDisplayLogic,AdvertisementDisplayLogic,UICollectionViewDelegate,UICollectionViewDataSource {
                 
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var bestSellingCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var advertisementTableView: UITableView!
    @IBOutlet weak var searchBarView: UIView!
    
    var index = 0
    var inForwardDirection = true
    var timer: Timer?
    var interactor: DashBoardBusinessLogic?
    var interactor1: CategoryBusinessLogic?
    var interactor2: BestSellingBusinessLogic?
    var interactor3: NewArrivalsBusinessLogic?
    var interactor4: AdvertisementBusinessLogic?
    
    var router: (NSObjectProtocol & DashBoardRoutingLogic & DashBoardDataPassing)?
    var displayedDashBoardData: [DashBoardModel.Fetch.ViewModel.DisplayedDashBoardData] = []
    var displayedCategoryData: [CategoryModel.Fetch.ViewModel.DisplayedCategoryData] = []
    var displayedBestSellingData: [BestSellingModel.Fetch.ViewModel.DisplayedBestSellingData] = []
    var displayedNewArrivalsData: [NewArrivalsModel.Fetch.ViewModel.DisplayedNewArrivalsData] = []
    var displayedAdvertisementData: [AdvertisementModel.Fetch.ViewModel.DisplayedAdvertisementData] = []
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        self.sideMenuButton()
       
        if let navigationbar = self.navigationController?.navigationBar {
            navigationbar.setGradientBackground(colors: [UIColor(red: 189.0/255.0, green: 6.0/255.0, blue: 33.0/255.0, alpha: 1.0), UIColor(red: 95.0/255.0, green: 3.0/255.0, blue: 17.0/255.0, alpha: 1.0)], startPoint: .left, endPoint: .right)
        }
        interactor?.fetchItems(request: DashBoardModel.Fetch.Request(user_id:"1"))
        interactor1?.fetchItems(request: CategoryModel.Fetch.Request(user_id:"1"))
        interactor2?.fetchItems(request: BestSellingModel.Fetch.Request(user_id:"1"))
        interactor3?.fetchItems(request: NewArrivalsModel.Fetch.Request(user_id:"1"))
        interactor4?.fetchItems(request: AdvertisementModel.Fetch.Request(user_id:"1"))
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    override func viewDidLayoutSubviews(){

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
        let viewController = self
        let interactor = DashBoardInteractor()
        let presenter = DashBoardPresenter()
        let router = DashBoardRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        let viewController1 = self
        let interactor1 = CategoryInteractor()
        let presenter1 = CategoryPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
        
        let viewController2 = self
        let interactor2 = BestSellingInteractor()
        let presenter2 = BestSellingPresenter()
        viewController2.interactor2 = interactor2
        interactor2.presenter2 = presenter2
        presenter2.viewController2 = viewController2
        
        let viewController3 = self
        let interactor3 = NewArrivalsInteractor()
        let presenter3 = NewArrivalsPresenter()
        viewController3.interactor3 = interactor3
        interactor3.presenter3 = presenter3
        presenter3.viewController3 = viewController3
        
        let viewController4 = self
        let interactor4 = AdvertisementInteractor()
        let presenter4 = AdvertisementPresenter()
        viewController4.interactor4 = interactor4
        interactor4.presenter4 = presenter4
        presenter4.viewController4 = viewController4
    }
    
    private func setupSideMenu() {
        // Define the menus
        SideMenuManager.default.leftMenuNavigationController = storyboard?.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? SideMenuNavigationController
        
        SideMenuManager.default.addPanGestureToPresent(toView: navigationController!.navigationBar)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: view)
    }
    
    func makeSettings() -> SideMenuSettings{
        var settings = SideMenuSettings()
        settings.allowPushOfSameClassTwice = false
        settings.presentationStyle = .viewSlideOut
        settings.presentationStyle.backgroundColor = .black
        settings.presentationStyle.presentingEndAlpha = 0.5
        settings.statusBarEndAlpha = 0
        return settings
    }
    
//    Banner Display Logic
    func successFetchedItems(viewModel: DashBoardModel.Fetch.ViewModel) {
        displayedDashBoardData = viewModel.displayedDashBoardData
          print("123456")
        print(displayedDashBoardData.count)
        if displayedDashBoardData.count > 1 {
            self.startTimer()
        }
        self.bannerCollectionView.reloadData()
    }
    
    func errorFetchingItems(viewModel: DashBoardModel.Fetch.ViewModel) {
        
    }
    
//    Category DispayLogic
    func successFetchedItems(viewModel: CategoryModel.Fetch.ViewModel) {
        displayedCategoryData = viewModel.displayedCategoryData
          print("123456")
        print(displayedCategoryData.count)
        self.categoryCollectionView.reloadData()
    }
    
    func errorFetchingItems(viewModel: CategoryModel.Fetch.ViewModel) {
        
    }
    
//    Best Selling DisplayLogic
    func successFetchedItems(viewModel: BestSellingModel.Fetch.ViewModel) {
        displayedBestSellingData = viewModel.displayedBestSellingData  
          print("123456")
        print(displayedBestSellingData.count)
        self.bestSellingCollectionView.reloadData()
    }

    func errorFetchingItems(viewModel: BestSellingModel.Fetch.ViewModel) {
        
    }
//    New Arrivals DisplayLogic
    func successFetchedItems(viewModel: NewArrivalsModel.Fetch.ViewModel) {
        displayedNewArrivalsData = viewModel.displayedNewArrivalsData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: NewArrivalsModel.Fetch.ViewModel) {
        
    }
//    Advertisement DisplayLogic
    func successFetchedItems(viewModel: AdvertisementModel.Fetch.ViewModel) {
        displayedAdvertisementData = viewModel.displayedAdvertisementData
        self.advertisementTableView.reloadData()
        
    }
    
    func errorFetchingItems(viewModel: AdvertisementModel.Fetch.ViewModel) {
        
    }
     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.bannerCollectionView
        {
            return displayedDashBoardData.count
        }
        else if collectionView == self.categoryCollectionView
        {
            return displayedCategoryData.count
        }
        else
        {
            return displayedBestSellingData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.bannerCollectionView
        {
        let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DashBoardBannerCell
        let bannerImg = displayedDashBoardData[indexPath.row]
        
        cell.bannerImg.sd_setImage(with: URL(string: bannerImg.banner_image!), placeholderImage: UIImage(named: ""))
            cell.bannerTitle.text = bannerImg.banner_title
            cell.offerlabel.text = bannerImg.banner_desc
//          cell.bannerDescLabel.text = bannerImg.category_name
        return cell
        }

        else if collectionView == self.categoryCollectionView
        {
            let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCell
            let categoryData = displayedCategoryData[indexPath.row]
            
            cell.CategoryImg.sd_setImage(with: URL(string: categoryData.category_image!), placeholderImage: UIImage(named: ""))
            cell.catLabel.text = categoryData.category_name
            return cell
        }
        
        else
        {
            let cell = bestSellingCollectionView.dequeueReusableCell(withReuseIdentifier: "bestSellingCell", for: indexPath) as! BestSellingCollectionViewCell
            let bestSellingData = displayedBestSellingData[indexPath.row]
            let percentageText = "% off"
            cell.sellingImage.sd_setImage(with: URL(string: bestSellingData.product_cover_img!), placeholderImage: UIImage(named: ""))
            cell.productTitleLabel.text = bestSellingData.product_name
            cell.actualPricelabel.text = bestSellingData.prod_actual_price
            cell.discoutPricelabel.text = bestSellingData.prod_mrp_price
            cell.offerPercentageLabel.text = bestSellingData.offer_percentage!+percentageText
            return cell
        }
    }
        
    @objc public override func sideMenuButtonClick(){
        
        self.performSegue(withIdentifier: "to_sideMenu", sender: self)
    }
  
}

extension DashBoard : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView
        {
           return displayedNewArrivalsData.count
        }
        else
        {
           return displayedAdvertisementData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewArrivalsTableViewCell
        let newArrivaldata = displayedNewArrivalsData[indexPath.row]
        cell.newArrivalImage.sd_setImage(with: URL(string: newArrivaldata.product_cover_img!), placeholderImage: UIImage(named: ""))
        cell.productTitlelabel.text = newArrivaldata.product_name
        cell.MrpPriceLabel.text = newArrivaldata.prod_actual_price
        cell.actualPriceLabel.text = newArrivaldata.prod_mrp_price
        
           return cell
        }
        else
        {
        let cell = advertisementTableView.dequeueReusableCell(withIdentifier: "adsCell", for: indexPath) as! AdsTableViewCell
        let adsData = displayedAdvertisementData[indexPath.row]
        cell.adsImageView.sd_setImage(with: URL(string: adsData.ad_img!), placeholderImage: UIImage(named: ""))
           return cell
        }
    }
    
    func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 6.0, target: self, selector: #selector(scrollToNextCell), userInfo: nil, repeats: true);
        }
    }
    
    @objc func scrollToNextCell()
    {
        //scroll to next cell
        let items = bannerCollectionView.numberOfItems(inSection: 0)
        if (items - 1) == index {
            bannerCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: UICollectionView.ScrollPosition.right, animated: true)
        } else if index == 0 {
            bannerCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: UICollectionView.ScrollPosition.left, animated: true)
        } else {
            bannerCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
        }
        if inForwardDirection {
            if index == (items - 1) {
                index -= 1
                inForwardDirection = false
            } else {
                index += 1
            }
        } else {
            if index == 0 {
                index += 1
                inForwardDirection = true
            } else {
                index -= 1
            }
        }
    }
}

