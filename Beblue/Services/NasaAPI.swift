//
//  NasaAPI.swift
//  Beblue
//
//  Created by Fernando Gallo on 17/07/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation
import Moya

let nasaBaseURL = URL(string: Constants.NasaAPI.endpoint)!

enum NasaAPI {
    case getPhotos(rover: String, date: String)
}

extension NasaAPI: TargetType {
    
    var baseURL: URL {
        return nasaBaseURL
    }
    
    var path: String {
        switch self {
        case .getPhotos(let rover, _):
            return "/" + rover + "/photos"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPhotos:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getPhotos(_, let date):
            return .requestParameters(parameters: [Constants.Parameters.earthDate: date,
                                                   Constants.Parameters.apiKey: Constants.NasaAPI.apiKey],
                                      encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}

let NasaProvider = MoyaProvider<NasaAPI>(plugins:
    [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])

func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data
    }
}
