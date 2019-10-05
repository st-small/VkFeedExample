//
//  NewsfeedRouter.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 10/5/19.
//  Copyright (c) 2019 Станислав Шияновский. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol NewsfeedRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol NewsfeedDataPassing
{
  var dataStore: NewsfeedDataStore? { get }
}

class NewsfeedRouter: NSObject, NewsfeedRoutingLogic, NewsfeedDataPassing
{
  weak var viewController: NewsfeedViewController?
  var dataStore: NewsfeedDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: NewsfeedViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: NewsfeedDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
