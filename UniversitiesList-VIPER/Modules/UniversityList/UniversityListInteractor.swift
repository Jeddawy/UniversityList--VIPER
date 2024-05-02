//
//  UniversityListInteractor.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import Foundation

class UniversityListInteractor{
    internal weak var presenter: UniversityListInteractorOutputProtocol?
    
    // MARK: - Custom Setter
    public func setPresenter (presenter: UniversityListInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension UniversityListInteractor: UniversityListInteractorInputProtocol{
    func getUniversityList() {
        APIManager.getUniversities { response, code in
            switch response {
            case .success(let result):
                if code == 200, !result.isEmpty {
                    self.presenter?.universitiesFetchedSuccessfully(result, statusCode: code ?? 200)
                }else{
                    //check if offline , else show the error.
                    self.presenter?.universitiesFetchedUnSuccessfully(title: "Error", errorMessage: "Something went wrong , Please Try Again Later.", statusCode: code ?? 0)
                }
            case .failure(let failure):
                self.presenter?.universitiesFetchedUnSuccessfully(title: "Error", errorMessage: "Something went wrong , Please Try Again Later.", statusCode: code ?? 0)
            }
        }
    }
    
    
}
