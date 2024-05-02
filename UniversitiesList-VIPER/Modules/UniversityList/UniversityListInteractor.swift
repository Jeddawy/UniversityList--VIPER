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
                    self.saveArticlesInRealm(result)
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
    
    func getArticlesFromRealm() -> [UniversityResponse] {
        let repository = RealmManager<UniversityRealm>()
        return repository.fetchAll()
    }

}

//MARK: Helper
extension UniversityListInteractor{
    
   private func saveArticlesInRealm(_ universityList: [UniversityResponse]) {
        do {
            let repository = RealmManager<UniversityRealm>()
            try repository.deleteAll()
            try repository.save(items: universityList)
//            completion?()
        } catch let error {
            print(error.localizedDescription)
//            completion?()
        }
    }
}
