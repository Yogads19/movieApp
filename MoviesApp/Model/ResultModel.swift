//
//  ResultModel.swift
//  MoviesApp
//
//  Created by Abservetech on 27/09/22.
//

import Foundation
import SwiftyJSON


struct ResultModel {
    
    var title: String = String()
    var vote_average : Int = Int()
    var vote_count : Int = Int()
    var release_date : String = String()
    var overview : String = String()
    var original_language : String = String()
    var poster_path : String = String()
    var id : String = String()
    var media_type : String = String()
  
    init() { }
    
    init(json: JSON) {
        self.title = json["title"].string ?? String()
        self.vote_average = json["vote_average"].int ?? Int()
        self.release_date = json["release_date"].string ?? String()
        self.overview = json["overview"].string ?? String()
        self.original_language = json["original_language"].string ?? String()
        self.poster_path = json["poster_path"].string ?? String()
        self.id = json["id"].string ?? String()
        self.media_type = json["media_type"].string ?? String()
        self.vote_count = json["vote_count"].int ?? Int()
    }
    
}
