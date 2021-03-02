//
//  ProductDetailsRouter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 27/02/21.
//

import Foundation
import UIKit

@objc protocol ProductDetailsRoutingLogic
{
  func navigateTocategorySelect(segue: UIStoryboardSegue?)
}

protocol ProductDetailsDataPassing
{
  var dataStore: ProductDetailsDataStore? { get }
}

class ProductDetailsRouter: NSObject, ProductDetailsRoutingLogic, ProductDetailsDataPassing
{
    func navigateTocategorySelect(segue: UIStoryboardSegue?) {
        if let segue = segue {
          let destinationVC = segue.destination as! CategorySelectViewController
            navigateTocategorySelect(source: viewController!, destination: destinationVC)
            
        } else {
            _ = viewController?.storyboard?.instantiateViewController(withIdentifier: "to-Category") as! CategorySelectViewController
        }
    }
    func fetchItems(request: ProductDetailsModel.Fetch.Request) {
        
    }
    
  weak var viewController: ProductDetailsViewController?
  var dataStore: ProductDetailsDataStore?
  
  // MARK: Routing
  
    func navigateTocategorySelect(source: ProductDetailsViewController, destination: CategorySelectViewController)
    {
        source.navigationController?.pushViewController(source, animated: true)
    }
}
