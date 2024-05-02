//
//  UniversitySearchInteractorOutputProtocol.swift
//  UniversitySolution
//
//  Created by ADEL ELGAZAR on 02/05/2024.
//

import Foundation

protocol UniversitySearchInteractorOutputProtocol: AnyObject {
    func universitiesFetched(_ universities: [University])
    func universitiesFetchFailed(with error: String)
}
