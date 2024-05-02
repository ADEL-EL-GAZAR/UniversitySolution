//
//  University.swift
//  UniversitySolution
//
//  Created by ADEL ELGAZAR on 02/05/2024.
//

import Foundation
import RealmSwift

class University: Object, Codable {
    
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var stateProvince: String?
    var domains: List<String> = List<String>()
    var webPages: List<String> = List<String>()
    @objc dynamic var country: String = ""
    @objc dynamic var alphaTwoCode: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case stateProvince = "state-province"
        case domains
        case webPages = "web_pages"
        case country
        case alphaTwoCode = "alpha_two_code"
    }
}
