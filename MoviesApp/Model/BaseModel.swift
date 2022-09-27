//
//  BaseModel.swift
//  MoviesApp
//
//  Created by Abservetech on 26/09/22.
//

import Foundation
import SwiftyJSON

struct BaseModel: BaseSwiftyJSON {
    
    var message: String = String()
    var moviesList : [ResultModel] = [ResultModel]()
    
    
    init() { }
    
    init(json: JSON) {
        self.message = json["message"].string ?? String()
        let moviesArray = json["results"].array
        let moviesList = moviesArray?.compactMap({ (jsonVal) -> ResultModel? in
            return ResultModel.init(json: jsonVal)
        })
        self.moviesList = moviesList ?? [ResultModel]()
    }
    
}


struct Errormodel: Error {
    var messsage : String = String()
    var statusCode : Int = Int()
    
    init() {}
    init(json: JSON) {
        messsage = json["message"].string ?? String()
    }
}
