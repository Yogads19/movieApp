//
//  ApiClient.swift
//  MoviesApp
//
//  Created by Abservetech on 26/09/22.
//

import UIKit
import Alamofire
import SwiftyJSON



final class ApiClient {
    
    static let sharedInstance = ApiClient()
    private static let accessTokenHeader = "Authorization"
    private static let contentTypeHeader =  "Content-Type"
    
    //MARK: - API REQUEST :
    
    public func sendRequest<T>(withResource resource: Resource<T>, completionHandler: @escaping(Swift.Result<T, Errormodel>) -> Void) {
        if NetworkReachabilityManager()!.isReachable {
            var httpHeader: HTTPHeaders = [:]
            
            if let authToken = UserDefaults.getAuthToken() {
                print("Auth Token:: \(authToken)")
                httpHeader = [ApiClient.accessTokenHeader: "Bearer" + " " +  authToken]
                
            }
            let requestUrl = HttpNetworkRoute.baseApi + resource.url
            print("REQUEST URL:\(requestUrl)")
            print("REQUEST PARAMS: \(resource.params ?? Parameters())")
            Alamofire.request(requestUrl, method: resource.httpMethod, parameters: resource.params, encoding: JSONEncoding.default, headers: httpHeader).responseJSON { (jsonResponse) in
                switch jsonResponse.result {
                case .success(let value):
                    let status = jsonResponse.response?.statusCode

                    if status == 200 {
                        let modelObj = T.init(json: JSON(value))
                        completionHandler(.success(modelObj))
                    } else {
                        var modelObj = Errormodel.init(json: JSON(value))
                        modelObj.statusCode = jsonResponse.response?.statusCode ?? 0
                        completionHandler(.failure(modelObj))
                    }
                case .failure(let error):
                    let modelObj = Errormodel.init(json: JSON(error))
                    completionHandler(.failure(modelObj))
                }
            }
        }
        
    }
}
