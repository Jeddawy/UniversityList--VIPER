//
//  APIRouter.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible{
    
    case getUniversities
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .getUniversities:
            return URLs.url
        default:
            return ""
        }
    }
    
    // MARK: - HttpMethod
    private var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        default:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: try path.asURL())
        
        // HTTP method
        urlRequest.httpMethod = method.rawValue
        
        // Headers
        switch self {
        default:
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            break
        }
      
        print((urlRequest.headers))
        print(urlRequest.allHTTPHeaderFields)
        print(parameters)
        // HTTP Body
        let httpBody: Data? = {
            switch self {
            default:
                return nil
            }
        }()
        
        urlRequest.httpBody = httpBody
        
        // Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get, .delete:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        print(try encoding.encode(urlRequest, with: parameters))
        return try encoding.encode(urlRequest, with: parameters)
    }
}
