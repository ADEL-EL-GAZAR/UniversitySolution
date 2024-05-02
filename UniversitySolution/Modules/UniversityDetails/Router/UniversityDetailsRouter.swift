//
//  UniversityDetailsRouter.swift
//  UniversitySolution
//
//  Created by ADEL ELGAZAR on 02/05/2024.
//

import Foundation
import UIKit

class UniversityDetailsRouter: UniversityDetailsRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(university: University) -> UIViewController {
        let view = UniversityDetailsViewController()
        let presenter = UniversityDetailsPresenter()
        let interactor: UniversityDetailsInteractorProtocol = UniversityDetailsInteractor()
        let router: UniversityDetailsRouterProtocol = UniversityDetailsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        //        interactor.presenter = presenter
        router.viewController = view
        presenter.university = university
        
        return view
    }
}
