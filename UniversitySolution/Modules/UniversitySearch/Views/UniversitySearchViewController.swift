//
//  UniversitySearchViewController.swift
//  UniversitySolution
//
//  Created by ADEL ELGAZAR on 02/05/2024.
//

import UIKit

class UniversitySearchViewController: UIViewController, UniversitySearchViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: UniversitySearchPresenterProtocol?
    private var universities: [University] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UniversityCell", bundle: nil), forCellReuseIdentifier: "UniversityCell")
        presenter?.viewDidLoad()
    }

    // UniversitySearchViewProtocol methods
    func showLoading() {
        // Show loading indicator
    }

    func hideLoading() {
        // Hide loading indicator
    }

    func showUniversities(_ universities: [University]) {
        self.universities = universities
        tableView.reloadData()
    }

    func showError(_ error: String) {
        // Display error message
    }
}

extension UniversitySearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityCell", for: indexPath) as? UniversityCell {
            let university = universities[indexPath.row]
            cell.lblUniversityName.text = university.name
            cell.lblUniversityState.text = university.stateProvince ?? ""
            return cell
        }
        return UITableViewCell()
    }
}

extension UniversitySearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter?.presentUniversityDetails(university: universities[indexPath.row])
    }
}
