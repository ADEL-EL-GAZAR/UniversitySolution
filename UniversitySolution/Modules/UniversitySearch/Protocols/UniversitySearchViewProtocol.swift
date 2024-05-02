//
//  UniversitySearchViewProtocol.swift
//  UniversitySolution
//
//  Created by ADEL ELGAZAR on 02/05/2024.
//

import Foundation

protocol UniversitySearchViewProtocol: AnyObject {
    func showLoading()
    func hideLoading()
    func showUniversities(_ universities: [University])
    func showError(_ error: String)
}
