//
//  UniversityListEntity.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import Foundation
import RealmSwift

// MARK: - University
class UniversityResponse: Codable, Entity {
    typealias RealmEntityType = UniversityRealm
    var realmObject: UniversityRealm{
        return UniversityRealm(entity: self)
    }
    
    var name: String?
    var country: String?
    var state: String?
    var webPages: List<String?>?
    var countyCode: String?
    
    public init(entity: RealmEntityType) {
        self.name = entity.name
        self.country = entity.country
        self.state = entity.state
        self.webPages = entity.webPages
        self.countyCode = entity.countyCode
    }
    
    required init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      name = try container.decodeIfPresent(String.self, forKey: .name)
      country = try container.decodeIfPresent(String.self, forKey: .country)
      state = try container.decodeIfPresent(String.self, forKey: .state)
      webPages = try container.decodeIfPresent(List<String?>.self, forKey: .webPages)
      countyCode = try container.decodeIfPresent(String.self, forKey: .countyCode)
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case state = "state-province"
        case webPages = "web_pages"
        case country
        case countyCode = "alpha_two_code"
    }
}

