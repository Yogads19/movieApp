//
//  ShowAlert.swift
//  MoviesApp
//
//  Created by Abservetech on 27/09/22.
//

import Foundation
import Toaster


class ShowAlert {
    
    static let instance = ShowAlert()
    
    private init() { }
    
    func showToast(msg: String){
        Toast(text: msg, delay: 0.1, duration: Delay.short).show()
    }
    
}

