//
//  UniversityDetailsViewController.swift
//  UniversitySolution
//
//  Created by ADEL ELGAZAR on 02/05/2024.
//

import UIKit

class UniversityDetailsViewController: UIViewController, UniversityDetailsViewProtocol {
    var presenter: UniversityDetailsPresenterProtocol?
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblState: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblCountryCode: UILabel!
    @IBOutlet weak var lblWebPage: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    func displayUniversityDetails(university: University) {
        lblName.text = university.name
        lblState.text = university.stateProvince ?? ""
        lblCountry.text = university.country
        lblCountryCode.text = university.alphaTwoCode
        lblWebPage.text = university.webPages.first ?? ""
    }
}
