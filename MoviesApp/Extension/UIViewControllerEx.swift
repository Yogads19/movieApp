//
//  UIViewControllerEx.swift
//  MoviesApp
//
//  Created by Abservetech on 26/09/22.
//

import UIKit

extension UIViewController {
    
    class var identifier: String {
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appstoryboard: AppStoryboard) -> Self {
        return appstoryboard.viewController(vc: self)
    }
    
}
