//
//  UniversityDetailsPresenter.swift
//  UniversitySolution
//
//  Created by ADEL ELGAZAR on 02/05/2024.
//

import Foundation

class UniversityDetailsPresenter: UniversityDetailsPresenterProtocol {
    
    weak var view: UniversityDetailsViewProtocol?
    var interactor: UniversityDetailsInteractorProtocol?
    var router: UniversityDetailsRouterProtocol?
    var university: University?
    
    func viewDidLoad() {
        guard let university = university else { return }
        displayUniversityDetails(university: university)
    }
    
    func displayUniversityDetails(university: University) {
        view?.displayUniversityDetails(university: university)
    }
}
