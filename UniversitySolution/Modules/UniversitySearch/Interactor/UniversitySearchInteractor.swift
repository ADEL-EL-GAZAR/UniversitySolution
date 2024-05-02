//
//  UniversitySearchInteractor.swift
//  UniversitySolution
//
//  Created by ADEL ELGAZAR on 02/05/2024.
//

import Foundation
import RealmSwift

class UniversitySearchInteractor: UniversitySearchInteractorProtocol {
    
    var presenter: UniversitySearchInteractorOutputProtocol?
    var apiClient = APIClient.shared
    
    func fetchUniversitiesFromAPI(country: String) {
        apiClient.fetchUniversities(country: country) { universities, error in
            if let error = error {
                self.presenter?.universitiesFetchFailed(with: error.localizedDescription)
            }
            guard let universities = universities else {
                self.presenter?.universitiesFetchFailed(with: "No data received")
                return
            }
            
            // Save universities to Realm
            self.saveUniversitiesToRealm(universities)
            
            self.presenter?.universitiesFetched(universities)
        }
    }
    
    func fetchUniversitiesFromRealm() {
        do {
            let realm = try Realm()
            let universities = Array(realm.objects(University.self))
            presenter?.universitiesFetched(universities)
        } catch {
            presenter?.universitiesFetchFailed(with: error.localizedDescription)
        }
    }
    
    private func saveUniversitiesToRealm(_ universities: [University]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(universities, update: .modified) // Use update: .modified to update existing universities
            }
        } catch {
            print("Error saving universities to Realm: \(error)")
        }
    }
}
