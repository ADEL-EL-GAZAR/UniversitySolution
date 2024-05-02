//
//  UniversitySearchInteractorProtocol.swift
//  UniversitySolution
//
//  Created by ADEL ELGAZAR on 02/05/2024.
//

import Foundation

protocol UniversitySearchInteractorProtocol: AnyObject {
    var presenter: UniversitySearchInteractorOutputProtocol? { get set }
    
    func fetchUniversitiesFromAPI(country: String)
    func fetchUniversitiesFromRealm()
}
