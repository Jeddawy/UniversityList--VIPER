//
//  UniversitiesManager.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import Foundation
import RealmSwift

class UniversityRealm: Object, RealmEntity {
    typealias EntityType = UniversityResponse
    
  @Persisted(primaryKey: true) var name: String?
  @Persisted var country: String?
  @Persisted var state: String?
  @Persisted var webPages: List<String?>
  @Persisted var countyCode: String?
    
    convenience required init(entity: EntityType) {
        self.init()
        self.name = entity.name
        self.country = entity.country
        self.state = entity.state
        self.webPages = entity.webPages!
        self.countyCode = entity.countyCode
    }
    
    var entityObject: UniversityResponse {
        return UniversityResponse(entity: self)
    }
    
    override class func primaryKey() -> String? {
        return "name"
    }
}
