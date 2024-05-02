//
//  UniversitySearchPresenter.swift
//  UniversitySolution
//
//  Created by ADEL ELGAZAR on 02/05/2024.
//

import Foundation

class UniversitySearchPresenter: UniversitySearchPresenterProtocol, UniversitySearchInteractorOutputProtocol {
    
    var view: UniversitySearchViewProtocol?
    var interactor: UniversitySearchInteractorProtocol?
    var router: UniversitySearchRouterProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        
        // Check network connectivity
        if NetworkConnectivity.isConnectedToInternet {
            interactor?.fetchUniversitiesFromAPI(country: "United Arab Emirates")
        } else {
            interactor?.fetchUniversitiesFromRealm()
        }
    }
    
    func universitiesFetched(_ universities: [University]) {
        view?.hideLoading()
        view?.showUniversities(universities)
    }
    
    func universitiesFetchFailed(with error: String) {
        view?.hideLoading()
        view?.showError(error)
    }
    
    func presentUniversityDetails(university: University) {
        router?.presentUniversityDetails(university: university)
    }
}
