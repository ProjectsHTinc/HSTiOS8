//
//  FilterViewController.swift
//  OSA
//
//  Created by Happy Sanz Tech on 31/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import UIKit
import MultiSlider

protocol ListFilterDisplayLogic: class
{
    func successFetchedItems(viewModel: ListFilterModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ListFilterModel.Fetch.ViewModel)
}

protocol SizeListDisplayLogic: class
{
    func successFetchedItems(viewModel: SizeListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: SizeListModel.Fetch.ViewModel)
}
protocol ColourListDisplayLogic: class
{
    func successFetchedItems(viewModel: ColourListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ColourListModel.Fetch.ViewModel)
}

protocol ResultFilterDisplayLogic: class
{
    func successFetchedItems(viewModel: ResultFilterModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ResultFilterModel.Fetch.ViewModel)
}

class FilterViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,CategorySelectDisplayLogic, ListFilterDisplayLogic, SizeListDisplayLogic, ColourListDisplayLogic, ResultFilterDisplayLogic {
   

    @IBOutlet weak var subCategoryCollectionView: UICollectionView!
    @IBOutlet weak var sizeCollectionViewCell: UICollectionView!
    @IBOutlet weak var colourCollectionView: UICollectionView!
    
    
    var interactor: CategorySelectBusinessLogic?
    var interactor1: ListFilterBusinessLogic?
    var interactor2: SizeListBusinessLogic?
    var interactor3: ColourListBusinessLogic?
    var interactor4: ResultFilterBusinessLogic?
    
    var displayedCategorySelectData: [CategorySelectModel.Fetch.ViewModel.DisplayedCategorySelectData] = []
    var displayedSizeListData: [SizeListModel.Fetch.ViewModel.DisplayedSizeListData] = []
    var displayedColourListData: [ColourListModel.Fetch.ViewModel.DisplayedColourListData] = []
    var displayedListFilterData: [ListFilterModel.Fetch.ViewModel.DisplayedListFilterData] = []
    var displayedResultFilterData: [ResultFilterModel.Fetch.ViewModel.DisplayedResultFilterData] = []
    
    var id = String()
    var idArr = [String]()
    var categoryArr = [String]()
    var selectedIndex = Int ()
    var selectedCatId = String()
    
    var sizeIdArr = [String]()
    var selectedsizeId = String()
    var colourIdArr = [String]()
    var selectedcolourId = String()
    var colourCodeArr = [String]()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.fetchItems(request: CategorySelectModel.Fetch.Request(cat_id:id))
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
        let interactor = CategorySelectInteractor()
        let presenter = CategorySelectPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        let viewController1 = self
        let interactor1 = ListFilterInteractor()
        let presenter1 = ListFilterPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
        
        let viewController2 = self
        let interactor2 = SizeListInteractor()
        let presenter2 = SizeListPresenter()
        viewController2.interactor2 = interactor2
        interactor2.presenter2 = presenter2
        presenter2.viewController2 = viewController2
        
        let viewController3 = self
        let interactor3 = ColourListInteractor()
        let presenter3 = ColourListPresenter()
        viewController3.interactor3 = interactor3
        interactor3.presenter3 = presenter3
        presenter3.viewController3 = viewController3
        
        let viewController4 = self
        let interactor4 = ResultFilterInteractor()
        let presenter4 = ResultFilterPresenter()
        viewController4.interactor4 = interactor4
        interactor4.presenter4 = presenter4
        presenter4.viewController4 = viewController4
        
    }
    
    @IBAction func resultAction(_ sender: Any) {
        
    }
    
    func successFetchedItems(viewModel: CategorySelectModel.Fetch.ViewModel) {
        
        displayedCategorySelectData = viewModel.displayedCategorySelectData
        print(displayedCategorySelectData.count)
        self.categoryArr.removeAll()
        self.idArr.removeAll()
        for items in displayedCategorySelectData{
        let id = items.id
        let categoryName = items.category_name
            
        self.idArr.append(id!)
        self.categoryArr.append(categoryName!.capitalized)
        }
        
        self.categoryArr.insert("ALL", at: 0)
        self.idArr.insert("ALL", at: 0)
            
//        self.selectedCategoryId = String (self.idArr[0])
        self.subCategoryCollectionView.reloadData()
        print(idArr)
        print(categoryArr)
    }
    
    func errorFetchingItems(viewModel: CategorySelectModel.Fetch.ViewModel) {
        
    }
    
