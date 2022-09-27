//
//  MoviesListVm.swift
//  MoviesApp
//
//  Created by Abservetech on 27/09/22.
//

import Foundation


class MoviesListVm {
    
    var successHandler: ((BaseModel) -> ())?
    var errorHandler: ((String) -> ())?
    
}
extension MoviesListVm {
    func moviesList() {
        var resource = Resource<BaseModel>(url: HttpNetworkRoute.Auth.MoviesList)
        resource.httpMethod = .get
        ApiClient.sharedInstance.sendRequest(withResource: resource) { result in
            switch result {
            case .success(let baseModel):
                self.successHandler?(baseModel)
            case .failure(let error):
                self.errorHandler?(error.messsage)
            }
        }
    }
}
