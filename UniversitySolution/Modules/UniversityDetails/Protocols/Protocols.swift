//
//  UniversityDetailsViewController.swift
//  UniversitySolution
//
//  Created by ADEL ELGAZAR on 02/05/2024.
//

import Foundation
import UIKit


// MARK: - Protocols

protocol UniversityDetailsViewProtocol: AnyObject {
    var presenter: UniversityDetailsPresenterProtocol? { get set }
    func displayUniversityDetails(university: University)
}

protocol UniversityDetailsPresenterProtocol: AnyObject {
    var view: UniversityDetailsViewProtocol? { get set }
    var interactor: UniversityDetailsInteractorProtocol? { get set }
    var router: UniversityDetailsRouterProtocol? { get set }
    var university: University? { get set }
    func viewDidLoad()
}

protocol UniversityDetailsInteractorProtocol: AnyObject {
    var presenter: UniversityDetailsInteractorOutputProtocol? { get set }
}

protocol UniversityDetailsInteractorOutputProtocol: AnyObject {
}

protocol UniversityDetailsRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    static func createModule(university: University) -> UIViewController
}
