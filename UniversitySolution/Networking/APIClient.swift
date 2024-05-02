//
//  APIClient.swift
//  UniversitySolution
//
//  Created by ADEL ELGAZAR on 02/05/2024.
//

import Foundation
import Alamofire

class APIClient {
    static let shared = APIClient()
    
    func fetchUniversities(country: String, completion: @escaping ([University]?, Error?) -> Void) {
        AF.request("http://universities.hipolabs.com/search?country=\(country)")
            .validate()
            .responseDecodable(of: [University].self) { response in
                switch response.result {
                case .success(let universities):
                    completion(universities, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
}
