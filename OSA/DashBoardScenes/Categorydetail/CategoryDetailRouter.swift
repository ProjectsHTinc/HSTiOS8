//
//  CategoryDetailRouter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 25/02/21.
//
import Foundation
import UIKit

@objc protocol CategoryRoutingLogic
{
  func navigateTocategorySelect(segue: UIStoryboardSegue?)
}

protocol CategoryDataPassing
{
  var dataStore: CategoryDataStore? { get }
}

class CategoryRouter: NSObject, CategoryRoutingLogic, CategoryDataPassing
{
    func navigateTocategorySelect(segue: UIStoryboardSegue?) {
        if let segue = segue {
          let destinationVC = segue.destination as! CategorySelectViewController
            navigateTocategorySelect(source: viewController!, destination: destinationVC)
            
        } else {
            _ = viewController?.storyboard?.instantiateViewController(withIdentifier: "to-Category") as! CategorySelectViewController
        }
    }
    func fetchItems(request: CategoryModel.Fetch.Request) {
        
    }
    
  weak var viewController: CategoryDetailViewController?
  var dataStore:CategoryDataStore?
  
  // MARK: Routing
  
    func navigateTocategorySelect(source: CategoryDetailViewController, destination: CategorySelectViewController)
    {
        source.navigationController?.pushViewController(source, animated: true)
    }
}
