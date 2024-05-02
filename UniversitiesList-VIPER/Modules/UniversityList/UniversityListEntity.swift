//
//  UniversityListEntity.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import Foundation

// MARK: - University
struct UniversityResponse: Codable {
    
    var name: String?
    var country: String?
    var state: String?
    var webPages: [String]?
    var countyCode: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case state = "state-province"
        case webPages = "web_pages"
        case country
        case countyCode = "alpha_two_code"
    }
}

