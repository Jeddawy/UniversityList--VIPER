//
//  APIManager.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import Foundation
import Alamofire

class APIManager {
    
    // MARK:- The request function to get results in a closure
    internal static func request<T: Decodable>(_ urlConvertible: URLRequestConvertible, completion:  @escaping (Result<T, Error>, _ code: Int?) -> ()) {
        // Trigger the HttpRequest using AlamoFire
        AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
            switch response.result {
            case .success(let value):
                completion(.success(value), response.response?.statusCode)
            case .failure(let error):
                completion(.failure(error), response.response?.statusCode)
            }
        }
        .responseJSON { response in
            print(urlConvertible.urlRequest?.url?.absoluteString)
            print(response)
            print(response.response?.statusCode)
        }
    }
    static func getUniversities(completion: @escaping (Result<UniversityListBaseResponse, Error>, _ code: Int?) -> ()){
        request(APIRouter.getUniversities){
            response, code in
            completion(response, code)
        }
    }
    
}
