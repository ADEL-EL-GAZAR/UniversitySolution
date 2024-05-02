//
//  RealmManager.swift
//  UniversitySolution
//
//  Created by ADEL ELGAZAR on 02/05/2024.
//

import Foundation
import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    private let realm = try! Realm()
    
    func saveUniversities(_ universities: [University]) {
        try! realm.write {
            realm.add(universities)
        }
    }
    
    func loadUniversities() -> [University] {
        Array(realm.objects(University.self))
    }
}
