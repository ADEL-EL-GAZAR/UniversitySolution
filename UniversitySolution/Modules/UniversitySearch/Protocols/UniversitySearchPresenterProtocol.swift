//
//  UniversitySearchPresenterProtocol.swift
//  UniversitySolution
//
//  Created by ADEL ELGAZAR on 02/05/2024.
//

import Foundation

protocol UniversitySearchPresenterProtocol: AnyObject {
    var view: UniversitySearchViewProtocol? { get set }
    var interactor: UniversitySearchInteractorProtocol? { get set }
    var router: UniversitySearchRouterProtocol? { get set }
    
    func viewDidLoad()
    func universitiesFetched(_ universities: [University])
    func universitiesFetchFailed(with error: String)
    func presentUniversityDetails(university: University)
}
