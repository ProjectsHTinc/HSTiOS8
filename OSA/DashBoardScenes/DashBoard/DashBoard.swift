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

class DashBoard: UIViewController, DashBoardDisplayLogic,CategoryDisplayLogic,UICollectionViewDelegate,UICollectionViewDataSource {
           
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var index = 0
    var inForwardDirection = true
    var timer: Timer?
    var interactor: DashBoardBusinessLogic?
    var interactor1: CategoryBusinessLogic?
    
    var router: (NSObjectProtocol & DashBoardRoutingLogic & DashBoardDataPassing)?
    var displayedDashBoardData: [DashBoardModel.Fetch.ViewModel.DisplayedDashBoardData] = []
    var displayedCategoryData: [CategoryModel.Fetch.ViewModel.DisplayedCategoryData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sideMenuButton()
       
        if let navigationbar = self.navigationController?.navigationBar {
            navigationbar.setGradientBackground(colors: [UIColor(red: 189.0/255.0, green: 6.0/255.0, blue: 33.0/255.0, alpha: 1.0), UIColor(red: 95.0/255.0, green: 3.0/255.0, blue: 17.0/255.0, alpha: 1.0)], startPoint: .topLeft, endPoint: .bottomRight)
        }
        interactor?.fetchItems(request: DashBoardModel.Fetch.Request(user_id:"1"))
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
    
    func successFetchedItems(viewModel: DashBoardModel.Fetch.ViewModel) {
        displayedDashBoardData = viewModel.displayedDashBoardData
          print("123456")
        print(displayedDashBoardData.count)
        self.startTimer()
        self.bannerCollectionView.reloadData()
    }
    
    func errorFetchingItems(viewModel: DashBoardModel.Fetch.ViewModel) {
        
    }
    
    func successFetchedItems(viewModel: CategoryModel.Fetch.ViewModel) {
        displayedCategoryData = viewModel.displayedCategoryData
          print("123456")
        print(displayedCategoryData.count)
        self.categoryCollectionView.reloadData()
      
    }
    
    func errorFetchingItems(viewModel: CategoryModel.Fetch.ViewModel) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.bannerCollectionView
        {
            return displayedDashBoardData.count
        }
        else
        {
            return displayedCategoryData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.bannerCollectionView
        {
        let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DashBoardBannerCell
        let bannerImg = displayedDashBoardData[indexPath.row]
        
        cell.bannerImg.sd_setImage(with: URL(string: bannerImg.banner_image!), placeholderImage: UIImage(named: ""))
        return cell
        }
        
        else {
            let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCell
            let categoryData = displayedCategoryData[indexPath.row]
            
            cell.CategoryImg.sd_setImage(with: URL(string: categoryData.category_image!), placeholderImage: UIImage(named: ""))
            cell.catLabel.text = categoryData.category_name
            return cell
        }
    }
        
    @objc public override func sideMenuButtonClick(){
        
        self.performSegue(withIdentifier: "to_sideMenu", sender: self)
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
