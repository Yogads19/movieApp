//
//  AppStoryboard.swift
//  MoviesApp
//
//  Created by Abservetech on 26/09/22.
//

import UIKit

enum AppStoryboard: String {
    
    case main = "Main"
 
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T: UIViewController>(vc: T.Type) -> T {
        let storyboardId = (vc as UIViewController.Type).identifier
        return  instance.instantiateViewController(identifier: storyboardId) as! T
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

