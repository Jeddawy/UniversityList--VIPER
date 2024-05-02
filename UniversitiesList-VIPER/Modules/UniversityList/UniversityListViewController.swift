//
//  UniversityListViewController.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import UIKit

class UniversityListViewController: UIViewController {
    
    internal var presenter: UniversityListPresenterProtocol?
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        presenter?.getUniversities()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Custom Setter
    public func setPresenter(presenter: UniversityListPresenterProtocol) {
        self.presenter = presenter
    }
}

//MARK: TableView
extension UniversityListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.getUnivesitiesCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cellItem = presenter?.getUniversity(at: indexPath.row) {
            let cell = tableView.dequeueReusableCell(withIdentifier: UniversityTableViewCell.ID, for: indexPath) as! UniversityTableViewCell
            cell.bind(model: cellItem)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.didTapCell(at: indexPath.row)
    }
}

extension UniversityListViewController: UniversityListViewProtocol{

    func reloadList() {
        self.tableview.reloadData()
    }
    
    func showLoading() {
        self.view?.showLoader()
    }
    
    func hideLoading() {
        self.view?.hideLoader()

    }
    
    func showErrorMessage(title: String, message: String, statusCode: Int) {
        self.showPopAlert(title: title, message: message)
    }
    
}
//MARK: Helper
extension UniversityListViewController{
    private func setupTableView(){
        self.tableview.delegate = self
        self.tableview.dataSource = self
        let nib = UINib(nibName: UniversityTableViewCell.ID, bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: UniversityTableViewCell.ID)
    }
}
