//
//  UniversitySearchRouterProtocol.swift
//  UniversitySolution
//
//  Created by ADEL ELGAZAR on 02/05/2024.
//

import Foundation
import UIKit

protocol UniversitySearchRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }

    static func createModule() -> UIViewController
    func presentUniversityDetails(university: University)
}