//
    func successFetchedItems(viewModel: ListFilterModel.Fetch.ViewModel) {
       
    }
    
    func errorFetchingItems(viewModel: ListFilterModel.Fetch.ViewModel) {
       
    }
    
    
//    Size DisplayLogic
    func successFetchedItems(viewModel: SizeListModel.Fetch.ViewModel) {
        displayedSizeListData = viewModel.displayedSizeListData
        
        self.sizeIdArr.removeAll()
        
        for items in displayedSizeListData{
        let id = items.mas_size_id
        
        self.sizeIdArr.append(id!)
        self.sizeCollectionViewCell.reloadData()
        }
    }
    
    func errorFetchingItems(viewModel: SizeListModel.Fetch.ViewModel) {
        
    }
    
//    Colour DisplayLogic
    func successFetchedItems(viewModel: ColourListModel.Fetch.ViewModel) {
        
        displayedColourListData = viewModel.displayedColourListData

        self.colourIdArr.removeAll()
        self.selectedcolourId.removeAll()
        self.colourCodeArr.removeAll()
        for items in displayedColourListData{
        let id = items.mas_color_id
        let colourCode = items.attribute_value
        self.colourIdArr.append(id!)
        self.colourCodeArr.append(colourCode!)
        }
        self.colourCollectionView.reloadData()
        
    }
    
    func errorFetchingItems(viewModel: ColourListModel.Fetch.ViewModel) {
        
    }
    
//    
    func successFetchedItems(viewModel: ResultFilterModel.Fetch.ViewModel) {
        
    }
    
    func errorFetchingItems(viewModel: ResultFilterModel.Fetch.ViewModel) {
        
    }
}

extension FilterViewController {
    
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return displayedCategorySelectData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == subCategoryCollectionView {
            
        let cell = subCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SelectCategorySegmentCell
//        let catTitle = displayedCategorySelectData[indexPath.row]
            cell.catLabel.text = categoryArr[indexPath.row]

                if selectedIndex == indexPath.row
                {
                    cell.contentView.backgroundColor = UIColor(red: 114.0/255.0, green: 3.0/255.0, blue: 25.0/255.0, alpha: 1.0)
                    cell.catLabel.textColor = UIColor.white
                }
                else
                {
                    cell.contentView.backgroundColor = UIColor(red: 244.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, alpha: 1.0)
                    cell.catLabel.textColor = UIColor.black
                }
          return cell
        }
        
        else if collectionView == sizeCollectionViewCell{
            
            let cell = sizeCollectionViewCell.dequeueReusableCell(withReuseIdentifier: "sizeCell", for: indexPath) as! SizeFilterCollectionViewCell
            let data = displayedSizeListData[indexPath.row]
            
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
            
            let cell = colourCollectionView.dequeueReusableCell(withReuseIdentifier: "colourCell", for: indexPath) as! ProductColourCollectionViewCell
            _ = displayedColourListData[indexPath.row]
            let colourCode = colourCodeArr[indexPath.row]
            cell.backgroundColor = UIColor(hexString: colourCode)
            return cell
            
           }
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
        selectedIndex = indexPath.row
        self.subCategoryCollectionView.reloadData()
        print("You selected cell #\(indexPath.item)!")
        let selectedIndex = Int(indexPath.item)
        let sel = self.idArr[selectedIndex]
        self.selectedCatId = sel
        print(selectedCatId)
        interactor1?.fetchItems(request: ListFilterModel.Fetch.Request(user_id:GlobalVariables.shared.customer_id, cat_id:id,sub_cat_id:selectedCatId))
        interactor3?.fetchItems(request: ColourListModel.Fetch.Request(user_id:GlobalVariables.shared.customer_id, cat_id:id,sub_cat_id:selectedCatId))
        interactor2?.fetchItems(request: SizeListModel.Fetch.Request(user_id:GlobalVariables.shared.customer_id, cat_id:id,sub_cat_id:selectedCatId))
    }
}
