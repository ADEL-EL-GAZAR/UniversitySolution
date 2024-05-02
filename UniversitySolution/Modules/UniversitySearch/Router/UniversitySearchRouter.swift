//
//  UniversitySearchRouter.swift
//  UniversitySolution
//
//  Created by ADEL ELGAZAR on 02/05/2024.
//

import Foundation
import UIKit

class UniversitySearchRouter: UniversitySearchRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = UniversitySearchViewController()
        let presenter: UniversitySearchPresenterProtocol & UniversitySearchInteractorOutputProtocol = UniversitySearchPresenter()
        let interactor: UniversitySearchInteractorProtocol = UniversitySearchInteractor()
        let router: UniversitySearchRouterProtocol = UniversitySearchRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func presentUniversityDetails(university: University) {
        let detailsVC = UniversityDetailsRouter.createModule(university: university)
        viewController?.navigationController?.pushViewController(detailsVC, animated: true)
    }
}
