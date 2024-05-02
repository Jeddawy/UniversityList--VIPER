//
//  UniversityDetailsViewController.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import UIKit

class UniversityDetailsViewController: UIViewController {
    var presenter: UniversityDetailsPresenterProtocol?
    
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var universityStateLabel: UILabel!
    
    @IBOutlet weak var universityCountryCodeLabel: UILabel!
    @IBOutlet weak var webPageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.load()
        // Do any additional setup after loading the view.
    }
    // MARK: - Custom Setter
    public func setPresenter(presenter: UniversityDetailsPresenterProtocol) {
        self.presenter = presenter
    }

}

extension UniversityDetailsViewController: UniversityDetailsViewProtocol{
    
    func loadData(model: UniversityResponse) {
        universityStateLabel.text = model.state
        universityLabel.text = model.name
        universityCountryCodeLabel.text = model.countyCode
        webPageLabel.text = model.webPages?.first ?? ""
    }
    
}
